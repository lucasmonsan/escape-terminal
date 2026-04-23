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
    echo e você está usando a pasta visual.
    echo.
    echo Seu acesso foi negado.
    echo.
    echo Reinicie o jogo.
    echo #########################################################
    timeout /t 5 >nul
    exit
)

:: --- DETECCAO DE ERRO PEDAGOGICO ---
:: Verifica se o aluno renomeou o arquivo por erro de comando MOVE
if exist "cama\mochila" (
    echo [AVISO]: A lanterna continua sem pilhas.
    echo.
    echo Parece que voce tentou mover a pilha, mas ela acabou se tornando
    echo um arquivo chamado 'mochila' dentro da pasta 'cama'.
    echo Voce precisa renomear esse arquivo de volta para 'pilha.lib' 
    echo dentro da pasta cama antes de tentar move-lo corretamente.
    echo.
    pause
    exit /b
)

:: --- LOGICA DA LANTERNA ---
if exist "mochila\pilha.lib" (
    echo Verificando pilhas...
    
    :: Verifica se e a pilha correta (Carga 99)
    findstr /c:"ENERGIA_QUIMICA_99" "mochila\pilha.lib" >nul || goto :FALSA
    
    echo Carregando lanterna...
    timeout /t 2 >nul
    
    :: REVELACAO: Itens da sala agora visiveis (removido ..\ pois o script esta na raiz)
    attrib -h "armario" /s /d >nul 2>&1
    attrib -h "cofre.bat" >nul 2>&1
    attrib -h "computador.bat" >nul 2>&1
    attrib -h "porta.bat" >nul 2>&1
    
    :: Pastas de puzzle continuam ocultas
    attrib +h "cofre" /s /d >nul 2>&1
    attrib +h "computador" /s /d >nul 2>&1
    
    echo.
    echo ===========================================
    echo LANTERNA LIGADA! Agora voce pode ver o quarto.
    echo ===========================================
    echo.
    timeout /t 1 >nul
    echo Voce avistou um ARMARIO, um COFRE e um COMPUTADOR.
    echo.
    
    :: Limpeza: Remove a pilha e o proprio script da lanterna
    del "mochila\pilha.lib" /f /q >nul 2>&1
    pause
    del "%~f0"
    exit /b

    :FALSA
    echo ERRO: Esta pilha nao tem carga ou e falsificada!
    echo.
    timeout /t 1 >nul
    echo Procure a pilha original e mova para dentro da mochila.
    pause
    exit /b
) else (
    echo A lanterna esta sem pilhas.
    echo.
    timeout /t 1 >nul
    echo Encontre as pilhas e coloque-as dentro da pasta mochila.
    pause
)
