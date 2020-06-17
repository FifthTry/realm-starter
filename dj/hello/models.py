from django.db import models


class Counter(models.Model):
    count = models.IntegerField(default=0)


class Todo(models.Model):
    text = models.CharField(max_length=500)
    date = models.DateField()
    finished = models.IntegerField()
