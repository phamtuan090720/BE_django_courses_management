from django.urls import path,include
from . import views
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register('category',views.CategoryViewSet)
router.register('coures',views.CourseViewSet)
router.register('lesson',views.LessonViewSet)
router.register('user',views.UserViewSet)
router.register('tag',views.TagViewSet)
router.register('teacher',views.TeacherViewSet)
router.register('homeWork',views.HomeWorkViewSet)
router.register('file',views.FileViewSet)
router.register('video',views.VideoViewSet)
router.register('follow',views.FollowViewSet)
router.register('skill',views.SkillViewSet)
router.register('job',views.JobViewSet)
router.register('groupChat',views.GroupChatViewSet)
router.register('message',views.MessageViewSet)
router.register('join',views.JoinViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('oauth2-info', views.AuthInfo.as_view())
]