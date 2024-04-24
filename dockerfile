# Use a specific version of the Python base image to ensure consistency across builds
FROM python:3.9-slim

# Set the working directory in the Docker container
WORKDIR /app

# Copy only the requirements file to the working directory to leverage Docker cache
COPY requirements.txt ./

# Install any required packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Expose port 6000 to allow communication to/from the server
EXPOSE 6000

# Command to run the application when the container starts
CMD ["python", "app.py"]
