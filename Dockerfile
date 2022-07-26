FROM openjdk:11

ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.15.0/opentelemetry-javaagent.jar lib/opentelemetry-javaagent.jar


COPY ./build/libs/receiver-0.0.1-SNAPSHOT.jar app.jar

# ENTRYPOINT ["java", "-javaagent:lib/applicationinsights-agent.jar", "-jar", "/app.jar"]

ENTRYPOINT ["java", \
            "-javaagent:lib/opentelemetry-javaagent.jar", \
            "-Dotel.service.name=receiver", \
            "-Dotel.traces.exporter=jaeger", \
            "-Dotel.exporter.jaeger.endpoint=http://simplest-collector-headless.observability.svc:14250", \
            "-jar", "/app.jar" \
]
