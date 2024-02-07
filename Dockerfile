FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY gradlew .
COPY *.gradle ./
COPY .gradle .gradle
COPY gradle gradle
COPY src src

#RUN --mount=type=cache,target=/root/.gradle ./gradlew clean build
RUN ./gradlew clean build
RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../libs/*-SNAPSHOT.jar)

FROM eclipse-temurin:17-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring

ENV SPRING_PROFILES_ACTIVE=docker

ARG DEPENDENCY=build/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.demokt.DemoKtApplicationKt"]