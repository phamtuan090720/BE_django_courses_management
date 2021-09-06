from django.urls import path,include
from . import views
from rest_framework.routers import DefaultRouter
router = DefaultRouter()
# router.register('category',views.CategoryViewSet)
# router.register('coures',views.CoursesViewSet)
# router.register('Lesson',views.LessonViewSet)
urlpatterns = [
    path('', include(router.urls)),
]