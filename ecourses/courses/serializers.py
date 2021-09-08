
from rest_framework.serializers import ModelSerializer
from .models import *


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'avatar', 'email']
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
        model = Tag;
        fields = ['id', 'name']

class CoursesSerializer(ModelSerializer):
    tags = TagSerializer(many=True)
    class Meta:
        model = Course
        fields = ['id', 'name_course', 'description', 'image','created_date','updated_date','category', 'tags', 'active', 'teacher_id']

class LessonSerializer(ModelSerializer):
    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image','created_date', 'updated_date', 'content','course','active']


class HomeWorkSerializer(ModelSerializer):
    class Meta:
        model = HomeWork
        fields = ['id', 'author_teacher', 'lesson', 'subject', 'file', 'content']


class FileSerializer(ModelSerializer):
    class Meta:
        model = File
        fields = ['id', 'subject', 'file', 'lession']

class VideoSerializer(ModelSerializer):
    class Meta:
        model = Video
        fields = ['id', 'subject', 'url_video', 'lession']

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

