import json
from django.db.models import Count
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse, Http404
from rest_framework import viewsets, permissions, generics
from rest_framework.parsers import MultiPartParser, JSONParser
from rest_framework.views import APIView
from django.core.exceptions import ObjectDoesNotExist
from django.db.utils import IntegrityError
from datetime import date, datetime
from django.conf import settings
from django.utils.timezone import make_aware
from .paginator import *
from .serializers import *
from .permissions import *
from .models import *
from django.core.mail import send_mail
from django.conf.global_settings import EMAIL_HOST_USER


class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [UserPermission]
    pagination_class = UserPaginator

    @action(methods=['post'], detail=False, url_path='reset-password', url_name='reset-password')
    def reset_password(self, request):
        data = request.data
        username = data.get('username')
        email = data.get('email')
        if username is not None and email is not None:
            user = User.objects.filter(username=username, email=email)
            if user.exists():
                u = User.objects.get(username=username, email=email)
                password = 'reset@123'
                u.set_password(password)
                u.save()
                subject = 'Reset pasword TTdemy'
                message = 'Your password has been reset,Password : ' + password
                send_mail(subject, message, EMAIL_HOST_USER, [email], fail_silently=False)
                return Response(status=status.HTTP_200_OK, data={'mess': "Your password has been reset, "
                                                                         "please check your email to get your password"})
            else:
                return Response(status=status.HTTP_404_NOT_FOUND, data={'mess': 'Cannot find user with username: '
                                                                                + str(username) + ' and email: '
                                                                                + str(email) + ' in the system'})
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={'mess': 'username and email required'})

    @action(methods=['get'], detail=False, url_path="current-user", url_name='get-current-user')
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user, context={"request": request}).data,
                        status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, url_path="course", url_name='get-courses-registered')
    def get_courses_registered(self, request):
        courses = Student_Course.objects.filter(student=request.user.id, access=True)
        list_course = []
        try:
            if courses.exists():
                if (len(courses) > 0):
                    for i in courses:
                        if i.course.active == True:
                            list_course.append(i.course)
                else:
                    return Response(status=status.HTTP_404_NOT_FOUND,
                                    data={"mess": "the user has not registered for any courses yet"})
            if len(list_course) <= 0:
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

    ## check l???i h??m n??y
    @action(methods=['post'], detail=False, url_path='change-password')
    def change_password(self, request):
        try:
            try:
                u = User.objects.get(pk=request.user.id)
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="user not found")
            try:
                u.set_password(request.data['password'])
            except:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="failed")
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

    # ??i???u ki???n ????? rating?
    # api ch??a s??i
    # @action(methods=['post'], detail=False, url_path="rating", url_name="rating")
    # def rating(self, request):
    #     try:
    #         u = User.objects.get(pk=request.user.id)
    #         course_id = request.data['course_id']
    #         try:
    #             course = Course.objects.get(pk=course_id)
    #         except:
    #             return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + course_id)
    #         try:
    #             join = Student_Course.objects.get(student=u, course=course)
    #         except:
    #             return Response(status=status.HTTP_406_NOT_ACCEPTABLE, data="User has not join this course")
    #         point = request.data['rating_point']
    #         if point <= 5 and point >= 0:
    #             join.rate = point
    #             join.save()
    #             return Response(status=status.HTTP_200_OK, data="Access to course successfully")
    #         else:
    #             return Response(status=status.HTTP_400_BAD_REQUEST,
    #                             data="The rating points only accepts values from 0 to 5")
    #     except:
    #         return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

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
        try:
            t = Teacher.objects.get(pk=request.user.id)
            return Response(self.serializer_class(t, context={"request": request}).data,
                            status=status.HTTP_200_OK)
        except ObjectDoesNotExist:
            return Response(status=status.HTTP_403_FORBIDDEN, data={"mess": "You are not a teacher"})

    @action(methods=['get'], detail=False, name='Get list Course', url_path='get-list-courses',
            url_name='get-list-courses', )
    def get_list_courses(self, request, pk=None):
        self.pagination_class = CoursesPanigatior
        # ki???m tra xem user c?? ph???i l?? teacher hay ko
        if Teacher.objects.filter(user=request.user, activeTeacher=True).exists():
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
        data = request.data
        user = request.user
        if data.get('first_name') is not None:
            user.first_name = data.get('first_name')
        if data.get('last_name') is not None:
            user.last_name = data.get('last_name')
        if data.get('email') is not None:
            user.email = data.get('email')
        user.save()
        # job = None
        teacher = Teacher.objects.get_or_create(user=user)[0]
        if data.get('job') is not None:
            job = Job.objects.get_or_create(name_job=data.get('job'))[0]
            teacher.job = job
        skills = data.get('skills')

        if skills is not None:
            list_skill = []
            for skill in skills:
                s, _ = Skill.objects.get_or_create(name_skill=skill)
                list_skill.append(s)
            teacher.skills.set(list_skill)
        teacher.save()
        return Response(status=status.HTTP_201_CREATED, data="Your registration as an instructor has been received"
                                                             ", please wait for our review later")

    @action(methods=['post'], detail=False, url_path='change-profile', url_name='change-profile')
    def change_profile(self, request, pk=None):
        try:
            data = request.data
            user = request.user
            teacher = Teacher.objects.get(user=user)
            if data.get('job') is not None:
                job = Job.objects.get_or_create(name_job=data.get('job'))[0]
                teacher.job = job
            skills = data.get('skills')
            if skills is not None:
                list_skill = []
                for skill in skills:
                    s, _ = Skill.objects.get_or_create(name_skill=skill)
                    list_skill.append(s)
                teacher.skills.set(list_skill)
            teacher.save()
            return Response(status=status.HTTP_201_CREATED, data={"mess": "Change profile success"})
        except ObjectDoesNotExist:
            return Response(status=status.HTTP_403_FORBIDDEN, data={"mess": "You are not a Teacher"})

    @action(methods=['get'], detail=False, url_name='check-active-teacher', url_path='check-active-teacher')
    def check_active_teacher(self, request):
        try:
            teacher = Teacher.objects.get(user=request.user)
            print(teacher)
            return Response(status=status.HTTP_200_OK, data={'access': teacher.activeTeacher})
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST,
                            data={"mess": "You are not registered as an instructor"})

    @action(methods=['get'], detail=False, url_name='statistics', url_path='statistics')
    def statistics(self, request):
        try:
            teacher = Teacher.objects.get(pk=self.request.user)
            teacher_course = Course.objects.filter(teacher=teacher).annotate(rate_avg=Avg('student_join__rate')) \
                .annotate(count_student=Count('student_join__student')) \
                .order_by('-rate_avg').values('name_course', 'count_student', 'rate_avg')
            print(teacher_course)
            return Response(status=status.HTTP_200_OK, data={"statistics_course": teacher_course})
        except:
            return Response(status=status.HTTP_403_FORBIDDEN, data="You are not a Teacher")


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
        queryset = self.filter_queryset(self.get_queryset().filter(active=True)).order_by('-id')
        kw = self.request.query_params.get('kw', None)
        category = self.request.query_params.get('category', None)
        public = self.request.query_params.get('public', None)
        fee = self.request.query_params.get('fee', None)
        rate = self.request.query_params.get('rate', None)
        if kw:
            queryset = queryset.filter(name_course__icontains=kw)
        if category:
            queryset = queryset.filter(category_id=category)
        if public:
            public = json.loads(public)
            queryset = queryset.filter(is_public=public)
        if fee:
            decimal_val = float(fee)
            print(decimal_val)
            if decimal_val == float(0):
                queryset = queryset.filter(fee=decimal_val)
            else:
                queryset = queryset.filter(fee__gte=decimal_val)
        # print(queryset.filter(avg_rate=None))
        if rate:
            queryset = queryset.annotate(rate_avg=Avg('student_join__rate')).filter(rate_avg__gt=rate)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

    @action(methods=['post'], detail=False)
    def create_course(self, request):
        # ki???m tra xem c?? ph???i l?? Teacher hay kh??ng

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
                except IntegrityError:
                    return Response(status=status.HTTP_400_BAD_REQUEST,
                                    data={"mess": "You have created a course named" + str(name_course)})
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

    # @action(methods=['get'], detail=True, name='Hide this courses', url_path='hide-courses', url_name='hide-courses')
    # def hide_courses(self, request, pk=None):
    #     c = Course.objects.get(pk=pk)
    #     self.check_object_permissions(request, c)
    #     try:
    #         c.active = False
    #         c.save()
    #     except:
    #         return Response(status=status.HTTP_400_BAD_REQUEST)
    #     return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)
    #
    # @action(methods=['get'], detail=True, name='Open this courses', url_path='open-courses', url_name='open-courses')
    # def open_courses(self, request, pk=None):
    #     c = Course.objects.get(pk=pk)
    #     self.check_object_permissions(request, c)
    #     try:
    #         c.active = True
    #         c.save()
    #     except:
    #         return Response(status=status.HTTP_400_BAD_REQUEST)
    #     return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    # L???y b??i h???c c???a kh??a h???c.
    @action(methods=['get'], detail=True, name='lesson', url_path='lesson', url_name='lesson')
    def lesson(self, request, pk=None):
        self.pagination_class = LessonPaginator
        try:
            ## s???p x???p theo ng??y t???o m???i nh???t v?? active = True
            if Course.objects.get(pk=pk).teacher.user == request.user:
                lessons = Course.objects.get(pk=pk).lessons.all().order_by('-created_date')
            else:
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
        # ki???m tra xem h???c sinh ???? ???????c x??c nh???n ch??a
        try:
            if Course.objects.get(pk=pk).student_join.get(student=request.user).access == False:
                return Response(status=status.HTTP_403_FORBIDDEN,
                                data={"mess": "The Teacher has not yet confirm you to the course"})
        except ObjectDoesNotExist:
            ## c?? th??? x???y ra tr?????ng h???p h???c sinh ch??a ????ng k?? b???t l???i x???y ra tr?????ng h???p h???c sinh ch??a ????ng k??
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "You have not registered for the course"})
        try:
            ## s???p x???p theo ng??y t???o m???i nh???t v?? active = True
            lessons = Course.objects.get(pk=pk,active=True).lessons.filter(active=True).order_by('-created_date')
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

    # add tags v??o kh??a h???c
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

    # @action(methods=['get'], detail=True, name="Get students access to course", url_path="get-request",
    #         url_name="get-request")
    # def get_request(self, request, pk=None):
    #     try:
    #         course = Course.objects.get(pk=pk)
    #         self.check_object_permissions(request, course)
    #         if not course is not None:
    #             return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + pk)
    #         student_course = Student_Course.objects.filter(course=course)
    #         if not (student_course):
    #             return Response(status=status.HTTP_200_OK, data="This course don't have student access to")
    #         listSt = []
    #         for sc in student_course:
    #             if not sc.access:
    #                 listSt.append(sc)
    #         if not listSt:
    #             return Response(status=status.HTTP_200_OK, data="No have new access")
    #         else:
    #             return Response(status=status.HTTP_200_OK, data=Student_CourseSerializer(listSt, many=True).data)
    #     except:
    #         return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

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
            student_course.save()
            return Response(status=status.HTTP_201_CREATED,
                            data="Delete success")

    @action(methods=['post'], detail=True, name='accept student join to private course', url_path='accept-student',
            url_name='accept-student')
    def accept_student(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            # teacher = User.objects.get(pk=request.user.id)
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
            naive_datetime = datetime.now()
            aware_datetime = make_aware(naive_datetime)
            student_course.join_date = aware_datetime
            student_course.save()
            return Response(status=status.HTTP_201_CREATED,
                            data={"mess": "Accept student success"})

    @action(methods=["post"], detail=True, url_name="rating", url_path='rating')
    def user_rating(self, request, pk=None):
        self.pagination_class = [IsAuthenticated]
        # ki???m tra c?? ph???i l?? gi??o vi??n c???a kh??a h???c
        if self.get_object().teacher.user == request.user:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "You are the creator of the course cannot be rate"})
        # ki???m tra xem student ???? join kh??a h???c ch??a
        if self.get_object().student_join.filter(student=request.user):
            # ki???m tra xem kh??a h???c student ???? ???????c access v??o kh??a h???c hay ch??a
            if self.get_object().student_join.filter(student=request.user, access=True):
                student_course = self.get_object().student_join.get(student=request.user)
                # tr?????ng h???p khi kh??a h???c kh??ng c?? b???t c??? b??i h???c n??o.
                if self.get_object().lessons.filter(active=True).count() == 0:
                    return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR,
                                    data={"mess": "Lessons in the course are empty so the course cannot be rated."})
                else:
                    count_lesson = self.get_object().lessons.filter(active=True).count()
                    count_lesson_complete = 0
                    lessons = self.get_object().lessons.filter(active=True).all()
                    for lesson in lessons:
                        if lesson.lesson_student.filter(student=request.user).exists():
                            if lesson.lesson_student.get(student=request.user).complete:
                                count_lesson_complete = count_lesson_complete + 1
                    course_complete = round(count_lesson_complete / count_lesson * 100, 0)
                    # h???c vi??n ph???i ho??n th??nh tr??n 50% t???ng s??? b??i h???c th?? m???i ???????c rating
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

    # D??ng ????? xem th??ng tin chi ti???t Kh??a H???c ????? teacher c?? th??? ch???nh s???a ch??ng.

    @action(methods=['get'], detail=True, url_path='detail-course-teacher', url_name='detail-course-teacher')
    def get_detail_course_teacher(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)
        except:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "Course Not Found"})

    @action(methods=['post'], detail=True, url_path='add-lesson', url_name='add-lesson')
    def add_lesson(self, request, pk=None):
        try:
            content = request.data.get('content')
            subject = request.data.get('subject')
            image = request.FILES.get('image')
            if self.get_object().lessons.filter(subject=subject).exists():
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "Subject has been duplicated"})
            if content is not None and subject is not None and image is not None:
                lesson = Lesson.objects.create(content=content, subject=subject, course=self.get_object(), image=image)
                lesson.save()
                return Response(status=status.HTTP_201_CREATED, data={"mess": "Successfully"})
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "subject or content is required"})
        except IntegrityError:
            return Response(status=status.HTTP_400_BAD_REQUEST,
                            data={"mess": "Lesson " + str(subject) + " Duplicate is course"})

    @action(methods=['get'], detail=True, url_path='get-student-course', url_name='get-student-course')
    def get_student_course(self, request, pk=None):
        self.check_object_permissions(request, self.get_object())
        list_student_accessed = self.get_object().student_join.filter(access=True)
        list_student_pending_access = self.get_object().student_join.filter(access=False)
        # print(list_student_accessed)
        # print(list_student_pending_access)
        return Response(status=status.HTTP_200_OK, data=StudentInCourseSerializer(self.get_object(),
                                                                                  context=dict(request=request,
                                                                                               list_student_accessed=list_student_accessed,
                                                                                               list_student_pending_access=list_student_pending_access)).data)

    @action(methods=['get'], detail=True, url_name='statistics', url_path='statistics')
    def statistics(self, request, pk=None):
        try:
            student_join_course = dict()
            student_rate_course = dict()
            query = Student_Course.objects.filter(course=pk)

            print(query.filter(join_date__month=10))
            switcher = {
                1: 'January',
                2: 'February',
                3: 'March',
                4: 'April',
                5: 'May',
                6: 'June',
                7: 'July',
                8: 'August',
                9: 'September',
                10: "October",
                11: 'November',
                12: 'December'
            }

            for m in range(1, 13):
                student_join_course[switcher.get(m)] = query.filter(join_date__month=m).count()

            for rate in range(1, 6):
                student_rate_course["rate " + str(rate)] = query.filter(rate=rate).count()
            return Response(status=status.HTTP_200_OK, data={"student_join_course": student_join_course
                , "student_rate_course": student_rate_course})
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "course not found"})


class CategoryViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class LessonViewSet(viewsets.ViewSet, generics.RetrieveAPIView, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [LessonPermission]

    ## ghi ???? l???i l???y chi ti???t b??i h???c
    def retrieve(self, request, pk=None):
        try:
            self.serializer_class = DetailLessonSerializer
            instance = self.get_object()
            course = Course.objects.get(pk=instance.course.pk)
            ## ki???m tra xem c?? ph???i l?? gi??o vi??n kh??ng.
            if request.user == course.teacher.user:
                serializer = self.get_serializer(instance)
                return Response(serializer.data)
            else:
                instance = self.get_object()
                print(instance.active)
                if instance.active:
                    student_course = Student_Course.objects.filter(course=instance.course)
                    ## ki???m tra b???ng h??m filter xem h???c sinh ???? ????ng k?? kh??a h???c n??y ch??a
                    result = filter(lambda x: x.student == request.user and x.access == True, student_course)
                    if list(result):
                        serializer = DetailLessonSerializerRequestUser(instance, context={"request": request});
                        return Response(serializer.data)
                    else:
                        return Response(status=status.HTTP_403_FORBIDDEN,
                                        data={"mess": "The lesson is in a course you haven't registered yet"})
                else:
                    return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "Not Found"})
        except ObjectDoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND, data={"mess": "No courses with id" + str(pk)})

    @action(methods=['post'], detail=True, url_path="add-video", url_name="add-video")
    def add_video(self, request, pk=None):
        self.check_object_permissions(request, self.get_object())
        lesson = self.get_object()
        subject = request.data.get('subject')
        url = request.data.get('url')
        if url is None or subject is None:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "subject and url is required"})
        try:
            video = Video.objects.create(url_video=url, subject=subject,
                                         author_teacher=Teacher.objects.get(pk=request.user), lesson=lesson)
            video.save()
            return Response(status=status.HTTP_200_OK, data={"mess": "Successfully"})
        except IntegrityError:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={
                "mess": "Subject :" + str(subject) + " is Duplicate in Lesson " + str(self.get_object().subject)})

    @action(methods=['post'], detail=True, url_path="add-file", url_name="add-file")
    def add_file(self, request, pk=None):
        self.check_object_permissions(request, self.get_object())
        file = self.request.FILES.get('file')
        author_teacher = Teacher.objects.get(pk=request.user)
        subject = request.data.get('subject')
        lesson = self.get_object()
        if file is None or subject is None:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "subject and file is required"})
        try:
            file = File.objects.create(file=file, subject=subject,
                                       author_teacher=author_teacher, lesson=lesson)
            file.save()
            return Response(status=status.HTTP_200_OK, data={"mess": "Successfully"})
        except IntegrityError:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={
                "mess": "Subject :" + str(subject) + " is Duplicate in Lesson " + str(self.get_object().subject)})
        # try:
        #     lesson = Lesson.objects.get(pk=pk)
        #     file = request.data['file']
        #     subject = request.data['subject']
        #     file = File.objects.get_or_create(file=file, subject=subject, author_teacher=request.user)
        #     lesson.list_file = file
        #     lesson.save()
        #     return Response(status=status.HTTP_200_OK, data="Successfully")
        # except:
        #     return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, url_path="add-homework", url_name="add-homework")
    def add_homework(self, request, pk=None):
        file = self.request.FILES.get('file')
        author_teacher = Teacher.objects.get(pk=request.user)
        subject = request.data.get('subject')
        lesson = self.get_object()
        content = request.data.get('content')
        if file is None or subject is None:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "subject and file is required"})
        try:
            home_work = HomeWork.objects.create(file=file,
                                                subject=subject,
                                                content=content,
                                                author_teacher=author_teacher,
                                                lesson=lesson)
            home_work.save()
            return Response(status=status.HTTP_200_OK, data={"mess": "Successfully"})
        except IntegrityError:
            return Response(status=status.HTTP_400_BAD_REQUEST, data={
                "mess": "Subject :" + str(subject) + " is Duplicate in Lesson " + str(self.get_object().subject)})

        # try:
        #     lesson = Lesson.objects.get(pk=pk)
        #     homework = HomeWork.objects.create(subject=request.data['subject'],
        #                                        file=request.data['file'],
        #                                        content=request.data['content'],
        #                                        author_teacher=request.user,
        #                                        lesson=lesson)
        #     homework.save()
        #     return Response(status=status.HTTP_201_CREATED, data="Successfully")
        # except:
        #     return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')

    @action(methods=['post'], detail=True, url_path="complete-lesson", url_name="complete-lesson")
    def complete_lesson(self, request, pk=None):
        print(request.user)
        ## check xem user c?? n???m trong kh??a h???c ???????c ????ng k?? hay kh??ng
        if self.get_object().course.student_join.filter(student=request.user, access=True).exists():
            lesson = self.get_object()
            ## ki???m tra xem user ???? ho??n th??nh b??i h???c hay ch??a
            if lesson.lesson_student.filter(student=request.user).exists() == False:
                complete = Student_Lesson.objects.create(lesson=lesson, student=request.user, complete=True)
                complete.save()
                return Response(status=status.HTTP_201_CREATED, data={"mess": "Successfully"})
            else:
                return Response(status=status.HTTP_400_BAD_REQUEST, data={"mess": "You have completed the lesson"})
        else:
            return Response(status=status.HTTP_403_FORBIDDEN,
                            data={"mess": "The lesson is in a course you haven't registered yet"})


class HomeWorkViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = HomeWork.objects.all()
    serializer_class = HomeWorkSerializer
    permission_classes = [OwnerPermission]


class FileViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = File.objects.all()
    serializer_class = FileSerializer
    permission_classes = [OwnerPermission]


class VideoViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer
    permission_classes = [OwnerPermission]


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
