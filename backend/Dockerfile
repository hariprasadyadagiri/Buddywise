# Use Python as base image
FROM python:3.11

# Set working directory inside the container
WORKDIR /app

# Copy dependency file first
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . .

# Expose the FastAPI default port
EXPOSE 8501

# Start the application with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8501"]
