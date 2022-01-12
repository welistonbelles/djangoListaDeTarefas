from django.db import models
from django.contrib.auth import get_user_model

# SIGNALS
from django.db.models import signals


class Base(models.Model):
    criado = models.DateField('Data de Criação', auto_now_add=True)
    modificado = models.DateField('Data de Atualização', auto_now=True)

    class Meta:
        abstract = True

class Task(Base):
    COMPLEXITY_CHOICES = (
        ('Facil', 'Facil'),
        ('Medio', 'Medio'),
        ('Dificil', 'Dificil')
    )

    author = models.ForeignKey(get_user_model(), verbose_name='Autor', on_delete=models.CASCADE)
    title = models.CharField('Titulo', max_length=100)
    description = models.CharField('Descrição', max_length=300)
    completed = models.BooleanField('Concluída?', default=False)
    complexity = models.CharField('Complexidade', max_length=7, choices=COMPLEXITY_CHOICES, default="Facil")
    duration = models.CharField('Duração', max_length=9, blank=True, editable=False, default="2hr ~ 4hr")

    class Meta:
        verbose_name = 'Task'
        verbose_name_plural = 'Tasks'
        ordering = ['id']

    def __str__(self):
        return self.title


def duration_pre_save(signal, instance, sender, **kwargs):
    if instance.complexity == 'Dificil':
        instance.duration = '+8hrs'
    elif instance.complexity == 'Medio':
        instance.duration = '4hr~8hr'
    else:
        instance.duration = '2hr~4hr'
    
signals.pre_save.connect(duration_pre_save, sender=Task)