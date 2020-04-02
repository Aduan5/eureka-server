# eureka-server
注册中心服务

mvn clean package  -Dmaven.test.skip=true

docker build -t [名字]  . //后面有个.表示当前文件下

### 构建镜像并推送阿里云
mvn clean package -Dmaven.test.skip=true docker:build  -DpushImage
