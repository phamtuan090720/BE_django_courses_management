# Generated by Django 3.2.6 on 2021-09-12 07:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0010_alter_student_course_rate'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='subject',
            field=models.TextField(null=True),
        ),
    ]
