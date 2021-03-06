from django.views.generic import TemplateView

from .models import Task
from .serializers import TaskSerializer

# DRF
from rest_framework import viewsets, status
from rest_framework.response import Response


class IndexView(TemplateView):
    template_name = 'index.html'

class DocumentationView(TemplateView):
    template_name = 'documentation.html'

class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer

    def list(self, request):
        user = request.user
        
        tasks = Task.objects.all().filter(author=user.pk)

        if request.query_params.get('complexity'):
            tasks = tasks.filter(complexity=request.query_params['complexity'])

        if request.query_params.get('completed'):
            if request.query_params['completed'].lower() == 'false' or request.query_params['completed'].lower() == 'true':
                
                tasks = tasks.filter(completed=(request.query_params['completed'].capitalize() or False))
        

        page = self.paginate_queryset(tasks)
        if page is not None:
            serializer = TaskSerializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = TaskSerializer(tasks, many=True)
        return Response(serializer.data)
    
    def create(self, request):
        request.data['author'] = request.user.pk
        serializer = TaskSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def retrieve(self, request, pk=None):
        task = Task.objects.get(id=pk)
        serializer = TaskSerializer(task)
        return Response(serializer.data)

    def update(self, request, pk=None):
        request.data['author'] = request.user.pk
        task = Task.objects.get(id=pk)
        serializer = TaskSerializer(instance=task, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data, status=status.HTTP_202_ACCEPTED)

    def destroy(self, request, pk=None):
        task = Task.objects.get(id=pk)
        task.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


