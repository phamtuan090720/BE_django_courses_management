from django.contrib import admin
from .models import Category,User,Course,Lesson,Tag,Teacher,HomeWork,File,Video,Follow,Skill,Job,GroupChat,Message
# Register your models here.
# class CoursesAdmin(admin.ModelAdmin):
#     list_display = ['id', 'subject','created_date','update_date']
#     list_filter = ['subject', 'created_date']
#     search_fields = ['subject', 'course__subject']
#     readonly_fields = ['image_tag']
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
