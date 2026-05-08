# Use an official Maven image with Eclipse Temurin JDK 23
FROM maven:3.9-eclipse-temurin-23

# Install necessary X11, OpenGL, and GTK libraries required by JavaFX for GUI rendering
RUN apt-get update && apt-get install -y \
    libx11-6 \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libgl1-mesa-glx \
    libgtk-3-0 \
    libasound2 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code into the container
COPY pom.xml .
COPY src ./src

# Build the application and download dependencies (including Linux JavaFX binaries)
RUN mvn clean compile

# Command to run the application using the JavaFX Maven plugin
CMD ["mvn", "javafx:run"]
