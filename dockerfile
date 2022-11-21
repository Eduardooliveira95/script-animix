FROM openjdk:8-jre
COPY . /ScriptShell/animix-data-colection-CLI/animix/target/animix-1.0-SNAPSHOT-jar-with-dependencies.jar/
RUN java -jar animix-1.0-SNAPSHOT-jar-with-dependencies.jar
# CMD ["java", "-jar", "animix-1.0-SNAPSHOT-jar-with-dependencies.jar"]
