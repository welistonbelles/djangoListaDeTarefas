from django.contrib import admin
from django.urls import path

from django.conf.urls.static import static
from django.conf import settings

from .views import UserCreateView, UserCreateAPIView, UserLoginView

urlpatterns = [
    path('', UserCreateView.as_view(), name="account-create"),
    path('create/', UserCreateAPIView.as_view({
        'post': 'create'
    }))
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
