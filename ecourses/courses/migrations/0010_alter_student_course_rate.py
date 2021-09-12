# Generated by Django 3.2.6 on 2021-09-12 01:45

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_auto_20210909_2148'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student_course',
            name='rate',
            field=models.IntegerField(blank=True, null=True, validators=[django.core.validators.MaxValueValidator(5), django.core.validators.MinValueValidator(0)]),
        ),
    ]