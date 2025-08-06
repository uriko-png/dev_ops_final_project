# Use python 3.7
FROM python:3.7-slim

# Prevent Python from buffering output
ENV PYTHONUNBUFFERED=1

# Set cwd
WORKDIR /

# Copy dependencies file
COPY requirements.txt .

# Downgrade pip for compatibility with Python 3.7
RUN pip install --upgrade pip==22.3.1

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose the port the app runs on
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
