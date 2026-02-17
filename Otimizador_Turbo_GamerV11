@echo off
setlocal EnableDelayedExpansion
title OTIMIZADOR TURBO GAMER v11 - Criado por Claudio Almeida
color 0B
mode con: cols=95 lines=42

:: ================= ADMIN CHECK =================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo  [!] ERRO: EXECUTE COMO ADMINISTRADOR!
    echo  Clique com o botao direito no arquivo e escolha 'Executar como administrador'.
    pause
    exit
)

:: ================= DIAGNOSTICO INICIAL =================
set "OS=Detectando..."
set "RAMGB=0"
for /f "tokens=2 delims==" %%a in ('wmic os get Caption /value 2^>nul') do if not "%%a"=="" set "OS=%%a"
for /f "tokens=2 delims==" %%a in ('wmic computersystem get TotalPhysicalMemory /value 2^>nul') do (
    set "memBytes=%%a"
    set "memBytes=!memBytes:~0,-6!"
    set /a RAMGB=!memBytes! / 1024
)

:MENU
cls
echo. 
echo  ==================================================================
echo                 OTIMIZADOR TURBO GAMER - VERSAO 11
echo                    Criador: Claudio Almeida
echo  ==================================================================
echo   Usuario  : %username%    ^|   Sistema: %OS%
echo   Maquina  : %computername% ^|   RAM    : ~%RAMGB% GB
echo  ==================================================================
echo.
echo   [1] Diagnostico Detalhado do Sistema
echo   [2] Aplicar Otimizacao Gamer (Performance e CPU)
echo   [3] Limpeza Deep Clean (Temporarios, Shaders e Lixeira)
echo   [4] Ajustar Visual para Desempenho (Interface)
echo   [5] Reiniciar Windows Explorer (Corrigir bugs visuais)
echo   [6] Ativar Modo Equilibrado (Reverter Alteracoes)
echo   [7] Manutencao, Seguranca e MSRT (Antivirus)
echo   [8] Reduzir Latencia e Telemetria (Ping e Privacidade)
echo   [9] Limpeza de Cache Windows Update (Libera Espaco)
echo   [0] Sair
echo.
echo  ==================================================================
echo.
set /p opcao="Escolha uma opcao: "

if "%opcao%"=="1" goto DIAGNOSTICO
if "%opcao%"=="2" goto OTIMIZAR
if "%opcao%"=="3" goto LIMPEZA
if "%opcao%"=="4" goto VISUAL
if "%opcao%"=="5" goto EXPLORER
if "%opcao%"=="6" goto REVERTER
if "%opcao%"=="7" goto MANUTENCAO
if "%opcao%"=="8" goto REDE_TWEAKS
if "%opcao%"=="9" goto WINUPDATE
if "%opcao%"=="0" exit
goto MENU

:OTIMIZAR
cls
echo =============================================================
echo                INFORMACOES: OTIMIZACAO GAMER
echo =============================================================
echo O QUE SERA FEITO:
echo 1. ENERGIA: Ativa o plano de Desempenho Maximo do Windows.
echo 2. GAME MODE: Ativa o modo nativo que prioriza jogos.
echo 3. PRIORIDADE: Ajusta a CPU para focar no jogo em execucao.
echo 4. CACHE DNS: Limpa a rede para evitar falhas de conexao.
echo =============================================================
set /p confirmar="Deseja aplicar estas otimizacoes? (S/N): "
if /i "%confirmar%" neq "S" goto MENU

set /p criarPonto="Criar Ponto de Restauracao antes? (Recomendado) (S/N): "
if /i "%criarPonto%"=="S" (
    echo.
    echo [!] Criando ponto de restauracao... Aguarde.
    powershell -Command "Checkpoint-Computer -Description 'Turbo_v11' -RestorePointType MODIFY_SETTINGS" >nul 2>&1
)

echo [!] Aplicando ajustes de performance...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 38 /f >nul 2>&1
ipconfig /flushdns >nul
echo [+] Otimizacao concluida com sucesso!
pause
goto MENU

:LIMPEZA
cls
echo =============================================================
echo                INFORMACOES: LIMPEZA PROFUNDA
echo =============================================================
echo O QUE SERA FEITO:
echo 1. TEMP: Apaga arquivos inuteis que acumulam no dia a dia.
echo 2. SHADERS: Limpa cache de video (ajuda com travadas em jogos).
echo 3. LOGS: Remove registros antigos que ocupam espaco.
echo 4. LIXEIRA: Esvazia todos os itens descartados.
echo =============================================================
set /p confirmar="Deseja iniciar a limpeza? (S/N): "
if /i "%confirmar%" neq "S" goto MENU

echo [!] Iniciando limpeza de arquivos...
del /f /s /q "%temp%\*.*" >nul 2>&1
del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\DirectX Shader Cache\*.*" >nul 2>&1
wevtutil cl Setup >nul 2>&1
wevtutil cl System >nul 2>&1
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1
echo [+] Limpeza concluida!
pause
goto MENU

:REDE_TWEAKS
cls
echo =============================================================
echo             INFORMACOES: REDE E PRIVACIDADE
echo =============================================================
echo O QUE SERA FEITO:
echo 1. REDE: Otimiza pacotes TCP para reduzir o PING em jogos.
echo 2. TELEMETRIA: Desativa o envio de dados para a Microsoft.
echo 3. DESEMPENHO: Libera memoria usada por rastreadores de fundo.
echo =============================================================
set /p confirmar="Deseja aplicar? (S/N): "
if /i "%confirmar%" neq "S" goto MENU

echo [!] Otimizando rede e telemetria...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
echo [+] Sucesso! Latencia e Privacidade ajustadas.
pause
goto MENU

:WINUPDATE
cls
echo =============================================================
echo            INFORMACOES: CACHE DE ATUALIZACAO
echo =============================================================
echo O QUE SERA FEITO:
echo 1. DOWNLOADS: Apaga arquivos de atualizacoes ja instaladas.
echo 2. CACHE STORE: Reseta a loja para corrigir erros de download.
echo 3. ESPACO: Libera espaco consideravel no disco C:
echo =============================================================
set /p confirmar="Deseja executar esta limpeza? (S/N): "
if /i "%confirmar%" neq "S" goto MENU

echo [!] Parando servicos e limpando arquivos...
net stop wuauserv >nul 2>&1
rd /s /q C:\Windows\SoftwareDistribution\Download >nul 2>&1
md C:\Windows\SoftwareDistribution\Download >nul 2>&1
wsreset.exe
net start wuauserv >nul 2>&1
echo [+] Cache de atualizacoes limpo!
pause
goto MENU

:MANUTENCAO
cls
echo =============================================================
echo                MANUTENCAO E SEGURANCA
echo =============================================================
echo [1] SFC Scannow (Repara arquivos do sistema)
echo [2] CHKDSK (Corrige erros no HD ou SSD)
echo [3] MSRT Microsoft (Scanner de virus oficial)
echo [0] Voltar
echo =============================================================
set /p manut="Escolha uma opcao: "
if "%manut%"=="1" (sfc /scannow & pause)
if "%manut%"=="2" (echo S ^| chkdsk C: /f & echo [+] Agendado para o proximo reinicio. & pause)
if "%manut%"=="3" (start mrt.exe)
goto MENU

:DIAGNOSTICO
cls
echo [!] Obtendo informacoes do sistema...
systeminfo | findstr /B /C:"Versao do SO" /C:"Modelo do sistema" /C:"Fabricante do sistema"
echo Processador: %PROCESSOR_IDENTIFIER%
echo Memoria RAM: %RAMGB% GB
echo.
pause
goto MENU

:VISUAL
cls
echo [!] O painel sera aberto. Marque "Ajustar para melhor desempenho".
pause
start SystemPropertiesPerformance.exe
goto MENU

:EXPLORER
echo [!] Reiniciando Windows Explorer...
taskkill /f /im explorer.exe >nul
start explorer.exe
echo [+] Explorer reiniciado com sucesso.
pause
goto MENU

:REVERTER
cls
echo [!] Restaurando configuracoes padrao do Windows...
powercfg /setactive SCHEME_BALANCED >nul
reg add "HKLM\System\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 2 /f >nul 2>&1
echo [+] O Windows voltou ao Modo Equilibrado e prioridade padrao.
pause
goto MENU
