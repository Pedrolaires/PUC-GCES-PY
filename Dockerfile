# Use an official Python runtime as a base image
FROM python:3.8

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements file into the container at /usr/src/app
COPY requirements.txt .

# Install any needed dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire src directory into the container at /usr/src/app
COPY src/ .

# Install Sphinx and Doxygen
RUN pip install sphinx doxygen

# Generate Sphinx documentation
RUN sphinx-build -b html source _build/html

# Generate Doxygen documentation
RUN doxygen Doxyfile

# Set the default command to execute when the container starts
CMD ["python", "./src/main.py"]
