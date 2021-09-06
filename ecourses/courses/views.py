from django.shortcuts import render
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework import status
from django.http import HttpResponse
from rest_framework import viewsets, permissions
from .models import Course
# from .serializers import CategorySerializer,CoursesSerializer,LessonSerializer
# Create your views here.
# class CoursesViewSet(viewsets.ModelViewSet):
#     queryset = Course.objects.filter(active=True)
#     serializer_class = CoursesSerializer
#
#     @action(methods=['get'], detail=True, name='Hide this courses', url_path='hide-courses', url_name='hide-courses')
#     def hide_courses(self, request, pk=None):
#         try:
#             c = Course.objects.get(pk=pk)
#             c.active = False
#             c.save()
#         except Course.DoesNotExit:
#             return Response(status=status.HTTP_400_BAD_REQUEST)
#         return Response(status=status.HTTP_200_OK, data=CoursesSerializer(c,context={'request':request}).data)
#     def get_permissions(self):
#         if(self.action=='list'):
#             return [permissions.AllowAny()]
#         else:
#             return [permissions.IsAuthenticated()]
#
#
# class CategoryViewSet(viewsets.ModelViewSet):
#     queryset = Category.objects.all()
#     serializer_class = CategorySerializer
#     # permission_classes = [permissions.IsAuthenticated]
#
#     def get_permissions(self):
#         if(self.action=='list'):
#             return [permissions.AllowAny()]
#         else:
#             return [permissions.IsAuthenticated()]
#
# class LessonViewSet(viewsets.ModelViewSet):
#     queryset = Lesson.objects.all()
#     serializer_class = LessonSerializer
#
#     def get_permissions(self):
#         if (self.action == 'list'):
#             return [permissions.AllowAny()]
#         else:
#             return [permissions.IsAuthenticated()]

def index(request):
    return HttpResponse("e-courser app")