from rest_framework.permissions import BasePermission, SAFE_METHODS, IsAuthenticated


class CoursePermission(BasePermission):
    def has_permission(self, request, view):
        if view.action in ["complete_lesson"]:
            return request.user.is_authenticated
        elif request.method in SAFE_METHODS:
            return True
        return request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True
        elif view.action in ['user_rating']:
            return request.user.is_authenticated
        elif view.action in ['hide_courses', 'open_courses', 'change_status', 'add_tag', 'delete_student',
                             'accept_student', 'add_lesson','get_student_course'] or request.method in ['PUT', 'PATCH', 'DELETE']:
            return obj.teacher.activeTeacher and obj.teacher.user == request.user


class LessonPermission(BasePermission):
    def has_permission(self, request, view):
        if request.method in SAFE_METHODS:
            return True
        return request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True
        elif request.method in ['PUT', 'PATCH', 'DELETE'] or view.action in ['add_video']:
            return obj.course.teacher.activeTeacher and obj.course.teacher.user == request.user
        else:
            return request.user.is_authenticated


class UserPermission(BasePermission):
    def has_permission(self, request, view):
        if view.action in ["get_current_user", "unactive_user", "upgrade_user", "get_courses_registered"]:
            return request.user.is_authenticated
        if request.method in SAFE_METHODS or view.action == "create":
            return True
        return request.user.is_authenticated


class OwnerPermission(BasePermission):
    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True
        elif request.method in ['PUT', 'PATCH', 'DELETE']:
            return request.user.is_authenticated and obj.author_teacher.user == request.user
        else:
            return request.user.is_authenticated


class TeacherPermission(BasePermission):
    def has_permission(self, request, view):
        if request.method in SAFE_METHODS:
            return True
        return request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True
        elif view.action == 'get_list_courses' or request.method in ['PUT', 'PATCH']:
            return request.user.is_authenticated and obj.activeTeacher and obj.user == request.user
