@echo off
title 🚀 Otimizador de Jogos - V6 TURBO Por Claudio Almeida
color 0A
setlocal enabledelayedexpansion

:: =====================================================
:: CONFIGURAÇÕES INICIAIS
:: =====================================================
set "LOGFILE=%~dp0Relatorio_Otimizacao.txt"
echo ===================================================== > "%LOGFILE%"
echo 🚀 Otimizador de Jogos - V6 TURBO >> "%LOGFILE%"
echo Data de execução: %date% - %time% >> "%LOGFILE%"
echo ===================================================== >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:MENU
cls
echo =====================================================
echo 🚀 OTIMIZADOR DE JOGOS - V6 TURBO
echo =====================================================
echo [1] 🧹 Limpeza de arquivos temporarios e cache
echo [2] 🔧 Reparo do sistema (SFC / DISM)
echo [3] 🌐 Otimizar rede e firewall
echo [4] ⚙️ Reiniciar servicos essenciais
echo [5] 🔋 Ativar plano de alto desempenho
echo [6] 🧩 Verificar discos (CHKDSK)
echo [7] 💥 Executar todas as otimizacoes
echo [0] ❌ Sair
echo =====================================================
set /p opcao="Escolha uma opção: "

if "%opcao%"=="1" goto LIMPEZA
if "%opcao%"=="2" goto REPARO
if "%opcao%"=="3" goto REDE
if "%opcao%"=="4" goto SERVICOS
if "%opcao%"=="5" goto DESEMPENHO
if "%opcao%"=="6" goto CHKDSK
if "%opcao%"=="7" goto COMPLETO
if "%opcao%"=="0" goto SAIR
goto MENU

:: =====================================================
:: OPÇÃO 1 - LIMPEZA
:: =====================================================
:LIMPEZA
cls
echo =====================================================
echo 🧹 LIMPEZA DE ARQUIVOS TEMPORARIOS E CACHE
echo =====================================================
echo Iniciando limpeza... >> "%LOGFILE%"
echo [%time%] Limpando pastas temporárias... >> "%LOGFILE%"

del /s /q "%temp%\*.*" >nul 2>&1
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\NVIDIA\DXCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\NVIDIA\GLCache\*.*" >nul 2>&1
del /s /q "%LOCALAPPDATA%\D3DSCache\*.*" >nul 2>&1

cleanmgr /sagerun:1
echo [%time%] Limpeza concluida. >> "%LOGFILE%"
echo ✅ Limpeza concluida!
pause
goto MENU

:: =====================================================
:: OPÇÃO 2 - REPARO DO SISTEMA
:: =====================================================
:REPARO
cls
echo =====================================================
echo 🔧 REPARO DO SISTEMA (SFC / DISM)
echo =====================================================
echo [%time%] Iniciando SFC e DISM... >> "%LOGFILE%"
echo Executando SFC /scannow...
sfc /scannow >> "%LOGFILE%"
echo Executando DISM /Online /Cleanup-Image /RestoreHealth...
DISM /Online /Cleanup-Image /RestoreHealth >> "%LOGFILE%"
echo [%time%] Reparo concluído. >> "%LOGFILE%"
echo ✅ Reparo concluído!
pause
goto MENU

:: =====================================================
:: OPÇÃO 3 - OTIMIZAR REDE
:: =====================================================
:REDE
cls
echo =====================================================
echo 🌐 OTIMIZAÇÃO DE REDE E FIREWALL
echo =====================================================
echo [%time%] Otimizando rede... >> "%LOGFILE%"
ipconfig /flushdns >> "%LOGFILE%"
netsh int ip reset >> "%LOGFILE%"
netsh winsock reset >> "%LOGFILE%"
netsh advfirewall reset >> "%LOGFILE%"
echo [%time%] Rede otimizada com sucesso. >> "%LOGFILE%"
echo ✅ Rede otimizada!
pause
goto MENU

:: =====================================================
:: OPÇÃO 4 - SERVIÇOS
:: =====================================================
:SERVICOS
cls
echo =====================================================
echo ⚙️ REINICIANDO SERVICOS ESSENCIAIS
echo =====================================================
echo [%time%] Reiniciando serviços... >> "%LOGFILE%"
for %%S in (wuauserv bits cryptsvc) do (
    net stop %%S >> "%LOGFILE%" 2>&1
    net start %%S >> "%LOGFILE%" 2>&1
)
echo [%time%] Servicos reiniciados. >> "%LOGFILE%"
echo ✅ Servicos reiniciados!
pause
goto MENU

:: =====================================================
:: OPÇÃO 5 - DESEMPENHO
:: =====================================================
:DESEMPENHO
cls
echo =====================================================
echo 🔋 ATIVANDO PLANO DE ALTO DESEMPENHO
echo =====================================================
echo [%time%] Alterando plano de energia... >> "%LOGFILE%"
powercfg -setactive SCHEME_MIN
wmic process where name="explorer.exe" CALL setpriority "128" >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f >nul
echo [%time%] Plano de energia otimizado. >> "%LOGFILE%"
echo ✅ Alto desempenho ativado!
pause
goto MENU

:: =====================================================
:: OPÇÃO 6 - CHKDSK
:: =====================================================
:CHKDSK
cls
echo =====================================================
echo 💽 VERIFICAÇÃO DE DISCOS (CHKDSK)
echo =====================================================
for /f "tokens=1" %%i in ('wmic logicaldisk where "drivetype=3" get deviceid ^| find ":"') do (
    echo [%time%] Verificando %%i... >> "%LOGFILE%"
    chkdsk %%i >> "%LOGFILE%"
)
echo [%time%] Verificacao de disco concluida. >> "%LOGFILE%"
echo ✅ Verificacao concluida!
pause
goto MENU

:: =====================================================
:: OPÇÃO 7 - COMPLETO
:: =====================================================
:COMPLETO
cls
echo =====================================================
echo 💥 EXECUTANDO TODAS AS OTIMIZAÇÕES
echo =====================================================
call :LIMPEZA
call :REPARO
call :REDE
call :SERVICOS
call :DESEMPENHO
call :CHKDSK
goto MENU

:: =====================================================
:: SAIR
:: =====================================================
:SAIR
echo =====================================================
echo 📝 Relatorio salvo em:
echo "%LOGFILE%"
echo =====================================================
echo ✅ Todas as ações foram registradas.
echo Obrigado por usar o Otimizador de Jogos - V6 TURBO!
echo =====================================================
pause
exit
