# Select base image that use Python 3.10
FROM python:3.10

# State environment variables
ENV PROJECT=nutritrack-api
ENV VERSION=0.0.1

ENV FLASK_APP=cs348_api
ENV FLASK_ENV=development

ENV MYSQL_HOST=db
ENV MYSQL_USER=group8
ENV MYSQL_PASSWORD=Password0!
ENV MYSQL_DATABASE=nutritrack

# Set working directory (Home directory)
WORKDIR /app

# Copy requirements file first (for caching)
COPY requirements.txt .

# Install required python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of project
COPY . .

# Expose the port
EXPOSE 6608

# Run the entry point script and run the the flask
CMD ["./entrypoint.sh", "python3", "-B", "src/app.py"]
