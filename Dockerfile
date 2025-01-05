# Step 1: Use Python 3.13 slim image as the base
FROM python:3.13-slim

# Step 2: Install necessary system dependencies
RUN apt-get update \
    && apt-get install -y gcc libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*  
# Clean up apt cache to reduce image size

# Step 3: Set environment variables to prevent .pyc files and ensure output is visible
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Step 4: Set the working directory inside the container
WORKDIR /opt

# Step 5: Copy only the requirements file first to leverage Docker cache
COPY requirements.txt /opt/

# Step 6: Install Python dependencies
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Step 7: Copy the rest of the application code
COPY . /opt/

# Step 8: Expose the port Django will run on (default is 8000)
EXPOSE 8000

# Step 9: Run Gunicorn with the application
CMD ["gunicorn", "multiant.wsgi:application", "--bind", "0.0.0.0:8000"]
