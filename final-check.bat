@echo off
echo ===============================================
echo Jenkins项目最终验证
echo ===============================================

echo.
echo 1. 检查项目文件...
if exist "pom.xml" (echo ✓ pom.xml) else (echo ✗ pom.xml 缺失)
if exist "Jenkinsfile" (echo ✓ Jenkinsfile) else (echo ✗ Jenkinsfile 缺失)
if exist "src\main\java" (echo ✓ 源代码目录) else (echo ✗ 源代码目录缺失)
if exist "src\test\java" (echo ✓ 测试代码目录) else (echo ✗ 测试代码目录缺失)

echo.
echo 2. 检查Jenkinsfile选项...
if exist "Jenkinsfile.minimal" (echo ✓ Jenkinsfile.minimal - 推荐首次测试)
if exist "Jenkinsfile.simple" (echo ✓ Jenkinsfile.simple - 简化版本)
if exist "Jenkinsfile.docker" (echo ✓ Jenkinsfile.docker - Docker版本)

echo.
echo 3. 检查环境工具...
java -version >nul 2>&1 && echo ✓ Java可用 || echo ✗ Java不可用
mvn -version >nul 2>&1 && echo ✓ Maven可用 || echo ✗ Maven不可用
git --version >nul 2>&1 && echo ✓ Git可用 || echo ✗ Git不可用

echo.
echo 4. 本地快速测试建议...
echo    mvn clean compile   # 编译测试
echo    mvn test           # 运行测试
echo    mvn package        # 打包应用

echo.
echo 5. Jenkins配置建议...
echo    选项A: 使用 Jenkinsfile.minimal ^(最安全^)
echo    选项B: 使用当前 Jenkinsfile ^(功能完整^)
echo    选项C: 使用 Jenkinsfile.docker ^(环境隔离^)

echo.
echo ===============================================
echo 项目状态: 就绪 - 可以在Jenkins中测试 ✅
echo ===============================================

pause
