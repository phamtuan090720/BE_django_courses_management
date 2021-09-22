from rest_framework.pagination import PageNumberPagination

class  BasePaginator(PageNumberPagination):
        page_size = 6

class UserPaginator(PageNumberPagination):
        page_size = 10

class LessonPaginator(PageNumberPagination):
        page_size = 10