@echo off
echo ===============================================
echo Jenkinsfile 语法检查
echo ===============================================

echo.
echo 检查Jenkinsfile语法结构...

findstr /N "stage(" Jenkinsfile
echo.

echo 检查括号匹配...
powershell -Command "
$content = Get-Content 'Jenkinsfile' -Raw
$openBraces = ($content.ToCharArray() | Where-Object { $_ -eq '{' }).Count
$closeBraces = ($content.ToCharArray() | Where-Object { $_ -eq '}' }).Count
Write-Host 'Open braces: ' $openBraces
Write-Host 'Close braces: ' $closeBraces
if ($openBraces -eq $closeBraces) {
    Write-Host '✓ 括号匹配正确'
} else {
    Write-Host '✗ 括号不匹配'
}
"

echo.
echo 检查关键字...
findstr /N /C:"pipeline" /C:"agent" /C:"stages" /C:"steps" /C:"post" Jenkinsfile

echo.
echo ===============================================
echo 基本语法检查完成
echo ===============================================
