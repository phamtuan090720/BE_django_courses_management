from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse
from rest_framework import viewsets, permissions, generics
from rest_framework.parsers import MultiPartParser
from .models import Course
from .serializers import *

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView, generics.RetrieveAPIView, generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializer
    parser_classes = [MultiPartParser, ]

    def get_permissions(self):
        if self.action == 'retrieve':
            return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]


class TeacherViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    # permission_classes = [permissions.IsAuthenticated]

    def get_permissions(self):
        if(self.action=='list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer

    def get_permissions(self):
        if(self.action=='list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class CourseViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Course.objects.all()
    query = Course.objects
    serializer_class = CourseSerializer
    # parser_classes = [MultiPartParser, ]

    def retrieve(self, request, pk=None):
        queryset = self.query.get(pk=pk)
        serializer = CoursesItemSerializer(queryset, context={"request":request})
        return Response(serializer.data)

    @action(methods=['get'], detail=True, name='Hide this courses', url_path='hide-courses', url_name='hide-courses')
    def hide_courses(self, request, pk=None):
        try:
            c = Course.objects.get(pk=pk)
            c.active = False
            c.save()
        except Course.DoesNotExit:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        return Response(status=status.HTTP_200_OK, data=CourseSerializer(c, context={'request': request}).data)


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    # permission_classes = [permissions.IsAuthenticated]

    def get_permissions(self):
        if(self.action=='list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class LessonViewSet(viewsets.ModelViewSet):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class HomeWorkViewSet(viewsets.ModelViewSet):
    queryset = HomeWork.objects.all()
    serializer_class = HomeWorkSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class FileViewSet(viewsets.ModelViewSet):
    queryset = File.objects.all()
    serializer_class = FileSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]

class VideoViewSet(viewsets.ModelViewSet):
    queryset = Video.objects.all()
    serializer_class = VideoSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class FollowViewSet(viewsets.ModelViewSet):
    queryset = Follow.objects.all()
    serializer_class = FollowSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class SkillViewSet(viewsets.ModelViewSet):
    queryset = Skill.objects.all()
    serializer_class = SkillSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class JobViewSet(viewsets.ModelViewSet):
    queryset = Job.objects.all()
    serializer_class = JobSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class GroupChatViewSet(viewsets.ModelViewSet):
    queryset = GroupChat.objects.all()
    serializer_class = GroupChatSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class MessageViewSet(viewsets.ModelViewSet):
    queryset = Message.objects.all()
    serializer_class = MessSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]
class JoinViewSet(viewsets.ModelViewSet):
    queryset = Student_Course.objects.all()
    serializer_class = JoinSerializer

    def get_permissions(self):
        if (self.action == 'list'):
            return [permissions.AllowAny()]
        else:
            return [permissions.IsAuthenticated()]


def index(request):
    return HttpResponse("e-courser app")