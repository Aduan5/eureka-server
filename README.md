# eureka-server 注册中心服务

### 构建镜像并推送阿里云
mvn clean package -Dmaven.test.skip=true docker:build  -DpushImage

### 镜像容器启动方式

- 单机启动：
> docker run --name eureka-server -p 8761:8761 -d eureka-server

- 集群启动方式
> docker run --name eureka-server1 -p 8761:8761 -e server.port=8761 -e eureka.client.serviceUrl.defaultZone=http://127.0.0.1:8762/eureka,http://127.0.0.1:8763/eureka -d eureka-server

> docker run --name eureka-server2 -p 8762:8762 -e server.port=8762 -e eureka.client.serviceUrl.defaultZone=http://127.0.0.1:8761/eureka,http://127.0.0.1:8762/eureka -d eureka-server

> docker run --name eureka-server3 -p 8763:8763 -e server.port=8763 -e eureka.client.serviceUrl.defaultZone=http://127.0.0.1:8761/eureka,http://127.0.0.1:8763/eureka -d eureka-server

- 说明：
> 1. --name eureka-server  指定docker容器名称为 eureka-server
> 2. -p 8761:8761 docker容器端口暴露，这样才能访问到容器中的服务
> 3. -d 后台运行
> 4. 最后的 eureka-server:latest 是代表镜像的名称，镜像tag为latest时才能省略tag
> 5. -e 指定服务启动参数 


## Docker常用日志
> 查看日志：docker logs -f eureka-server2  （docker 容器名称 或者 容器ID）

> 查看镜像：docker images

> 查看容器列表：docker container ls -all

> 修改镜像名称：docker tag 镜像ID 修改的镜像名 tag名（不写默认 latest）

> 删除镜像：docker rmi -f 镜像ID

> 删除容器：docker rm -f 容器ID

> 停止正在运行的容器： docker stop 容器ID

> 启动容器： docker start 容器ID


## window10 安装docker参考文章
> docker安装参考： https://www.jianshu.com/p/1329954aa329/  
> 环境变量配置参考： https://blog.csdn.net/u010588262/article/details/81905613

## Maven 配置阿里云镜像仓库地址
```xml
<server>
    <!--maven的pom中可以根据这个id找到这个server节点的配置-->  
    <id>docker-aliyun</id>
    <!--这里是在阿里云注册的账号-->
    <username>111111111@qq.com</username>
    <!--这里是在阿里云注册的密码-->
    <password>xxxxxxx</password>
    <configuration>
       <!--这是在阿里云注册时填写的邮箱-->
       <email>111111111@qq.com</email>
    </configuration>
</server>
```