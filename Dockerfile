
FROM openjdk:8-jre-alpine
#拷贝的jar不同（分为consumer 与provider ），注释不同的行
#COPY --from=0 /source/dubbo-spring-boot-samples/dubbo-spring-boot-sample-provider/target/dubbo-spring-boot-sample-provider-0.2.1-SNAPSHOT.jar /
COPY /home/gitlab-runner/dubbo-consumer-test.jar /
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar","/dubbo-consumer-test.jar"]

