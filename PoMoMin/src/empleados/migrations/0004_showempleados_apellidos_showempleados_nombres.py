# Generated by Django 4.1.6 on 2023-02-21 00:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('empleados', '0003_showempleados_departamento'),
    ]

    operations = [
        migrations.AddField(
            model_name='showempleados',
            name='Apellidos',
            field=models.CharField(default=None, max_length=100),
        ),
        migrations.AddField(
            model_name='showempleados',
            name='Nombres',
            field=models.CharField(default=None, max_length=100),
        ),
    ]