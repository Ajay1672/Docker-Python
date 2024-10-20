FROM python:3.10-alpine AS builder

WORKDIR /app

# Copy the requirements file first to leverage Docker's cache
COPY requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app.py /app

# Expose the port the app runs on
EXPOSE 8000

# Set the entry point for the container
ENTRYPOINT ["python3"]

# Specify the default command to run your app
CMD ["app.py"]
