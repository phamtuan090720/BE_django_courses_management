from django.contrib import admin
from .models import *
# Register your models here.
# class CoursesAdmin(admin.ModelAdmin):
#     list_display = ['id', 'subject','created_date','update_date']
#     list_filter = ['subject', 'created_date']
#     search_fields = ['subject', 'course__subject']
#     readonly_fields = ['image_tag']
# admin.site.register(CoursesAdmin)
admin.site.register(Category)
admin.site.register(User)
admin.site.register(Course)
admin.site.register(Lesson)
admin.site.register(Tag)
admin.site.register(Teacher)
admin.site.register(HomeWork)
admin.site.register(File)
admin.site.register(Video)
admin.site.register(Follow)
admin.site.register(Skill)
admin.site.register(Job)
admin.site.register(GroupChat)
admin.site.register(Message)
admin.site.register(Student_Course)
admin.site.register(Student_Lesson)
