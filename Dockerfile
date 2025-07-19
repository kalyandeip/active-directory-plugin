# Use Maven with OpenJDK 8 (as required by the plugin)
FROM maven:3.8.8-eclipse-temurin-8

# Set working directory
WORKDIR /usr/src/app

# Copy the entire project into the container
COPY . .

# Build the plugin (you can use -DskipTests for faster builds)
RUN mvn clean install -DskipTests

# Default command to list the HPI output
CMD ["ls", "-l", "target/*.hpi"]
