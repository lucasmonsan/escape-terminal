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
echo                     PORTA DE SAIDA
echo =========================================================
echo.
timeout /t 1 >nul

if exist "mochila\chave.key" (
    findstr /c:"LIBERDADE_TOTAL_2026" "mochila\chave.key" >nul
    if %errorlevel% equ 0 (
        echo Verificando assinatura digital da chave.
        echo Aguarde...
        timeout /t 3 >nul 
        echo.
        echo [OK] Chave autenticada.
        timeout /t 1 >nul 
        echo Abrindo porta...
        timeout /t 1 >nul 
        
        :: 1. Restaura o Windows Explorer
        start explorer.exe "%cd%\.." 
        
        echo.
        echo =========================================================
        echo    PARABENS! Voce conseguiu escapar da sala!
        echo =========================================================
        
        :: 2. Limpeza do ambiente
        timeout /t 2 >nul 
        cd ..
        rd /s /q "sala" 
        
        echo.
        echo Pressione qualquer tecla para finalizar.
        pause >nul
        exit
    )
) else (
    echo A porta esta trancada com um cadeado eletronico. 
    echo.
    timeout /t 1 >nul
    echo Voce precisa da 'chave.key' dentro da mochila para sair. 
    pause 
)
