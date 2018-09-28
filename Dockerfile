en:3-jdk-8
RUN git clone --depth 1 https://github.com/apache/incubator-dubbo-spring-boot-project.git /source
WORKDIR /source
RUN mvn clean install
#RUN mvn --projects dubbo-admin-backend spring-boot:run


FROM openjdk:8-jre-alpine
#拷贝的jar不同（分为consumer 与provider ），注释不同的行
#COPY --from=0 /source/dubbo-spring-boot-samples/dubbo-spring-boot-sample-provider/target/dubbo-spring-boot-sample-provider-0.2.1-SNAPSHOT.jar /
COPY --from=0 /source/dubbo-spring-boot-samples/dubbo-spring-boot-sample-consumer/target/dubbo-spring-boot-sample-consumer-0.2.1-SNAPSHOT.jar /
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar","/dubbo-spring-boot-sample-consumerr-0.2.1-SNAPSHOT.jar"]

