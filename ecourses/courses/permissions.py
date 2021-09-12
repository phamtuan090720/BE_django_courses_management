
from rest_framework.permissions import BasePermission, SAFE_METHODS, IsAuthenticated


class CoursePermission(BasePermission):
    message = "You must be the owner of this obj"
    def has_permission(self, request, view):
        if request.method in SAFE_METHODS:
            return True
        return request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if view.action in ['hide_courses', 'open_courses', 'change_status', 'add_tag']:
            return obj.user == request.user
        # return True