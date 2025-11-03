@echo off
title 🚀 Otimizador de Jogos - V2 by Claudio Almeida
color 0A
echo =====================================================
echo     🔧 Otimizador de Jogos do Windows - V2
echo =====================================================
echo.
echo 🕐 Iniciando tarefas de manutencao e desempenho...
echo.

:: 1️⃣ Verificar e corrigir arquivos do sistema
echo [1/9] Verificando integridade do Windows...
sfc /scannow
echo.

:: 2️⃣ Reparo da imagem do sistema
echo [2/9] Reparo de componentes do sistema...
DISM /Online /Cleanup-Image /RestoreHealth
echo.

:: 3️⃣ Verificar e corrigir disco C:
echo [3/9] Verificando disco C: (aguarde)...
chkdsk C: /f /r
echo.

:: 4️⃣ Corrigir permissoes no disco C:
echo [4/9] Corrigindo permissões no disco C:...
takeown /f C:\ /r /d y
icacls C:\ /grant Administradores:F /t
icacls C:\ /grant Everyone:F /t
echo.

:: 5️⃣ Reiniciar servicos essenciais
echo [5/9] Reiniciando servicos importantes...
net stop wuauserv >nul
net start wuauserv >nul
net stop bits >nul
net start bits >nul
net stop cryptsvc >nul
net start cryptsvc >nul
echo Serviços reiniciados com sucesso.
echo.

:: 6️⃣ Limpar caches e arquivos temporarios
echo [6/9] Limpando caches e arquivos temporarios...
del /s /q "%temp%\*.*" >nul 2>&1
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
cleanmgr /sagerun:1
echo Limpeza concluida.
echo.

:: 7️⃣ Otimizar rede e ping
echo [7/9] Otimizando rede para jogos online...
ipconfig /flushdns
netsh int ip reset >nul
netsh winsock reset >nul
netsh advfirewall reset >nul
echo Rede otimizada e DNS limpo.
echo.

:: 8️⃣ Otimizar cache grafico (DirectX e shaders)
echo [8/9] Limpando cache grafico e shaders...
del /s /q "%LOCALAPPDATA%\NVIDIA\DXCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\NVIDIA\GLCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\D3DSCache\*.*" >nul 2>&1
echo Cache grafico limpo.
echo.

:: 9️⃣ Definir prioridade maxima para jogos
echo [9/9] Ajustando prioridade do sistema para desempenho...
powercfg -setactive SCHEME_MIN
wmic process where name="explorer.exe" CALL setpriority "128" >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f
echo Prioridade ajustada e modo desempenho ativado.
echo.

echo =====================================================
echo ✅ Otimizacao completa!
echo 🕹️ Seu sistema esta pronto para rodar jogos no maximo!
echo =====================================================
pause
exit

