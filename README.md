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

项目包含四个Jenkins配置文件，按推荐顺序：

### 1. Jenkinsfile.minimal（最推荐）
- 最简化版本，避免所有兼容性问题
- 只包含基础的构建、测试、验证功能
- 适合快速验证Jenkins环境

### 2. Jenkinsfile（推荐）
- 标准版本，包含完整的CI/CD流程
- 使用`junit`而不是`publishTestResults`
- 包含测试结果发布和构建产物归档

### 3. Jenkinsfile.simple（备用）
- 简化版本，使用Maven Wrapper
- 兼容性较好

### 4. Jenkinsfile.docker（高级）
- Docker容器环境下构建
- 完全隔离的构建环境

### 常见问题解决

**问题1：`publishTestResults`方法不存在**
- 解决方案：使用`junit`方法替代
- 已在所有Jenkinsfile中修复

**问题2：curl命令不可用**
- 解决方案：添加curl存在性检查
- 如果没有curl则跳过健康检查

**建议使用顺序：**
1. 首先尝试`Jenkinsfile.minimal`
2. 如果成功，再尝试`Jenkinsfile`
3. 如果有问题，使用`Jenkinsfile.simple`

### Jenkins环境要求

**选项1：使用系统环境**
- 确保Jenkins服务器上安装了Java 17+
- 确保Jenkins服务器上安装了Maven 3.6+
- 确保java和mvn命令在PATH中可用

**选项2：配置Jenkins工具管理**
1. 进入Jenkins -> 系统管理 -> 全局工具配置
2. 配置JDK：
   - 名称：可以是任意名称（如"JDK-17"）
   - JAVA_HOME路径：指向Java安装目录
3. 配置Maven：
   - 名称：可以是任意名称（如"Maven-3.8.1"）
   - MAVEN_HOME路径：指向Maven安装目录

**选项3：使用Docker**
```dockerfile
FROM openjdk:17-jdk-slim
RUN apt-get update && apt-get install -y maven
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests
CMD ["java", "-jar", "target/jenkins-test-1.0.0.jar"]
```

### 故障排除

如果遇到工具配置错误：
1. 检查Jenkins全局工具配置中的工具名称
2. 更新Jenkinsfile中的工具名称以匹配配置
3. 或者使用Jenkinsfile.simple（不依赖工具配置）
4. 确保Jenkins有权限访问Git仓库
