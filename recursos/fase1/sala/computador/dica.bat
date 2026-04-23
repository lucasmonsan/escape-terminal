@echo off
chcp 850 >nul

:: --- VERIFICACAO ANTI-CHEAT ---
tasklist /fi "imagename eq explorer.exe" | find /i "explorer.exe" >nul
if %errorlevel% equ 0 (
    cls
    echo #########################################################
    echo #           GAME OVER: INTERFACE DETECTADA              #
    echo #########################################################
    echo.
    echo O jogo foi feito para usar o CMD
    echo e voce esta usando a pasta visual.
    echo.
    echo Seu acesso foi negado.
    echo.
    echo Reinicie o jogo.
    echo #########################################################
    timeout /t 5 >nul
    exit
)

if exist "diario.txt" (
    echo [SISTEMA]: Diario detectado e legivel. 
    echo.
    timeout /t 1 >nul
    echo O diario e muito grande, e esta cheio de coisas desnecessarias.
    echo.
    timeout /t 1 >nul
    echo Para ajudar, as coisas importantes estao marcadas com a 
    echo palavra IMPORTANTE maiuscula.
    echo.
    timeout /t 1 >nul
    echo Voce pode procurar por uma palavra dentro de um arquivo, 
    echo e so usar o comando: FIND "PALAVRA" NOMEAQUIVO
) else (
    echo [SISTEMA]: Erro. O diario esta corrompido.
    echo.
    timeout /t 1 >nul
    echo Para desbloquear a dica, recupere o diario.
    echo.
    timeout /t 1 >nul
    echo Para recupera-lo, renomeie para diario.txt.
)
echo.
pause
