from rest_framework.permissions import BasePermission, SAFE_METHODS

class CoursePerm(BasePermission):
    message = "You must be the owner of this obj"

    def has_object_permission(self, request, view, obj):
        if view.action == 'Hide this courses':
            return obj.teacher.user.id == request.user.id