from django.db import models
from django.contrib.auth.models import AbstractUser
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.html import mark_safe

# Create your models here.

class User(AbstractUser):
    avatar = models.ImageField(upload_to='static/uploads/%Y/%m',null=True)

class Job(models.Model):
    name_job = models.CharField(max_length=255)
    def __str__(self):
        return self.name_job

class Skill(models.Model):
    name_skill = models.CharField(max_length=255)
    def __str__(self):
        return self.name_skill
class Teacher(models.Model):
    user = models.OneToOneField(User,on_delete=models.CASCADE,primary_key=True)
    activeTeacher = models.BooleanField(default=False)
    skills = models.ManyToManyField(Skill,blank=True,related_name='teacher')
    job = models.ForeignKey(Job,on_delete=models.SET_NULL,null=True)
    def __str__(self):
        return str(self.user)

    class Meta:
        ordering = ['activeTeacher']


class Follow(models.Model):
    class Meta:
        unique_together = ('student', 'teacher')
    student = models.ForeignKey(User, on_delete=models.CASCADE, related_name='followers')
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='followers')

    def __str__(self):
        return str(self.student)+' followed '+str(self.teacher)

class Category(models.Model):
    name = models.CharField(max_length=100,unique=True)
    def __str__(self):
        return self.name

class ModelBase(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True
        ordering = ['-id'] # sắp giảm theo id


class Tag(models.Model):
    name = models.CharField(max_length=100,unique=True)
    def __str__(self):
        return self.name

class Course(ModelBase):
    name_course = models.CharField(max_length=200,null=False,default=None)
    subject = models.TextField(null=True)
    description = models.TextField(null=True,default="Chưa có mô tả Khóa Học")
    category = models.ForeignKey(Category,on_delete=models.SET_NULL,null=True)
    tags = models.ManyToManyField('Tag', blank=True,related_name='course')
    teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, null=False, related_name='course')
    fee = models.CharField(default='Free', null=True, max_length=10) #free or not
    is_public = models.BooleanField(default=True, null=False) #public or private
    image = models.ImageField(upload_to='static/courses/%Y/%m/',null=True, blank=True)
    # students = models.ManyToManyField('User',blank=True,related_name='course')
    def __str__(self):
        return self.name_course

    class Meta:
        ordering = ['-id']

class Student_Course(models.Model):
    class Meta:
        unique_together = ('student', 'course')
    student = models.ForeignKey(User, on_delete=models.CASCADE, null=False, related_name='course_join')
    course = models.ForeignKey(Course, on_delete=models.CASCADE, null=False, related_name='student_join')
    join_date = models.DateTimeField(auto_now_add=True)
    access = models.BooleanField(default=True)
    rate = models.IntegerField(null=True, blank=True, validators =[
                                            MaxValueValidator(5),
                                            MinValueValidator(0)
                                        ])
    review = models.TextField(blank=True, null=True)
    def __str__(self):
        return str(self.student)+ " joned " + str(self.course)


class Lesson(ModelBase):
    class Meta:
        unique_together = ('subject', 'course')
    subject = models.CharField(max_length=255)
    content = models.TextField()
    course = models.ForeignKey(Course,on_delete=models.CASCADE,related_name='lessons',related_query_name='my_lesson')
    image = models.ImageField(upload_to='static/courses/%Y/%m/',null=True, blank=True)
    def __str__(self):
        return self.subject

class Student_Lesson(models.Model):

    class Meta:
        unique_together = ('student', 'lesson')
    lesson = models.ForeignKey(Lesson,on_delete=models.CASCADE,null=False,related_name='lesson_student')
    student = models.ForeignKey(User, on_delete=models.CASCADE, null=False, related_name='lesson_student')
    complete = models.BooleanField(null=False,default=True)
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.student)+" complete "+str(self.lesson)


class Video(ModelBase):
    author_teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='video')
    subject = models.CharField(max_length=255)
    url_video = models.CharField(max_length=255)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, related_name='list_video',
                               related_query_name='list_video_lesson')
    def __str__(self):
        return self.subject

class File(ModelBase):
    author_teacher = models.ForeignKey(Teacher, on_delete=models.CASCADE, related_name='file')
    subject = models.CharField(max_length=255)
    file = models.FileField(upload_to='static/file/%Y/%m')
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, related_name='list_file',
                                related_query_name='list_file_lesson')
    def __str__(self):
        return self.subject

class HomeWork(ModelBase):
    author_teacher = models.ForeignKey(Teacher,on_delete=models.CASCADE,related_name='home_work')
    lesson = models.ForeignKey(Lesson,on_delete=models.CASCADE,related_name='home_work')
    subject = models.CharField(max_length=255)
    file = models.FileField(upload_to='static/homework/%Y/%m')
    content = models.TextField()

    def __str__(self):
        return self.subject
class GroupChat(models.Model):
    course = models.OneToOneField(Course,on_delete=models.CASCADE,primary_key=True)
    name_group = models.CharField(max_length=255,null=False)
    def __str__(self):
        return self.name_group

class Message(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE,null=False)
    group_chat = models.ForeignKey(GroupChat,on_delete=models.CASCADE,null=False)
    mess = models.TextField()
    date_post = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return str(self.user) + ' Said ' + str(self.mess) + ' in group chat ' + str(self.group_chat) + ' at time: ' + str(self.date_post)