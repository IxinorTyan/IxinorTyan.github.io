@echo off
chcp 65001 > nul
echo ====================================================================
echo   ❖ 一键同步 GitHub 个人主页 (Profile README) 脚本 ❖
echo ====================================================================
echo.
echo 提示：
echo GitHub 规定个人账号主页 (https://github.com/IxinorTyan) 的简介内容，
echo 必须存放在与你用户名完全同名的仓库中：IxinorTyan/IxinorTyan (需设为 Public)
echo.
echo 如果你已经在 GitHub 上创建了该仓库，脚本将自动为你推送更新！
echo.
set /p CONFIRM="是否立即推送当前配置到 IxinorTyan/IxinorTyan ? (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo.
    echo 操作已取消。
    pause
    exit /b
)

echo.
echo [1/3] 检查远程仓库配置...
git remote | findstr /i "profile" > nul
if errorlevel 1 (
    git remote add profile https://github.com/IxinorTyan/IxinorTyan.git
    echo   + 已添加远程仓库地址: https://github.com/IxinorTyan/IxinorTyan.git
) else (
    echo   + 远程仓库 profile 已存在。
)

echo.
echo [2/3] 正在推送到 IxinorTyan/IxinorTyan (main 分支)...
git push -u profile main

if errorlevel 1 (
    echo.
    echo [×] 推送失败！
    echo 常见原因：你尚未在 GitHub 上创建名为 "IxinorTyan" 的仓库。
    echo 解决方法：
    echo   1. 打开浏览器访问 https://github.com/new
    echo   2. Repository name 填写: IxinorTyan
    echo   3. 勾选 Public (必须为公开仓库)
    echo   4. 不要勾选 Initialize this repository with a README
    echo   5. 点击 Create repository，创建完成后再次运行本脚本即可！
) else (
    echo.
    echo [√] 同步成功！打开你的个人主页查看效果：
    echo   https://github.com/IxinorTyan
)

echo.
pause
