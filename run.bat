@echo off
echo ==================================
echo 启动Jenkins测试项目
echo ==================================

if not exist "target\jenkins-test-1.0.0.jar" (
    echo 错误: 未找到JAR文件，请先运行 build.bat 构建项目
    pause
    exit /b 1
)

echo 启动Spring Boot应用...
echo 访问地址: http://localhost:8080
echo 按 Ctrl+C 停止应用
echo.

java -jar target\jenkins-test-1.0.0.jar
