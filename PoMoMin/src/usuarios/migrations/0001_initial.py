# Generated by Django 4.1.6 on 2023-03-14 15:28

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='showEstados',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('EstadoID', models.IntegerField()),
                ('Estado', models.CharField(max_length=100)),
                ('Descripcion', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'EstadosUsuario',
            },
        ),
        migrations.CreateModel(
            name='showPerfiles',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('PerfilID', models.IntegerField()),
                ('NombrePerfil', models.CharField(max_length=100)),
                ('Descripcion', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'PerfilesUsuario',
            },
        ),
        migrations.CreateModel(
            name='showUsuarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('UsuarioID', models.IntegerField()),
                ('Usuario', models.CharField(max_length=200)),
                ('Token', models.CharField(max_length=300)),
                ('PerfilID', models.IntegerField(default=None)),
                ('NombrePerfil', models.CharField(max_length=100)),
                ('FechaCreacion', models.CharField(default=None, max_length=100)),
                ('FechaUltimaActualizacion', models.CharField(default=None, max_length=100)),
                ('EstadoID', models.IntegerField(default=None)),
                ('Estado', models.CharField(default=None, max_length=100)),
            ],
            options={
                'db_table': 'v_Usuarios',
            },
        ),
    ]