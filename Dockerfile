FROM openjdk:17

ARG JAR_FILE=target/devopsson-0.0.1-SNAPSHOT.jar

WORKDIR /app

COPY ${JAR_FILE} app.jar

# Güvenlik güncellemeleri için OpenJDK sürümünü belirtin
# Örneğin, OpenJDK 17.0.1 sürümünü kullanabilirsiniz
# (Güncel bir sürümü kontrol edin)
FROM openjdk:17.0.1

# Gereksiz paketlerin kaldırılması
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
