FROM openjdk:17-jdk-slim

# 安装Maven
RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 复制项目文件
COPY pom.xml .
COPY src ./src

# 构建应用
RUN mvn clean package -DskipTests

# 暴露端口
EXPOSE 8080

# 运行应用
CMD ["java", "-jar", "target/jenkins-test-1.0.0.jar"]
