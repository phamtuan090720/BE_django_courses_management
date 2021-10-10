from django.contrib import admin
from django.contrib import messages
from django.core.mail import send_mail
from django.conf.global_settings import EMAIL_HOST_USER

from .models import *


@admin.action(description='active teacher')
def active_teacher(modeladmin, request, queryset):
    subject = 'Accepting Instructor TTdemy'
    message = 'You have been approved to become a course creator of TTdemy'
    for teacher in queryset:
        send_mail(subject, message, EMAIL_HOST_USER, [teacher.user.email], fail_silently=False)
    queryset.update(activeTeacher=True)

@admin.action(description='unactive teacher')
def unactive_teacher(modeladmin, request, queryset):
    for teacher in queryset:
        subject = 'Revoke the permission of Instructor Udemy'
        message = 'Your TTdemy instructor permission have been revoked for violating some of our rules'
        send_mail(subject, message, EMAIL_HOST_USER, [teacher.user.email], fail_silently=False)
    queryset.update(activeTeacher=False)


@admin.register(Course)
class CoursesAdminSite(admin.ModelAdmin):
    list_display = ['id', 'name_course', 'teacher', 'created_date', 'updated_date', 'active']
    list_filter = ['subject', 'created_date']
    search_fields = ['name_course']


@admin.register(Lesson)
class LessonAdminSite(admin.ModelAdmin):
    list_display = ['id', 'subject', 'course', 'created_date', 'updated_date', 'active']
    list_filter = ['subject', 'created_date']
    search_fields = ['subject']


class TeacherAdminSite(admin.ModelAdmin):
    list_display = ['user', 'job', 'activeTeacher']
    list_filter = ['job']
    search_fields = ['user__username']
    actions = [active_teacher,unactive_teacher]


class StudentCourseAdminSite(admin.ModelAdmin):
    list_display = ['course', 'student', 'join_date', 'access']


class StudentLessonAdminSite(admin.ModelAdmin):
    list_display = ['lesson', 'student', 'complete']


admin.site.register(Category)
admin.site.register(User)
admin.site.register(Tag)
admin.site.register(Teacher, TeacherAdminSite)
admin.site.register(HomeWork)
admin.site.register(File)
admin.site.register(Video)
admin.site.register(Follow)
admin.site.register(Skill)
admin.site.register(Job)
admin.site.register(GroupChat)
admin.site.register(Message)
admin.site.register(Student_Course, StudentCourseAdminSite)
admin.site.register(Student_Lesson, StudentLessonAdminSite)
