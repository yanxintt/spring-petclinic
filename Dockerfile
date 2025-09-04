# Use lightweight Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Set working directory
WORKDIR /app

# Copy the entire project into the container
COPY . .

# Make Maven wrapper executable
RUN chmod +x mvnw

# Build the Spring Boot application and skip tests
RUN ./mvnw clean package -DskipTests

# Expose Spring Boot port
EXPOSE 8080

# Run the generated JAR (version-specific)
CMD ["java", "-jar", "target/spring-petclinic-3.5.0-SNAPSHOT.jar"]
