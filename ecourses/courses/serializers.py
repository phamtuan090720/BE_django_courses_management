from django.core.exceptions import ValidationError
from django.db.models import Avg
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from .models import *
import django.contrib.auth.password_validation as validators


class UserSerializer(ModelSerializer):
    user_type = serializers.SerializerMethodField('type')

    def type(self, user):
        try:
            u = user.teacher.activeTeacher
            if u:
                return "Teacher"
            return "User"
        except:
            return "User"

    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'username', 'password', 'avatar', 'email', 'date_joined',
                  'user_type']
        extra_kwargs = {
            'password': {'write_only': 'true'},
        }

    def validate_password(self, data):
        errors = dict()
        try:
            validators.validate_password(password=data)
        except ValidationError as e:
            errors = list(e.messages)
        if errors:
            raise serializers.ValidationError(errors)
        return super(UserSerializer, self).validate(data)

    def create(self, validated_data):
        user = User.objects.create_user(**validated_data)
        user.set_password(validated_data['password'])
        user.save()
        return user

    def update(self, instance, validated_data):
        user = super().update(instance, validated_data)
        if 'password' in validated_data:
            user.set_password(validated_data['password'])
            user.save()
        return user


class TeacherSerializer(ModelSerializer):
    user = UserSerializer()
    job = serializers.SlugRelatedField(many=False, read_only=True, slug_field='name_job')
    skills = serializers.SlugRelatedField(many=True, read_only=True, slug_field='name_skill')

    class Meta:
        model = Teacher
        fields = ['user', 'activeTeacher', 'skills', 'job']


class CategorySerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = ['id', 'name']


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
        fields = ['id', 'subject', 'url_video', 'lesson', 'active']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }


class FileSerializer(ModelSerializer):
    class Meta:
        model = File
        fields = ['id', 'subject', 'file', 'lesson', 'active']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }


class HomeWorkSerializer(ModelSerializer):
    class Meta:
        model = HomeWork
        fields = ['id', 'author_teacher', 'lesson', 'subject', 'file', 'content', 'active']
        extra_kwargs = {
            'lesson': {'write_only': 'true'},
        }


class Student_Lesson(ModelSerializer):
    class Meta:
        model = Student_Lesson
        fields = ['complete']


class LessonSerializer(ModelSerializer):
    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image', 'created_date', 'updated_date', 'content', 'course', 'active']


class LessonSerializerRequestUser(ModelSerializer):
    complete = serializers.SerializerMethodField('student_complete')

    def student_complete(self, lesson):
        request = self.context['request']
        try:
            if request:
                lesson_user = lesson.lesson_student.get(lesson=lesson, student=request.user)
                return lesson_user.complete
            else:
                return None
        except:
            return False

    class Meta:
        model = Lesson
        fields = LessonSerializer.Meta.fields + ['complete']


class DetailLessonSerializerRequestUser(ModelSerializer):
    complete = serializers.SerializerMethodField('student_complete')
    list_file = serializers.SerializerMethodField('get_list_file_active')
    list_video = serializers.SerializerMethodField('get_list_video_active')
    home_work = serializers.SerializerMethodField('get_list_homework_active')

    def get_list_file_active(self, lesson):
        request = self.context['request']
        qs = lesson.list_file.filter(active=True)
        serializer = FileSerializer(qs, many=True, context={"request": request})
        return serializer.data

    def get_list_video_active(self, lesson):
        request = self.context['request']
        qs = lesson.list_video.filter(active=True)
        serializer = VideoSerializer(qs, many=True, context={"request": request})
        return serializer.data

    def get_list_homework_active(self, lesson):
        request = self.context['request']
        qs = lesson.home_work.filter(active=True)
        serializer = HomeWorkSerializer(qs, many=True, context={"request": request})
        return serializer.data

    def student_complete(self, lesson):
        request = self.context['request']
        try:
            if request:
                lesson_user = lesson.lesson_student.get(lesson=lesson, student=request.user)
                return lesson_user.complete
            else:
                return None
        except:
            return False

    class Meta:
        model = Lesson
        fields = LessonSerializer.Meta.fields + ['complete', "list_video", "list_file", "home_work"]


class DetailLessonSerializer(ModelSerializer):
    list_video = VideoSerializer(many=True)
    list_file = FileSerializer(many=True)
    home_work = HomeWorkSerializer(many=True)

    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image', 'created_date', 'updated_date', 'content', 'course', 'active', "list_video",
                  "list_file", "home_work"]


class LessonField(ModelSerializer):
    list_video = serializers.SlugRelatedField(many=True, read_only=True, slug_field='subject')

    class Meta:
        model = Lesson
        fields = ['subject', 'image', 'list_video']


class InfoField(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'avatar']


class Student_CourseSerializer(ModelSerializer):
    student = InfoField(read_only=True)

    class Meta:
        model = Student_Course
        fields = ['student', 'rate', 'review', 'access']


class TeacherField(ModelSerializer):
    user = InfoField(read_only=True)

    class Meta:
        model = User
        fields = ['user']


class CourseSerializer(ModelSerializer):
    category_name = serializers.SerializerMethodField('get_category_name')
    teacher = TeacherField(read_only=True)
    rate = serializers.SerializerMethodField('rate_avg')
    tags = TagSerializer(many=True)

    def rate_avg(self, course):
        point = course.student_join.aggregate(Avg('rate'))  # trung bình điểm rating
        return point['rate__avg']

    def get_category_name(self, course):
        return str(Category.objects.get(pk=course.category.id).name)

    class Meta:
        model = Course
        fields = ['id', 'name_course', 'category', 'subject', 'description', 'image', 'created_date', 'active', 'fee',
                  'is_public', 'teacher', 'rate', 'tags', 'category_name']


class CourseSerializerRequestUser(ModelSerializer):
    category = serializers.SlugRelatedField(read_only=True, slug_field='name')
    teacher = TeacherField(read_only=True)
    rate = serializers.SerializerMethodField('rate_avg')
    tags = TagSerializer(many=True)
    user_review = serializers.SerializerMethodField('get_review_user')
    complete_course = serializers.SerializerMethodField('complete')

    def rate_avg(self, course):
        point = course.student_join.aggregate(Avg('rate'))  # trung bình điểm rating
        return point['rate__avg']

    def complete(self, course):
        request = self.context['request']
        # print(course.lessons.count())
        if course.lessons.filter(active=True).count() == 0:
            return 0
        else:
            count_lesson = course.lessons.filter(active=True).count()
            count_lesson_complete = 0
            lessons = course.lessons.filter(active=True).all()
            for lesson in lessons:
                if lesson.lesson_student.filter(student=request.user).exists():
                    if lesson.lesson_student.get(student=request.user).complete:
                        count_lesson_complete = count_lesson_complete + 1
            return round(count_lesson_complete / count_lesson * 100, 0)

    def get_review_user(self, course):
        request = self.context['request']
        try:
            student_course = course.student_join.get(student=request.user)
            return {
                "user_rate": student_course.rate,
                "user_comment": student_course.review
            }
        except:
            return {
                "user_rate": None,
                "user_comment": None
            }

    class Meta:
        model = Course
        fields = ['id', 'name_course', 'category', 'subject', 'description', 'image', 'created_date', 'active', 'fee',
                  'is_public', 'teacher', 'rate', 'tags', 'user_review', 'complete_course']


class CoursesItemSerializer(serializers.ModelSerializer):
    category = serializers.SlugRelatedField(read_only=True, slug_field='name')
    tags = TagSerializer(many=True)
    lessons = LessonField(many=True)
    teacher = TeacherField(read_only=True)
    student = serializers.SerializerMethodField('countStudent')
    rate = serializers.SerializerMethodField('rate_avg')
    student_join = Student_CourseSerializer(many=True)

    def rate_avg(self, course):
        point = course.student_join.aggregate(Avg('rate'))  # trung bình điểm rating
        return point['rate__avg']

    def countStudent(self, course):
        return course.student_join.count()

    class Meta:
        model = Course
        fields = ['id', 'name_course', 'category', 'subject', 'description', 'image', 'created_date', 'active', 'fee',
                  'is_public', 'updated_date', 'lessons', 'tags', 'teacher', 'student', 'rate', 'student_join']


class InfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'avatar', 'username']


class InfoStudentInCourseSerializer(serializers.ModelSerializer):
    info_student = serializers.SerializerMethodField('get_info')
    complete_course = serializers.SerializerMethodField('get_complete_course')

    def get_complete_course(self, st):
        # print(st.course.lessons.count())
        course = st.course
        student = st.student
        if course.lessons.filter(active=True).count() == 0:
            return 0
        else:
            count_lesson = course.lessons.filter(active=True).count()
            # print('count_lesson',count_lesson)
            count_lesson_complete = 0
            lessons = course.lessons.filter(active=True).all()
            for lesson in lessons:
                if lesson.lesson_student.filter(student=student).exists():
                    if lesson.lesson_student.get(student=student).complete:
                        count_lesson_complete = count_lesson_complete + 1
            return round(count_lesson_complete / count_lesson * 100, 0)

    def get_info(self, st):
        request = self.context['request']
        return InfoSerializer(st.student, context={"request": request}).data

    class Meta:
        model = Student_Course
        fields = ['id', 'join_date', 'rate', 'review', 'info_student', 'complete_course']


class StudentInCourseSerializer(serializers.ModelSerializer):
    list_student_accessed = serializers.SerializerMethodField('get_list_student_accessed')
    list_student_pending_access = serializers.SerializerMethodField('get_list_student_pending_access')

    def get_list_student_accessed(self, course):
        request = self.context['request']
        list_student_accessed = self.context.get('list_student_accessed')
        return InfoStudentInCourseSerializer(list_student_accessed, many=True, context={'request': request}).data

    def get_list_student_pending_access(self, course):
        list_student_pending_access = self.context.get('list_student_pending_access')
        request = self.context['request']
        return InfoStudentInCourseSerializer(list_student_pending_access, many=True, context={'request': request}).data

    class Meta:
        model = Course
        fields = ['list_student_accessed', 'list_student_pending_access']


# class HomeWorkSerializer(ModelSerializer):
#     class Meta:
#         model = HomeWork
#         fields = ['id', 'author_teacher', 'lesson', 'subject', 'file', 'content']


class InfoTeacherFollowedSerializer(ModelSerializer):
    teacher = TeacherField(read_only=True)

    class Meta:
        model = Follow
        fields = ['id', 'teacher']


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
