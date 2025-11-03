@echo off
title 🚀 Otimizador de Jogos - V2 by Claudio Almeida
color 0A
echo =====================================================
echo     🔧 Otimizador de Jogos do Windows - V2
echo =====================================================
echo.
echo 🕐 Iniciando tarefas de manutenção e desempenho...
echo.

:: 1️⃣ Verificar e corrigir arquivos do sistema
echo [1/9] Verificando integridade do Windows...
sfc /scannow
echo.

:: 2️⃣ Reparo da imagem do sistema
echo [2/9] Reparo de componentes do sistema...
DISM /Online /Cleanup-Image /RestoreHealth
echo.

:: 3️⃣ Corrigir disco D:
echo [3/9] Verificando disco D: (aguarde)...
chkdsk D: /f /r
echo.

:: 4️⃣ Corrigir permissões no disco D:
echo [4/9] Corrigindo permissões no disco D:...
takeown /f D:\ /r /d y
icacls D:\ /grant Administradores:F /t
icacls D:\ /grant Everyone:F /t
echo.

:: 5️⃣ Reiniciar serviços essenciais
echo [5/9] Reiniciando serviços importantes...
net stop wuauserv >nul
net start wuauserv >nul
net stop bits >nul
net start bits >nul
net stop cryptsvc >nul
net start cryptsvc >nul
echo Serviços reiniciados com sucesso.
echo.

:: 6️⃣ Limpar caches e arquivos temporários
echo [6/9] Limpando caches e arquivos temporários...
del /s /q "%temp%\*.*" >nul
del /s /q "C:\Windows\Temp\*.*" >nul
del /s /q "C:\Windows\Prefetch\*.*" >nul
cleanmgr /sagerun:1
echo Limpeza concluída.
echo.

:: 7️⃣ Otimizar rede e ping
echo [7/9] Otimizando rede para jogos online...
ipconfig /flushdns
netsh int ip reset
netsh winsock reset
netsh advfirewall reset
echo Rede otimizada e DNS limpo.
echo.

:: 8️⃣ Otimizar cache gráfico (DirectX e shaders)
echo [8/9] Limpando cache gráfico e shaders...
del /s /q "%LOCALAPPDATA%\NVIDIA\DXCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\NVIDIA\GLCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\D3DSCache\*.*" >nul 2>&1
echo Cache gráfico limpo.
echo.

:: 9️⃣ Definir prioridade máxima para jogos
echo [9/9] Ajustando prioridade do sistema para desempenho...
powercfg -setactive SCHEME_MIN
wmic process where name="explorer.exe" CALL setpriority "128"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f
echo Prioridade ajustada e modo desempenho ativado.
echo.

echo =====================================================
echo ✅ Otimização completa!
echo 🕹️ Seu sistema está pronto para rodar jogos no máximo!
echo =====================================================
pause
exit
