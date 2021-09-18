from django.conf import settings
from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse, Http404
from rest_framework import viewsets, permissions, generics
from rest_framework.parsers import MultiPartParser, JSONParser
from rest_framework.views import APIView

from .paginator import *
from .serializers import *
from .permissions import *

class AuthInfo(APIView):
    def get(self, request):
        return Response(settings.OAUTH2_INFO, status=status.HTTP_200_OK)

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, JSONParser]
    permission_classes = [UserPermission]

    @action(methods=['get'], detail=False, url_path="current-user", url_name='get-current-user')
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user,context={"request": request}).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, url_path="unactive-user", url_name="unactive-user")
    def unactive_user(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            u.is_active = False
            u.save()
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except: return Response(status=status.HTTP_400_BAD_REQUEST, data="Failed")

    @action(methods=['get'], detail=False, url_path="upgrade-user", url_name="upgrade-user")
    def upgrade_user(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            t = Teacher.objects.get_or_create(user=u)
            if not(t[1]):
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
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any teacher pk = " +teacher_id)
            follow = Follow.objects.get_or_create(student=u, teacher=t)
            if not (follow[1]):
                return Response(status=status.HTTP_200_OK, data="You already follow this account")
            follow[0].save()
            return Response(status=status.HTTP_200_OK, data="Followed")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed, Please check the request again')

    # điều kiện để rating?
    @action(methods=['post'], detail=False, url_path="rating", url_name="rating")
    def rating(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            course_id = request.data['course_id']
            try:
                course = Course.objects.get(pk=course_id)
            except: return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + course_id)
            try:
                join = Student_Course.objects.get(student=u, course=course)
            except: return Response(status=status.HTTP_406_NOT_ACCEPTABLE, data="User has not join this course")
            point = request.data['rating_point']
            if point <=5 and point >=0:
                join.rate =point
                join.save()
                return Response(status=status.HTTP_200_OK, data="Access to course successfully")
            else: return Response(status=status.HTTP_400_BAD_REQUEST, data="The rating points only accepts values from 0 to 5")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')


    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]


class TeacherViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.UpdateAPIView):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    permission_classes = [TeacherPermission]

    @action(methods=['get'], detail=True, name='Get list Course', url_path='get-list-courses', url_name='get-list-courses', )
    def get_list_courses(self, request, pk=None):
        teacher = self.get_object()
        c= teacher.course
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, many=True, context={'request': request}).data)

    @action(methods=['post'],detail=False, name='teacher', url_path='register-teacher', url_name='register-teacher')
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
        except : return Response(status=status.HTTP_400_BAD_REQUEST, data = "create failed")

        return Response(status=status.HTTP_201_CREATED, data=self.serializer_class(teacher).data)



class TagViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    pagination_class = BasePaginator


class CourseViewSet(viewsets.ViewSet, generics.ListAPIView, generics.UpdateAPIView, generics.CreateAPIView, generics.DestroyAPIView):
    queryset = Course.objects.all()
    query = Course.objects
    serializer_class = CourseSerializer
    pagination_class = BasePaginator
    # parser_classes = [MultiPartParser, ]
    permission_classes = [CoursePermission]

    def retrieve(self, request, pk=None):
        try:
            queryset = self.query.get(pk=pk)
            serializer = CoursesItemSerializer(queryset, context={"request": request})
            return Response(serializer.data)
        except: return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['get'], detail=True, name='Hide this courses', url_path='hide-courses', url_name='hide-courses',)
    def hide_courses(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.active = False
            c.save()
        except :
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, name='Open this courses', url_path='open-courses', url_name='open-courses')
    def open_courses(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.active = True
            c.save()
        except :
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, name='lesson', url_path='lesson', url_name='lesson')
    def lesson(self, request, pk=None):
        try:
            kw = request.query_params.get('kw', None)
            course = Course.objects.get(pk=pk)
            self.check_object_permissions(request, course.teacher)
            queryset = course.lessons.all()
            if kw is not None:
                queryset = queryset.filter(subject__icontains=kw)
            return Response(status=status.HTTP_200_OK,
                            data=LessonSerializer(queryset, many=True, context={'request': request}).data)
        except: return Response(status=status.HTTP_400_BAD_REQUEST)


    @action(methods=['get'], detail=True, url_path='change-status', url_name='change-status')
    def change_status(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c)
        try:
            c.is_public = not(c.is_public)
            c.save()
            return Response(status=status.HTTP_200_OK, data="Success")
        except : return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, name='add tag', url_path='add-tag', url_name='add-tag')
    def add_tag(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            self.check_object_permissions(request, c)
        except :
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            data = request.data['name']
            if data is not None:
                c.tags.add(Tag.objects.get_or_create(name = data)[0])
            c.save()
            return Response(status=status.HTTP_201_CREATED, data=CoursesItemSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, url_path="access-course", url_name="access-course")
    def access_course(self, request, pk=None):
        try:
            u = User.objects.get(pk=request.user.id)
            course = Course.objects.get(pk=pk)
            try:
                teacher = course.teacher.user
                if teacher == u:
                    return Response(status=status.HTTP_400_BAD_REQUEST, data="Teacher id duplicate with student id")
            except : return Response(status=status.HTTP_400_BAD_REQUEST, data="err")
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

    @action(methods=['get'], detail=True, name="Get students access to course", url_path="get-request", url_name="get-request")
    def get_request(self, request, pk=None):
        try:
            course = Course.objects.get(pk=pk)
            self.check_object_permissions(request, course)
            if not course is not None:
                return Response(status=status.HTTP_400_BAD_REQUEST, data="Don't have any cousrse pk = " + pk)
            student_course = Student_Course.objects.filter(course = course)
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
            except: return Response(status=status.HTTP_400_BAD_REQUEST, data="No student has pk =" + str(request.data["student_id"]))
            try:
                student_course = Student_Course.objects.get(course=c, student=student)
            except: return Response(status=status.HTTP_200_OK, data="This student don't access this course")
            student_course.delete()

            return Response(status=status.HTTP_201_CREATED,
                            data="Delete success")

    @action(methods=['post'], detail=True, name='accept student join to private course', url_path='accept-student', url_name='accept-student')
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


def get_queryset(self):
        queryset = Course.objects.all()
        cate_id = self.request.query_params.get('category_id', None)
        kw = self.request.query_params.get('kw', None)

        if cate_id:
            queryset = queryset.filter(category=cate_id)
        if kw:
            queryset = queryset.filter(description__icontains=kw)
        return queryset


class CategoryViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class LessonViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView, generics.DestroyAPIView):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer
    parser_classes = [MultiPartParser, JSONParser]

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
            return Response(status=status.HTTP_200_OK, data="Successfully")
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST, data='Failed')



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