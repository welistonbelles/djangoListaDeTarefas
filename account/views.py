from django.views.generic import TemplateView
from django.contrib.auth.models import User
from .serializers import UserSerializer

# DRF
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework import status


class UserCreateView(TemplateView):
    template_name = 'create.html'

class UserLoginView(TemplateView):
    template_name = 'login.html'

class UserCreateAPIView(viewsets.ModelViewSet):
    authentication_classes = []
    permission_classes = []
    
    queryset = User.objects.all()
    serializer_class = UserSerializer

    def create(self, request):
        serializer = UserSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.create(request.data)
        user = User.objects.get(username=request.data['username'])
        return Response({"username": serializer.data['username'], "email": serializer.data['email'], "token": user.auth_token.key}, status=status.HTTP_201_CREATED)