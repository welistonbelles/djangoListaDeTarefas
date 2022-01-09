from django.views.generic import TemplateView

from core.serializers import TaskSerializer
from .models import Task 

# DRF
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

class IndexView(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context = super(IndexView, self).get_context_data(**kwargs)
        context['firstRow'] = Task.objects.all()[:4]
        context['secondRow'] = Task.objects.all()[4:]
        return  context

class TaskAPIView(APIView):
    """
        API De Tarefas
    """

    def get(self, request):
        tasks = Task.objects.all()
        serializer = TaskSerializer(tasks, many=True)
        return Response(serializer.data)

    def post(self, request):
        serializer = TaskSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)