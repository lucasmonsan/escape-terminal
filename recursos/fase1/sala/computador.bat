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
echo                    TERMINAL DE ACESSO
echo =========================================================
echo.
timeout /t 1 >nul

:: Verifica se o pendrive esta na mochila dentro da sala
if exist "mochila\pendrive.sys" (
    
    echo Verificando unidade externa...
    :: Valida a assinatura do pendrive
    findstr /c:"SISTEMA_OPERACIONAL_V1" "mochila\pendrive.sys" >nul || goto :FALHA
    
    echo Carregando Kernel... [100%%]
    timeout /t 2 >nul
    
    :: Revela a pasta computador
    attrib -h "computador" /s /d >nul 2>&1
    echo Sistema carregado com sucesso! Explore a pasta 'computador'.
    
    echo.
    timeout /t 1 >nul
    echo Este terminal de instalacao sera removido.
    pause
    del "%~f0"
) else (
    echo [ERRO]: Disco de boot nao encontrado.
    timeout /t 1 >nul
    echo Insira o pendrive na mochila e tente novamente.
    pause
)
exit /b

:FALHA
echo [ERRO]: Dados do pendrive corrompidos ou ilegiveis.
pause
