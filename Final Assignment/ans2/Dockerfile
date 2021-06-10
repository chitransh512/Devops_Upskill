FROM maven:3.6.1-jdk-14
WORKDIR /app
COPY . .
RUN mvn -B clean verify package