@echo off
echo ===============================================
echo Jenkins Pipeline 语法检查工具
echo ===============================================

echo.
echo 检查可用的Jenkinsfile...

if exist "Jenkinsfile.minimal" (
    echo ✓ Jenkinsfile.minimal - 最简版本 ^(推荐首次尝试^)
)

if exist "Jenkinsfile" (
    echo ✓ Jenkinsfile - 标准版本
)

if exist "Jenkinsfile.simple" (
    echo ✓ Jenkinsfile.simple - 简化版本
)

if exist "Jenkinsfile.docker" (
    echo ✓ Jenkinsfile.docker - Docker版本
)

echo.
echo ===============================================
echo 本地测试建议：
echo ===============================================
echo.
echo 1. 测试Java和Maven环境：
echo    java -version
echo    mvn -version
echo.
echo 2. 测试编译：
echo    mvn clean compile
echo.
echo 3. 测试运行测试：
echo    mvn test
echo.
echo 4. 测试打包：
echo    mvn package
echo.
echo 5. 测试应用启动：
echo    java -jar target\jenkins-test-1.0.0.jar
echo.
echo ===============================================
echo Jenkins使用建议：
echo ===============================================
echo.
echo 步骤1: 重命名 Jenkinsfile.minimal 为 Jenkinsfile
echo 步骤2: 提交到Git仓库
echo 步骤3: 在Jenkins中创建Pipeline项目
echo 步骤4: 如果成功，可以尝试功能更完整的版本
echo.
echo 命令示例：
echo git add .
echo git commit -m "Add minimal Jenkinsfile"
echo git push origin main
echo.

pause
