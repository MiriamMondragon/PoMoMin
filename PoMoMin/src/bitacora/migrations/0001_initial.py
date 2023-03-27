# Generated by Django 4.1.6 on 2023-03-10 15:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='showBitacora',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('NoRegistro', models.IntegerField()),
                ('Usuario', models.CharField(max_length=100)),
                ('FechaHoraEvento', models.CharField(max_length=100)),
                ('TipoEvento', models.CharField(max_length=50)),
                ('EstadoEvento', models.CharField(max_length=50)),
                ('Descripcion', models.CharField(max_length=250)),
                ('Dispositivo', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'Bitacora',
            },
        ),
    ]