from rest_framework import serializers

from .models import Task

class TaskSerializer(serializers.ModelSerializer):

    class Meta:
        model = Task
        fields = (
            'id',
            'author',
            'title',
            'description',
            'completed',
            'complexity',
            'duration',
            'criado',
        )