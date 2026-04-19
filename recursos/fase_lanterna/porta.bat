@echo off
cls
echo ======================================================
echo                   PORTA DE SAIDA
echo ======================================================
echo.

if exist "mochila\chave.key" (
    findstr /c:"LIBERDADE_TOTAL_2026" "mochila\chave.key" >nul
    if %errorlevel% equ 0 (
        echo Verificando assinatura digital da chave...
        timeout /t 3 >nul
        echo.
        echo [OK] Chave autenticada.
        echo Abrindo portas... 
        echo Restaurando interface do Windows...
        
        :: Comando para trazer o Windows de volta
        start explorer.exe
        
        echo.
        echo ==================================================
        echo   PARABENS! Voce dominou o terminal e escapou!
        echo ==================================================
        pause
        exit
    )
) else (
    echo A porta esta trancada com um cadeado eletronico.
    echo Voce precisa da 'chave.key' dentro da mochila para sair.
    pause
)