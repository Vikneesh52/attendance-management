# Use the official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port 8000 for the application
EXPOSE 8000

# Start the Django application with the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]

# Run Django's development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
