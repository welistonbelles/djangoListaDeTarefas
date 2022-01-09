from django.urls import path

from .views import IndexView, TaskViewSet, DocumentationView

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('documentation/', DocumentationView.as_view(), name='documentation'),
    path('api/v1/tasks/', TaskViewSet.as_view({
        'get': 'list',
        'post': 'create',
    })),
    path('api/v1/tasks/<str:pk>', TaskViewSet.as_view({
        'get': 'retrieve',
        'put': 'update',
        'delete': 'destroy'
    }))
]