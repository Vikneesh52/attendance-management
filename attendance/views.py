from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import AttendanceRecord
from django.utils import timezone

@login_required
def record_attendance(request):
    if request.method == 'POST':
        status = request.POST.get('status')
        AttendanceRecord.objects.create(user=request.user, status=status)
        return redirect('attendance:attendance_list')
    return render(request, 'attendance/record_attendance.html')

@login_required
def attendance_list(request):
    records = AttendanceRecord.objects.filter(user=request.user)
    return render(request, 'attendance/attendance_list.html', {'records': records})
