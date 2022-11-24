FROM openjdk:11-jre
COPY . /animix-data-colection-CLI/animix/target/
RUN chmod 777 . /animix-data-colection-CLI/animix/target/animix-1.0-SNAPSHOT-jar-with-dependencies.jar
CMD ["java", "-jar", "animix-1.0-SNAPSHOT-jar-with-dependencies.jar"]
