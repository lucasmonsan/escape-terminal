@echo off
chcp 65001 >nul
echo ======================================================
echo                    PORTA DE SAÍDA
echo ======================================================
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
        
        :: 1. Entrega o Nível 2 (pegando da nova estrutura de recursos)
        :: copy "..\recursos\fase2\nivel2.bat" ".." >nul
        
        :: 2. Restaura o Windows e limpa o ambiente
        start explorer.exe "%cd%\.." 
        echo.
        echo ==================================================
        echo   PARABÉNS! Você conseguiu escapar da sala!
        echo ==================================================
        
        :: 3. Pausa e Limpeza
        timeout /t 2 >nul 
        cd ..
        rd /s /q "sala" 
        
        echo.
        pause 
        exit
    )
) else (
    echo A porta está trancada com um cadeado eletrônico. 
    echo.
    timeout /t 1 >nul
    echo Você precisa da 'chave.key' dentro da mochila para sair. 
    pause 
)