from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone

class AttendanceRecord(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(default=timezone.now)
    status = models.CharField(max_length=10, choices=[('Present', 'Present'), ('Absent', 'Absent')])

    def __str__(self):
        return f'{self.user.username} - {self.status} - {self.timestamp}'
