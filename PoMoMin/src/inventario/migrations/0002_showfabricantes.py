# Generated by Django 4.1.6 on 2023-02-16 23:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('inventario', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='showFabricantes',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('FabricanteID', models.IntegerField()),
                ('Nombre', models.CharField(max_length=100)),
                ('Activo', models.IntegerField()),
            ],
            options={
                'db_table': 'Fabricantes',
            },
        ),
    ]