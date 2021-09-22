from django.core.exceptions import ObjectDoesNotExist
from django.db.models import Avg
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import *


class UserSerializer(ModelSerializer):
    user_type = serializers.SerializerMethodField('type')

    def type(self, user):
        try:
            u = user.teacher.activeTeacher
            if u:
                return "Teacher"
            return "User"
        except :
            return "User"
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'avatar', 'email', 'date_joined', 'user_type']
        extra_kwargs = {
            'password': {'write_only': 'true'},
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user


class TeacherSerializer(ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Teacher
        fields = ['user', 'activeTeacher', 'skills', 'job']

class CategorySerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = ['id','name']

class TagSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id', 'name']

class JoinSerializer(ModelSerializer):
    class Meta:
        model = Student_Course
        fields = ['id', 'student', 'course', 'join_date', 'rate', 'review']

class VideoSerializer(ModelSerializer):
    class Meta:
        model = Video
        fields = ['id', 'subject', 'url_video', 'lesson']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }
class FileSerializer(ModelSerializer):
    class Meta:
        model = File
        fields = ['id', 'subject', 'file', 'lesson']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }

class HomeWorkSerializer(ModelSerializer):
    class Meta:
        model = HomeWork
        fields = ['id', 'author_teacher', 'lesson', 'subject', 'file', 'content']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }

class LessonSerializer(ModelSerializer):
    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image','created_date', 'updated_date', 'content','course','active']
class DetailLessonSerializer(ModelSerializer):
    list_video = VideoSerializer(many=True)
    list_file = FileSerializer(many=True)
    home_work = HomeWorkSerializer(many=True)
    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image','created_date', 'updated_date', 'content','course','active',"list_video","list_file","home_work"]

class LessonField(ModelSerializer):
    list_video = serializers.SlugRelatedField(many=True ,read_only=True, slug_field='subject')
    class Meta:
        model = Lesson
        fields = [ 'subject', 'image', 'list_video']
class InfoField(ModelSerializer):
    class Meta:
        model = User
        fields = [ 'id', 'username', 'avatar']

class Student_CourseSerializer(ModelSerializer):
    student = InfoField(read_only=True)
    class Meta:
        model = Student_Course
        fields = ['student','rate', 'review','access']
class TeacherField(ModelSerializer):
    user = InfoField(read_only=True)
    class Meta:
        model = User
        fields = ['user']
class CourseSerializer(ModelSerializer):
    category = serializers.SlugRelatedField(read_only=True, slug_field='name')
    teacher = TeacherField(read_only=True)
    rate = serializers.SerializerMethodField('rate_avg')
    tags = TagSerializer(many=True)
    def rate_avg(self, course):
        point = course.student_join.aggregate(Avg('rate')) # trung bình điểm rating
        return point['rate__avg']
    class Meta:
        model = Course
        fields = ['id', 'name_course','category', 'subject', 'description','image', 'created_date', 'active', 'fee',
                  'is_public', 'teacher', 'rate','tags']


class CoursesItemSerializer(serializers.ModelSerializer):
    category = serializers.SlugRelatedField( read_only=True, slug_field='name')
    tags = TagSerializer(many=True)
    lessons = LessonField(many=True)
    teacher = TeacherField( read_only= True)
    student = serializers.SerializerMethodField('countStudent')
    rate = serializers.SerializerMethodField('rate_avg')
    student_join = Student_CourseSerializer(many=True)
    def rate_avg(self, course):
        point = course.student_join.aggregate(Avg('rate')) # trung bình điểm rating
        return point['rate__avg']
    def countStudent(self, course):
        return course.student_join.count()


    class Meta:
        model = Course
        fields = ['id', 'name_course','category', 'subject', 'description','image', 'created_date', 'active', 'fee',
                  'is_public', 'updated_date', 'lessons', 'tags', 'teacher', 'student', 'rate', 'student_join']



class HomeWorkSerializer(ModelSerializer):
    class Meta:
        model = HomeWork
        fields = ['id', 'author_teacher', 'lesson', 'subject', 'file', 'content']





class FollowSerializer(ModelSerializer):
    class Meta:
        model = Follow
        fields = ['id', 'student', 'teacher']

class SkillSerializer(ModelSerializer):
    class Meta:
        model = Skill
        fields = ['id', 'name_skill']

class JobSerializer(ModelSerializer):
    class Meta:
        model = Job
        fields = ['id', 'name_job']

class GroupChatSerializer(ModelSerializer):
    class Meta:
        model = GroupChat
        fields = ['course', 'name_group']

class MessSerializer(ModelSerializer):
    class Meta:
        model = Message
        fields = ['id', 'user', 'group_chat', 'mess', 'date_post']

