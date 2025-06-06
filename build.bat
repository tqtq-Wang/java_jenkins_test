@echo off
echo ==================================
echo Jenkins测试项目构建脚本
echo ==================================

echo 检查Java版本...
java -version

echo.
echo 开始Maven构建...
if exist "%MAVEN_HOME%\bin\mvn.cmd" (
    echo 使用MAVEN_HOME中的Maven: %MAVEN_HOME%
    "%MAVEN_HOME%\bin\mvn.cmd" clean package
) else if exist "mvn.cmd" (
    echo 使用PATH中的Maven
    mvn.cmd clean package
) else (
    echo 错误: 未找到Maven，请安装Maven并配置环境变量
    echo 或者使用Maven Wrapper: .\mvnw.cmd clean package
    pause
    exit /b 1
)

echo.
echo 构建完成！
echo JAR文件位置: target\jenkins-test-1.0.0.jar
echo.
echo 要运行应用，请执行:
echo java -jar target\jenkins-test-1.0.0.jar
echo.
pause
