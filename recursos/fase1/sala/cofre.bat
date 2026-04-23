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

echo =========================================================
echo                    COFRE DE SEGURANCA
echo =========================================================
echo.
timeout /t 1 >nul
echo O cofre possui um teclado numerico.
echo.
timeout /t 1 >nul
echo Digite a senha para abrir:
echo.

set /p senha="SENHA > "

if "%senha%"=="84" (
    echo.
    echo [CLIQUE]... O cofre destrancou!
    echo.
    timeout /t 1 >nul
    
    :: Revela a pasta que ja esta na sala
    attrib -h "cofre" /s /d >nul 2>&1
    echo A pasta 'cofre' agora esta visivel.
    echo Explore o conteudo da pasta para prosseguir.
    echo.
    timeout /t 1 >nul
    pause
    del "%~f0"
) else (
    echo.
    echo [ERRO] Senha incorreta!
    echo.
    timeout /t 1 >nul
    echo DICA: Talvez voce precise contar algo... ja olhou no armario?
    echo.
    pause
)
