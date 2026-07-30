@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo ============================================
echo   上码FY 启动中...
echo ============================================

REM 启动本地网站（后台运行）
start "上码FY-网站" /min cmd /c "npm start"

REM 等 3 秒让网站起来
timeout /t 3 >nul

REM 启动公网隧道（让手机/别人也能扫）
start "上码FY-公网隧道" cmd /c "npx localtunnel --port 3000"

echo.
echo 本机打开：      http://localhost:3000
echo 手机同WiFi打开：http://192.168.1.22:3000   （最干净，无确认页）
echo 公网地址：      请看刚弹出的“上码FY-公网隧道”窗口里的网址
echo   （公网窗口首次打开会有一个“Continue”确认页，点一下即可）
echo.
echo 按任意键关闭此窗口（网站和隧道会继续在后台运行）
pause >nul
