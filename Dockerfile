# Usa la imagen base de Java 21
FROM openjdk:17.0.1-jdk-slim

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copia el JAR compilado al contenedor
COPY target/euraka-0.0.1-SNAPSHOT.jar app.jar

# Expone el puerto 8761
EXPOSE 8761

# Comando de inicio de la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]