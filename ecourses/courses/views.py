from django.conf import settings
# from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse, Http404
from rest_framework import viewsets, permissions, generics
from rest_framework.parsers import MultiPartParser, JSONParser
from rest_framework.views import APIView
from django.core.exceptions import ObjectDoesNotExist
from .paginator import *
from .serializers import *
from .permissions import *
from .models import *


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [UserPermission]
    pagination_class = UserPaginator

    @action(methods=['get'], detail=False, url_path="current-user", url_name='get-current-user')
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user, context={"request": request}).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, url_path="course", url_name='get-courses-registered')
    def get_courses_registered(self, request):
        courses = Student_Course.objects.filter(student=request.user.id, access=True)
        list_course = []
        try:
            if courses is not None:
                if (len(courses) > 0):
                    for i in courses:
                        list_course.append(i.course)
                else:
                    return Response(status=status.HTTP_404_NOT_FOUND,
                                    data={"mess": "the user has not registered for any courses yet"})
            page = self.paginate_queryset(list_course)
            if page is not None:
                serializer = CourseSerializerRequestUser(page, many=True, context={"request": request})
                return self.get_paginated_response(serializer.data)
        except:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    @action(methods=['get'], detail=False, url_path="unactive-user", url_name="unactive-user")
    def unactive_user(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            u.is_active = False
            u.save()
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed")

    @action(methods=['post'], detail=False, url_path='change-password')
    def change_password(self, request):
        try:
            try:
                u = User.objects.get(pk=request.user.id)
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="get!")
            try:
                u.set_password(request.data['password'])
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="change!")
            try:
                u.save()
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="save!")
            return Response(status=status.HTTP_200_OK, data="Change password success!")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed!")

    @action(methods=['get'], detail=False, url_path="follower", url_name="get-follower")
    def follower(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            flr = u.followers
            return Response(status=status.HTTP_200_OK,
                            data=InfoTeacherFollowedSerializer(flr, many=True, context={'request': request}).data)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed")

    @action(methods=['get'], detail=False, url_path="upgrade-user", url_name="upgrade-user")
    def upgrade_user(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            t = Teacher.objects.get_or_create(user=u)
            if not (t[1]):
                return Response(status=status.HTTP_200_OK, data="User was an instructor account")
            t[0].save()
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed")

    @action(methods=['post'], detail=False, url_path="follow", url_name="follow")
    def follow(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            teacher_id = request.data['teacher_id']
            t = Teacher.objects.get(user=teacher_id)
            if not t is not None:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any teacher pk = " + teacher_id)
            follow = Follow.objects.get_or_create(student=u, teacher=t)
            if not (follow[1]):
                return Response(status=status.HTTP_200_OK, data="You already follow this account")
            follow[0].save()
            return Response(status=status.HTTP_200_OK, data="Followed")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed, Please check the request again')

    # điều kiện để rating?
    # api chưa sài
    @action(methods=['post'], detail=False, url_path="rating", url_name="rating")
    def rating(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            course_id = request.data['course_id']
            try:
                course = Course.objects.get(pk=course_id)
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + course_id)
            try:
                join = Student_Course.objects.get(student=u, course=course)
            except:
                return Response(status=status.HTTP_406_NOT_ACCEPTABLE, data="User has not join this course")
            point = request.data['rating_point']
            if point <= 5 and point >= 0:
                join.rate = point
                join.save()
                return Response(status=status.HTTP_200_OK, data="Access to course successfully")
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST,
                                data="The rating points only accepts values from 0 to 5")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    # def get_permissions(self):
    #     if self.action == 'get_current_user':
    #         return [permissions.IsAuthenticated()]
    #
    #     return [permissions.AllowAny()]


class TeacherViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.UpdateAPIView):
    queryset = Teacher.objects.filter(activeTeacher=True)
    serializer_class = TeacherSerializer
    permission_classes = [TeacherPermission]

    @action(methods=['get'], detail=False, url_path="current-teacher", url_name='get-current-teacher')
    def get_current_user(self, request):
        t = Teacher.objects.get(pk=request.user.id)
        return Response(self.serializer_class(t, context={"request": request}).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, name='Get list Course', url_path='get-list-courses',
            url_name='get-list-courses', )
    def get_list_courses(self, request, pk=None):
        self.pagination_class = CoursesPanigatior
        # kiểm tra xem user có phải là teacher hay ko
        if Teacher.objects.filter(user=request.user).exists():
            teacher = Teacher.objects.get(user=request.user)

            c = teacher.course.order_by('-created_date')
            kw = request.query_params.get('kw')

            if kw is not None:
                c = c.filter(name_course__icontains=kw)

            page = self.paginate_queryset(c)
            serializer = CourseSerializer(page, many=True, context={'request': request})
            return self.get_paginated_response(serializer.data)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN, data={"mess": "You are not Teacher"})

    # @action(methods=['get'], detail=False, name='Get list Course', url_path='get-list-courses',
    #         url_name='get-list-courses', )
    # def get_list_courses(self, request, pk=None):
    #     teacher = self.get_object()
    #     c = teacher.course
    #     return Response(status=status.HTTP_200_OK,
    #                     data=CourseSerializer(c, many=True, context={'request': request}).data)

    @action(methods=['post'], detail=False, name='teacher', url_path='register-teacher', url_name='register-teacher')
    def register_teacher(self, request):
        try:
            data = request.data
            user = User.objects.create_user(username=data['username'],
                                            email=data['email'],
                                            password=data['password'])
            user.set_password(data['password'])
            user.save()
            job = None
            if data['job'] is not None:
                job = Job.objects.get_or_create(name_job=data['job'])[0]
                job.save()
            teacher = Teacher.objects.create(user=user, job=job)
            teacher.save()
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="create failed")

        return Response(status=status.HTTP_201_CREATED, data=self.serializer_class(teacher).data)


class TagViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    pagination_class = BasePaginator


class CourseViewSet(viewsets.ViewSet, generics.ListAPIView, generics.UpdateAPIView, generics.CreateAPIView,
                    generics.DestroyAPIView):
    queryset = Course.objects.all()
    query = Course.objects
    serializer_class = CourseSerializer
    pagination_class = BasePaginator
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [CoursePermission]



    def retrieve(self, request, pk=None):
        try:
            queryset = self.query.get(pk=pk, active=True)
            serializer = CoursesItemSerializer(queryset, context={"request": request})
            return Response(serializer.data)
        except:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "Course Not Found"})

    def list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset().filter(active=True))

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @action(methods=['post'], detail=False)
    def create_course(self, request):
        # kiểm tra xem có phải là Teacher hay không

        print(Teacher.objects.filter(user=request.user).exists())
        if Teacher.objects.filter(user=request.user).exists():
            name_course = request.data.get('name_course')
            category = request.data.get('category')
            teacher = Teacher.objects.get(user=request.user)
            fee = request.data.get('fee')
            is_public = str(request.data.get('is_public')).title()
            description = request.data.get('description')
            subject = request.data.get('subject')
            image = self.request.FILES.get('image')
            tags = request.data.get('tags')
            print(tags)
            if name_course is None or category is None or fee is None or is_public is None or image is None or \
                    description is None or subject is None:
                return Response(status=status.HTTP_400_BAD_REQUEST,
                                data={"mess": "name_course , category , fee ,image ,"
                                              "is_public ,description , subject"
                                              " can not be Null"})
            else:
                try:
                    try:
                        cate = Category.objects.get(pk=category)
                    except ObjectDoesNotExist:
                        return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "Don't have category with id "
                                                                                          +
                                                                                          str(category)})
                    c = Course.objects.create(is_public=is_public,
                                              fee=fee,
                                              teacher=teacher,
                                              category=cate,
                                              name_course=name_course,
                                              image=image,
                                              description=description,
                                              subject=subject
                                              )
                    c.save()
                    return Response(status=status.HTTP_201_CREATED,
                                    data={"mess": "The course has been created successfully"})
                except:
                    return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR, data={"mess": "Failed"})
        else:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "You are not an Teacher, so you cannot take action create course"})

        # try:
        #     u = User.objects.get(pk=request.user.id)
        #     t = Teacher.objects.get(user=u)
        #     cate = Category.objects.get(pk=request.data['category_id'])
        #     try:
        #         c = Course.objects.create(is_public=request.data['is_public'],
        #                                   fee=request.data['fee'],
        #                                   teacher=t,
        #                                   category=cate,
        #                                   name_course=request.data['name_course'],
        #                                   image=request.FILES['image'])
        #         c.save()
        #     except:
        #         return Response(status=status.HTTP_400_BAD_REQUEST, data="Info of course invalid!")
        #     return Response(status=status.HTTP_201_CREATED, data="Created")
        # except:
        #     return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed")

    @action(methods=['get'], detail=True, name='Hide this courses', url_path='hide-courses', url_name='hide-courses')
    def hide_courses(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.active = False
            c.save()
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, name='Open this courses', url_path='open-courses', url_name='open-courses')
    def open_courses(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.active = True
            c.save()
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    # Lấy bài học của khóa học.
    @action(methods=['get'], detail=True, name='lesson', url_path='lesson', url_name='lesson')
    def lesson(self, request, pk=None):
        self.pagination_class = LessonPaginator
        try:
            ## sắp xếp theo ngày tạo mới nhất và active = True
            lessons = Course.objects.get(pk=pk).lessons.filter(active=True).order_by('-created_date')
            kw = request.query_params.get('kw')
            if kw is not None:
                lessons = lessons.filter(subject__icontains=kw)

            page = self.paginate_queryset(lessons)
            if page is not None:
                serializer = LessonSerializer(page, many=True, context={"request": request})
                return self.get_paginated_response(
                    data={"info": CourseSerializer(Course.objects.get(pk=pk)).data, "list_lesson": serializer.data})
        except:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"Course is not found"})

    @action(methods=['get'], detail=True, name='complete_lesson', url_path='complete', url_name='complete')
    def complete_lesson(self, request, pk=None):
        self.pagination_class = LessonPaginator
        if Course.objects.get(pk=pk).teacher.user == request.user:
            return Response(status=status.HTTP_403_FORBIDDEN, data={"mess": "You are the creator of the course!"})
        # kiểm tra xem học sinh đã được xác nhận chưa
        try:
            if Course.objects.get(pk=pk).student_join.get(student=request.user).access == False:
                return Response(status=status.HTTP_403_FORBIDDEN,
                                data={"mess": "The Teacher has not yet confirm you to the course"})
        except ObjectDoesNotExist:
            ## có thể xảy ra trường hợp học sinh chưa đăng ký bắt lỗi xảy ra trường hợp học sinh chưa đăng ký
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "You have not registered for the course"})
        try:
            ## sắp xếp theo ngày tạo mới nhất và active = True
            lessons = Course.objects.get(pk=pk).lessons.filter(active=True).order_by('-created_date')
            kw = request.query_params.get('kw')
            if kw is not None:
                lessons = lessons.filter(subject__icontains=kw)
            page = self.paginate_queryset(lessons)
            if page is not None:
                serializer = LessonSerializerRequestUser(page, many=True, context={"request": request})
                return self.get_paginated_response(
                    data={"info": CourseSerializerRequestUser(Course.objects.get(pk=pk),
                                                              context={"request": request}).data,
                          "list_lesson": serializer.data})
        except:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "Course is not found"})

    @action(methods=['get'], detail=True, url_path='change-status', url_name='change-status')
    def change_status(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.is_public = not (c.is_public)
            c.save()
            return Response(status=status.HTTP_200_OK, data="Success")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    # add tags vào khóa học
    @action(methods=['post'], detail=True, name='add tag', url_path='add-tag', url_name='add-tag')
    def add_tag(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            self.check_object_permissions(request, c)

        except:

            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            tags = request.data.get("tags")
            listTag = []
            if tags is not None:
                for tag in tags:
                    t, _ = Tag.objects.get_or_create(name=tag)
                    listTag.append(t)
            c.tags.set(listTag)
            c.save()
            return Response(status=status.HTTP_201_CREATED,
                            data=CoursesItemSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, url_path="access-course", url_name="access-course")
    def access_course(self, request, pk=None):
        try:
            u = User.objects.get(pk=request.user.id)
            course = Course.objects.get(pk=pk)
            try:
                teacher = course.teacher.user
                if teacher == u:
                    return Response(status=status.HTTP_400_BAD_REQUEST, data="Teacher id duplicate with student id")
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="err")
            if course is None:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + pk)
            access = Student_Course.objects.get_or_create(student=u, course=course)
            if not (access[1]):
                return Response(status=status.HTTP_200_OK, data="User joined this course")
            if course.is_public:
                access[0].save()
            else:
                access[0].access = False
                access[0].save()
                return Response(status=status.HTTP_200_OK, data="This course is private, please wait owner access")
            return Response(status=status.HTTP_200_OK, data="Access to course successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['get'], detail=True, name="Get students access to course", url_path="get-request",
            url_name="get-request")
    def get_request(self, request, pk=None):
        try:
            course = Course.objects.get(pk=pk)
            self.check_object_permissions(request, course)
            if not course is not None:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + pk)
            student_course = Student_Course.objects.filter(course=course)
            if not (student_course):
                return Response(status=status.HTTP_200_OK, data="This course don't have student access to")
            listSt = []
            for sc in student_course:
                if not sc.access:
                    listSt.append(sc)
            if not listSt:
                return Response(status=status.HTTP_200_OK, data="No have new access")
            else:
                return Response(status=status.HTTP_200_OK, data=Student_CourseSerializer(listSt, many=True).data)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, name='delete student', url_path='delete-student', url_name='delete-student')
    def delete_student(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            teacher = User.objects.get(pk=request.user.id)
            self.check_object_permissions(request, c)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any course pk = " + pk)
        else:
            try:
                student = User.objects.get(pk=request.data["student_id"])
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST,
                                data="No student has pk =" + str(request.data["student_id"]))
            try:
                student_course = Student_Course.objects.get(course=c, student=student)
            except:
                return Response(status=status.HTTP_200_OK, data="This student don't access this course")
            student_course.delete()

            return Response(status=status.HTTP_201_CREATED,
                            data="Delete success")

    @action(methods=['post'], detail=True, name='accept student join to private course', url_path='accept-student',
            url_name='accept-student')
    def accept_student(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            teacher = User.objects.get(pk=request.user.id)
            self.check_object_permissions(request, c)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any course pk = " + pk)
        else:
            try:
                student = User.objects.get(pk=request.data["student_id"])
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST,
                                data="No student has pk =" + str(request.data["student_id"]))
            try:
                student_course = Student_Course.objects.get(course=c, student=student)
            except:
                return Response(status=status.HTTP_200_OK, data="This student don't access this course")
            student_course.access = True
            student_course.save()
            return Response(status=status.HTTP_201_CREATED,
                            data="Accept student success")

    @action(methods=["post"], detail=True, url_name="rating", url_path='rating')
    def user_rating(self, request, pk=None):
        self.pagination_class = [IsAuthenticated]
        # kiểm tra có phải là giáo viên của khóa học
        if self.get_object().teacher.user == request.user:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "You are the creator of the course cannot be rate"})
        # kiểm tra xem student đã join khóa học chưa
        if self.get_object().student_join.filter(student=request.user):
            # kiểm tra xem khóa học student đã được access vào khóa học hay chưa
            if self.get_object().student_join.filter(student=request.user, access=True):
                student_course = self.get_object().student_join.get(student=request.user)
                # trường hợp khi khóa học không có bất cứ bài học nào.
                if self.get_object().lessons.count() == 0:
                    return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR,
                                    data={"mess": "Lessons in the course are empty so the course cannot be rated."})
                else:
                    count_lesson = self.get_object().lessons.count()
                    count_lesson_complete = 0
                    lessons = self.get_object().lessons.all()
                    for lesson in lessons:
                        if lesson.lesson_student.filter(student=request.user).exists():
                            if lesson.lesson_student.get(student=request.user).complete:
                                count_lesson_complete = count_lesson_complete + 1
                    course_complete = round(count_lesson_complete / count_lesson * 100, 0)
                    # học viên phải hoàn thành trên 50% tổng số bài học thì mới được rating
                    if course_complete >= 50:
                        rate = request.data.get("rate")
                        review = request.data.get("review")
                        if rate is not None and review is not None:
                            if int(rate) <= 5 and int(rate) >= 0:
                                student_course.rate = rate
                                student_course.review = review
                                student_course.save()
                                return Response(status=status.HTTP_201_CREATED, data="Successfully")
                            else:
                                return Response(status=status.HTTP_400_BAD_REQUEST,
                                                data={"mess": "The rating points only accepts values from 0 to 5"})
                        else:
                            return Response(status=status.HTTP_400_BAD_REQUEST,
                                            data={"mess": "review and rate is not empty"})
                    else:
                        return Response(status=status.HTTP_403_FORBIDDEN, data={
                            "mess": "You have not completed 50% of the course so you cannot rate the course"})
            else:
                return Response(status=status.HTTP_403_FORBIDDEN, data={""})
        else:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "The course has not been registered by you"})

    # Dùng để xem thông tin chi tiết Khóa Học để teacher có thể chỉnh sửa chúng.

    @action(methods=['get'], detail=True, url_path='detail-course-teacher', url_name='detail-course-teacher')
    def get_detail_course_teacher(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)
        except:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "Course Not Found"})


# def get_queryset(self):
#         queryset = Course.objects.all()
#         cate_id = self.request.query_params.get('category_id', None)
#         kw = self.request.query_params.get('kw', None)
#
#         if cate_id:
#             queryset = queryset.filter(category=cate_id)
#         if kw:
#             queryset = queryset.filter(description__icontains=kw)
#         return queryset


class CategoryViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class LessonViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.DestroyAPIView):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [IsAuthenticated]

    ## ghi đè lại lấy chi tiết bài học
    def retrieve(self, request, pk=None):
        try:
            self.serializer_class = DetailLessonSerializer
            instance = self.get_object()
            course = Course.objects.get(pk=instance.course.pk)
            ## kiểm tra xem có phải là giáo viên không.
            if request.user == course.teacher.user:
                serializer = self.get_serializer(instance)
                return Response(serializer.data)
            else:
                student_course = Student_Course.objects.filter(course=instance.course)
                ## kiểm tra bằng hàm filter xem học sinh đã đăng ký khóa học này chưa
                result = filter(lambda x: x.student == request.user and x.access == True, student_course)
                if list(result):
                    serializer = DetailLessonSerializerRequestUser(instance, context={"request": request});
                    return Response(serializer.data)
                else:
                    return Response(status=status.HTTP_403_FORBIDDEN,
                                    data={"mess": "The lesson is in a course you haven't registered yet"})
        except ObjectDoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "No courses with id" + str(pk)})

    @action(methods=['post'], detail=True, url_path="add-video", url_name="add-video")
    def add_video(self, request, pk=None):
        try:
            lesson = Lesson.objects.get(pk=pk)
            subject = request.data['subject']
            url = request.data['url']
            video = Video.objects.get_or_create(url_video=url, subject=subject)
            lesson.list_video = video
            lesson.save()
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, url_path="add-file", url_name="add-file")
    def add_file(self, request, pk=None):
        try:
            lesson = Lesson.objects.get(pk=pk)
            file = request.data['file']
            subject = request.data['subject']
            file = File.objects.get_or_create(file=file, subject=subject)
            lesson.list_file = file
            lesson.save()
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, url_path="add-homework", url_name="add-homework")
    def add_homework(self, request, pk=None):
        try:
            lesson = Lesson.objects.get(pk=pk)
            homework = HomeWork.objects.create(subject=request.data['subject'],
                                               file=request.data['file'],
                                               content=request.data['content'],
                                               author_teacher=request.user,
                                               lesson=lesson)
            homework.save()
            return Response(status=status.HTTP_201_CREATED, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, url_path="complete-lesson", url_name="complete-lesson")
    def complete_lesson(self, request, pk=None):
        print(request.user)
        ## check xem user có nằm trong khóa học được đăng ký hay không
        if self.get_object().course.student_join.filter(student=request.user, access=True).exists():
            lesson = self.get_object()
            ## kiểm tra xem user đã hoàn thành bài học hay chưa
            if lesson.lesson_student.filter(student=request.user).exists() == False:
                complete = Student_Lesson.objects.create(lesson=lesson, student=request.user, complete=True)
                complete.save()
                return Response(status=status.HTTP_201_CREATED, data={"mess": "Successfully"})
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "You have completed the lesson"})
        else:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "The lesson is in a course you haven't registered yet"})


class HomeWorkViewSet(viewsets.ViewSet):
    queryset = HomeWork.objects.all()
    serializer_class = HomeWorkSerializer


class FileViewSet(viewsets.ViewSet):
    queryset = File.objects.all()
    serializer_class = FileSerializer


class VideoViewSet(viewsets.ViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer


class FollowViewSet(viewsets.ViewSet):
    queryset = Follow.objects.all()
    serializer_class = FollowSerializer


class SkillViewSet(viewsets.ViewSet):
    queryset = Skill.objects.all()
    serializer_class = SkillSerializer


class JobViewSet(viewsets.ViewSet):
    queryset = Job.objects.all()
    serializer_class = JobSerializer


class GroupChatViewSet(viewsets.ViewSet):
    queryset = GroupChat.objects.all()
    serializer_class = GroupChatSerializer


class MessageViewSet(viewsets.ViewSet):
    queryset = Message.objects.all()
    serializer_class = MessSerializer


class JoinViewSet(viewsets.ViewSet):
    queryset = Student_Course.objects.all()
    serializer_class = JoinSerializer


def index(request):
    return HttpResponse("e-courser app")
