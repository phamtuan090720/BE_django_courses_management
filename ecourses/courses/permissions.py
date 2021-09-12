
from rest_framework.permissions import BasePermission, SAFE_METHODS, IsAuthenticated


class CoursePerm(BasePermission):
    message = "You must be the owner of this obj"
    def has_permission(self, request, view):
        if request.method in SAFE_METHODS:
            return True
        return request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if view.action == 'Hide this courses':
            return obj.teacher.user == request.user