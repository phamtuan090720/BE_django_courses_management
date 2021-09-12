from django.conf import settings
from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse, Http404
from rest_framework import viewsets, permissions, generics
from rest_framework.parsers import MultiPartParser
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
    parser_classes = [MultiPartParser, ]
    # permission_classes = [permissions.IsAuthenticated()]

    @action(methods=['get'], detail=False, url_path="current-user", url_name='get-current-user')
    def get_current_user(self, request):
        return Response(self.serializer_class(request.user).data, status=status.HTTP_200_OK)

    @action(methods=['get'], detail=False, url_path="unactive-user", url_name="unactive-user")
    def unactive_user(self, request):
        try:
            u = User.objects.get(pk=request.user.id)
            u.is_active = False
            u.save()
            return Response(status=status.HTTP_200_OK, data="done")
        except: return Response(status=status.HTTP_400_BAD_REQUEST, data="failed")


    def get_permissions(self):
        if self.action == 'get_current_user':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]


class TeacherViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    # permission_classes = [IsOwnerOrReadOnly]



    # def get_permissions(self):
    #     if(self.action=='list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]

class TagViewSet(viewsets.ViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    pagination_class = BasePaginator


class CourseViewSet(viewsets.ViewSet, generics.ListAPIView):
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
        self.check_object_permissions(request, c.teacher)
        try:
            c.active = False
            c.save()
        except :
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)

    @action(methods=['get'], detail=True, name='Open this courses', url_path='open-courses', url_name='open-courses')
    def open_courses(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c.teacher)
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
            queryset = course.lessons.all()
            if kw is not None:
                queryset = queryset.filter(subject__icontains=kw)
            return Response(status=status.HTTP_200_OK,
                            data=LessonSerializer(queryset, many=True, context={'request': request}).data)
        except: return Response(status=status.HTTP_400_BAD_REQUEST)


    @action(methods=['get'], detail=True, url_path='change-status', url_name='change-status')
    def change_status(self, request, pk=None):
        c = Course.objects.get(pk=pk)
        self.check_object_permissions(request, c.teacher)
        try:
            c.is_public = not(c.is_public)
            c.save()
            return Response(status=status.HTTP_200_OK, data="Success")
        except : return Response(status=status.HTTP_400_BAD_REQUEST)

    @action(methods=['post'], detail=True, name='add tag', url_path='add-tag', url_name='add-tag')
    def add_tag(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
        except :
            return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            data = request.data['name']
            if data is not None:
                # for tag in data:
                c.tags.add(Tag.objects.get_or_create(name = data)[0])
            c.save()
            return Response(status=status.HTTP_201_CREATED, data=CoursesItemSerializer(c, context={'request': request}).data)

    def get_queryset(self):
        queryset = Course.objects.all()
        cate_id = self.request.query_params.get('category_id', None)
        kw = self.request.query_params.get('kw', None)

        if cate_id:
            queryset = queryset.filter(category=cate_id)
        if kw:
            queryset = queryset.filter(description__icontains=kw)
        return queryset


class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    # permission_classes = [permissions.IsAuthenticated]

    # def get_permissions(self):
    #     if(self.action=='list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]

class LessonViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]

class HomeWorkViewSet(viewsets.ViewSet):
    queryset = HomeWork.objects.all()
    serializer_class = HomeWorkSerializer
    #
    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]

class FileViewSet(viewsets.ViewSet):
    queryset = File.objects.all()
    serializer_class = FileSerializer
    #
    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]

class VideoViewSet(viewsets.ViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]
class FollowViewSet(viewsets.ViewSet):
    queryset = Follow.objects.all()
    serializer_class = FollowSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]
class SkillViewSet(viewsets.ViewSet):
    queryset = Skill.objects.all()
    serializer_class = SkillSerializer

    # def get_permissions(self):
        # if (self.action == 'list'):
        #     return [permissions.AllowAny()]
        # else:
        #     return [permissions.IsAuthenticated()]
class JobViewSet(viewsets.ViewSet):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]
class GroupChatViewSet(viewsets.ViewSet):
    queryset = GroupChat.objects.all()
    serializer_class = GroupChatSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]
class MessageViewSet(viewsets.ViewSet):
    queryset = Message.objects.all()
    serializer_class = MessSerializer

    # def get_permissions(self):
    #     if (self.action == 'list'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]
class JoinViewSet(viewsets.ViewSet):
    queryset = Student_Course.objects.all()
    serializer_class = JoinSerializer

    # def get_permissions(self):
    #     if (self.action == 'list' or self.action =='retrieve'):
    #         return [permissions.AllowAny()]
    #     else:
    #         return [permissions.IsAuthenticated()]


def index(request):
    return HttpResponse("e-courser app")