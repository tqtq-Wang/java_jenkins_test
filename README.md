# Jenkins测试项目

这是一个简单的Spring Boot 3项目，专门用于测试Jenkins CI/CD流水线。

## 项目特性

- Spring Boot 3.2.0
- Java 17
- 简单的REST API
- 单元测试
- Jenkins Pipeline配置

## API端点

- `GET /` - 主页，返回问候信息
- `GET /health` - 健康检查端点
- `GET /jenkins` - Jenkins测试端点，显示当前时间

## 本地运行

1. 确保安装了Java 17和Maven
2. 在项目根目录运行：
   ```bash
   mvn spring-boot:run
   ```
3. 访问 http://localhost:8080

## 测试

运行所有测试：
```bash
mvn test
```

## 构建

创建可执行JAR：
```bash
mvn clean package
```

## Jenkins配置

项目包含 `Jenkinsfile`，定义了完整的CI/CD流水线：
- 代码检出
- 编译
- 测试
- 打包
- 部署

### Jenkins配置要求

在Jenkins中需要配置：
- Maven 3.8.1 (工具名称: Maven-3.8.1)
- JDK 17 (工具名称: JDK-17)

如果工具名称不同，请修改 `Jenkinsfile` 中的工具配置。
