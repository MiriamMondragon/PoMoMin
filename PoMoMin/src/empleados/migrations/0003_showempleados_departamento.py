# Generated by Django 4.1.6 on 2023-02-21 00:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('empleados', '0002_showempleados_delete_showjefes'),
    ]

    operations = [
        migrations.AddField(
            model_name='showempleados',
            name='Departamento',
            field=models.TextField(default=None, max_length=100),
        ),
    ]
