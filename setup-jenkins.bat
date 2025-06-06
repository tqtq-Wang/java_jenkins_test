@echo off
echo ===============================================
echo Jenkins项目快速设置指南
echo ===============================================

echo.
echo 1. 检查Java环境...
java -version >nul 2>&1
if %errorlevel%==0 (
    echo ✓ Java已安装
    java -version
) else (
    echo ✗ Java未安装或未配置PATH
    echo   请安装Java 17或更高版本
)

echo.
echo 2. 检查Maven环境...
mvn -version >nul 2>&1
if %errorlevel%==0 (
    echo ✓ Maven已安装
    mvn -version
) else (
    echo ✗ Maven未安装或未配置PATH
    echo   请安装Maven 3.6或更高版本
)

echo.
echo 3. 检查Git环境...
git --version >nul 2>&1
if %errorlevel%==0 (
    echo ✓ Git已安装
    git --version
) else (
    echo ✗ Git未安装或未配置PATH
    echo   请安装Git
)

echo.
echo ===============================================
echo Jenkins配置选项：
echo ===============================================
echo.
echo 选项1: 使用标准Jenkinsfile
echo   - 需要在Jenkins中配置Java和Maven工具
echo   - 文件：Jenkinsfile
echo.
echo 选项2: 使用简化版Jenkinsfile  
echo   - 依赖系统环境中的Java和Maven
echo   - 文件：Jenkinsfile.simple
echo.
echo 选项3: 使用Docker版Jenkinsfile
echo   - 在Docker容器中构建，无需本地工具
echo   - 文件：Jenkinsfile.docker
echo.
echo ===============================================
echo 建议的Jenkins Pipeline配置：
echo ===============================================
echo.
echo 1. 创建新的Pipeline项目
echo 2. 配置Git仓库URL
echo 3. 选择以下之一：
echo    - Pipeline script from SCM，使用Jenkinsfile
echo    - 或重命名其他Jenkinsfile为Jenkinsfile使用
echo.
echo 4. 如果使用标准Jenkinsfile，请确保Jenkins中配置了：
echo    - JDK工具（名称可自定义）
echo    - Maven工具（名称可自定义）
echo.
echo ===============================================

pause
