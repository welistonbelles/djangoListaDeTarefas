# Generated by Django 4.0.1 on 2022-01-05 20:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0005_task_duration'),
    ]

    operations = [
        migrations.AlterField(
            model_name='task',
            name='complexity',
            field=models.CharField(choices=[('facil', 'Facil'), ('medio', 'Medio'), ('dificil', 'Dificil')], default='Facil', max_length=7, verbose_name='Complexidade'),
        ),
    ]
