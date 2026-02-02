@echo off
title Otimizador de Jogos Turbo-V10.1
color 0A
setlocal EnableDelayedExpansion

:: ==================================================
:: Otimizador de Jogos Turbo-V10.1
:: Criador: Claudio Almeida
:: Projeto: Turbo Performance Tools
:: Foco: PC Fraco | Gamer Casual
:: Windows 10 e 11
:: ==================================================

:: LOG
set LOG=%~dp0otimizador_log.txt
echo ==== INICIO %date% %time% ==== >> "%LOG%"

:: ADMIN
net session >nul 2>&1 || (
    echo Execute como ADMINISTRADOR.
    pause
    exit
)

:: ================== MENU ==================
:MENU
cls
echo.
echo   /$$$$$$                                          /$$
echo  /$$__  $$                                        ^| $$
echo ^| $$  \ $$ /$$$$$$$   /$$$$$$   /$$$$$$   /$$$$$$ ^| $$   /$$
echo ^| $$$$$$$$^| $$__  $$ ^|____  $$ /$$__  $$ /$$__  $$^| $$  /$$/
echo ^| $$__  $$^| $$  \ $$  /$$$$$$$^| $$  \__/^| $$  \ $$^| $$$$$$/
echo ^| $$  ^| $$^| $$  ^| $$ /$$__  $$^| $$      ^| $$  ^| $$^| $$_  $$
echo ^| $$  ^| $$^| $$  ^| $$^|  $$$$$$$^| $$      ^|  $$$$$$/^| $$ \  $$
echo ^|__/  ^|__/^|__/  ^|__/ \_______/^|__/       \______/ ^|__/  \__/
echo.
echo ===============================================
echo        Otimizador de Jogos Turbo-V10.1
echo ===============================================
echo Usuario: %username% ^| PC: %computername%
echo ===============================================
echo [1] DIAGNOSTICO DO SISTEMA
echo [2] OTIMIZAR PC (Modo Seguro / Bruto)
echo [3] LIMPEZA SEGURA
echo [4] PERFORMANCE VISUAL
echo [5] REINICIAR EXPLORER
echo [6] REVERTER TUDO
echo [7] MANUTENCAO DO SISTEMA
echo [0] SAIR
echo ===============================================
set /p opcao=Escolha: 

if "%opcao%"=="1" goto DIAGNOSTICO
if "%opcao%"=="2" goto ESCOLHER_MODO
if "%opcao%"=="3" goto LIMPEZA
if "%opcao%"=="4" goto VISUAL
if "%opcao%"=="5" goto EXPLORER
if "%opcao%"=="6" goto REVERTER
if "%opcao%"=="7" goto MANUTENCAO
if "%opcao%"=="0" exit
goto MENU

:: ================== DIAGNOSTICO ==================
:DIAGNOSTICO
cls
echo ===============================================
echo           DIAGNOSTICO DO SISTEMA
echo ===============================================

for /f "tokens=2 delims==" %%A in ('wmic os get Caption /value ^| find "="') do set OS=%%A
for /f "tokens=2 delims==" %%A in ('wmic os get OSArchitecture /value ^| find "="') do set ARC=%%A
for /f "tokens=2 delims==" %%A in ('wmic computersystem get TotalPhysicalMemory /value ^| find "="') do set RAM=%%A
set /a RAMGB=%RAM:~0,-9%

echo Sistema: %OS%
echo Arquitetura: %ARC%
echo Memoria RAM: %RAMGB% GB
echo.

if %RAMGB% LSS 8 (
    echo Analise: PC com RAM limitada.
    echo Ganho esperado: leve a moderado.
) else (
    echo Analise: RAM adequada.
    echo Ganho esperado: leve.
)

pause
goto MENU

:: ================== ESCOLHER MODO ==================
:ESCOLHER_MODO
cls
echo ===============================================
echo          ESCOLHA O MODO DE OTIMIZACAO
echo ===============================================
echo [1] MODO SEGURO (Recomendado)
echo [2] MODO BRUTO (Avancado)
echo ===============================================
set /p modo=Escolha: 

if "%modo%"=="1" set PERFIL=SEGURO
if "%modo%"=="2" set PERFIL=BRUTO
if not defined PERFIL goto MENU
goto MODOJOGO

:: ================== OTIMIZACAO ==================
:MODOJOGO
cls
echo Aplicando otimizacao - %PERFIL%

wmic /namespace:\\root\default path SystemRestore call CreateRestorePoint "Otimizador Turbo v9", 100, 7 >nul

powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 0xffffffff /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul

if "%PERFIL%"=="BRUTO" (
    for %%S in (SysMain WSearch DiagTrack dmwappushservice) do (
        sc stop %%S >nul 2>&1
        sc config %%S start= disabled >nul
    )
)

netsh int tcp set global autotuninglevel=normal >nul
echo Otimizacao %PERFIL% aplicada >> "%LOG%"
pause
goto MENU

:: ================== LIMPEZA SEGURA ==================
:LIMPEZA
cls
ipconfig /flushdns >nul
del /f /s /q "%temp%\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo Limpeza segura realizada >> "%LOG%"
pause
goto MENU

:: ================== MANUTENCAO ==================
:MANUTENCAO
cls
echo ===============================================
echo        MANUTENCAO E INTEGRIDADE DO SISTEMA
echo ===============================================
echo [1] Limpeza avancada e cache
echo [2] Reparar sistema (SFC + DISM)
echo [3] Otimizar rede e firewall
echo [4] Verificar disco (CHKDSK)
echo [5] Verificar integridade do Windows
echo [0] Voltar
echo ===============================================
set /p manut=Escolha: 

if "%manut%"=="1" goto LIMPEZA_AVANCADA
if "%manut%"=="2" goto REPARO_SISTEMA
if "%manut%"=="3" goto REDE_FIREWALL
if "%manut%"=="4" goto CHKDSK
if "%manut%"=="5" goto INTEGRIDADE
goto MENU

:LIMPEZA_AVANCADA
cls
ipconfig /flushdns >nul
del /f /s /q "%temp%\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\INetCache\*.*" >nul 2>&1
echo Limpeza avancada realizada >> "%LOG%"
pause
goto MANUTENCAO

:REPARO_SISTEMA
cls
sfc /scannow
DISM /Online /Cleanup-Image /RestoreHealth
echo Reparo do sistema concluido >> "%LOG%"
pause
goto MANUTENCAO

:REDE_FIREWALL
cls
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global ecncapability=disabled >nul
netsh advfirewall reset >nul
echo Rede e firewall otimizados >> "%LOG%"
pause
goto MANUTENCAO

:CHKDSK
cls
chkdsk C: /f /r
echo Verificacao de disco executada >> "%LOG%"
pause
goto MANUTENCAO

:INTEGRIDADE
cls
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
echo Integridade do Windows verificada >> "%LOG%"
pause
goto MANUTENCAO

:: ================== VISUAL ==================
:VISUAL
cls
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
start SystemPropertiesPerformance.exe
echo Visual ajustado >> "%LOG%"
pause
goto MENU

:: ================== EXPLORER ==================
:EXPLORER
taskkill /f /im explorer.exe >nul
start explorer.exe
pause
goto MENU

:: ================== REVERTER ==================
:REVERTER
cls
for %%S in (SysMain WSearch DiagTrack dmwappushservice) do (
    sc config %%S start= auto >nul
    sc start %%S >nul 2>&1
)

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /f >nul 2>&1
powercfg /setactive SCHEME_BALANCED >nul
echo Reversao completa >> "%LOG%"
pause
goto MENU
