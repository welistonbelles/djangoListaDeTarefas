# Generated by Django 4.0.1 on 2022-01-05 17:48

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Tasks',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('criado', models.DateField(auto_now_add=True, verbose_name='Data de Criação')),
                ('modificado', models.DateField(auto_now=True, verbose_name='Data de Atualização')),
                ('ativo', models.BooleanField(default=True, verbose_name='Ativo?')),
                ('title', models.CharField(max_length=100, verbose_name='Titulo')),
                ('description', models.CharField(max_length=300, verbose_name='Descrição')),
                ('completed', models.BooleanField(default=False, verbose_name='Concluída?')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
