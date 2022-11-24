FROM openjdk:11-jre
COPY ./db/ /docker-entrypoint-initdb.d/
# RUN chmod 777 . /home/ubuntu/ScriptShell/animix-data-colection-CLI/animix/target/
# CMD ["java", "-jar", "animix-1.0-SNAPSHOT-jar-with-dependencies.jar"]
