# 基于哪个镜像
FROM openjdk:8-jdk-alpine

# 将本地文件夹挂载到当前容器
VOLUME /tmp

# 这个地方jar包名称改成自己的jar名称
ADD target/eureka-server.jar app.jar
#RUN bash -c 'touch /app.jar'

# 开放8761端口
EXPOSE 8761

# 配置容器启动后执行的命令
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]