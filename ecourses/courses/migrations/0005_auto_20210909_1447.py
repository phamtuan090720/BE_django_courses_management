# Generated by Django 3.2.6 on 2021-09-09 07:47

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0004_alter_course_teacher'),
    ]

    operations = [
        migrations.RenameField(
            model_name='course',
            old_name='type',
            new_name='fee',
        ),
        migrations.RenameField(
            model_name='course',
            old_name='status',
            new_name='is_public',
        ),
    ]