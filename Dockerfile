# Stage 1: Use Maven with JDK 8 to build the plugin
FROM maven:3.8.8-eclipse-temurin-8 AS builder

# Set working directory
WORKDIR /usr/src/app

# Copy project files
COPY . .

# Ensure latest metadata and avoid Maven cache issues
RUN mvn clean install -DskipTests -U

# Stage 2: Optional minimal image (you can skip if you just want the .hpi file)
# FROM openjdk:8-jre-slim
# COPY --from=builder /usr/src/app/target/*.hpi /plugin/

# CMD ["ls", "-l", "/plugin"]

# If you're just building and exporting .hpi, stop here

# Default CMD to show output
CMD ["ls", "-l", "target/*.hpi"]
