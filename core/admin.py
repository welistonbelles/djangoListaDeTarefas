from django.contrib import admin

# Register your models here.
from .models import Task

@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ('author','title', 'description', 'completed', 'criado', 'modificado', 'complexity', 'duration')