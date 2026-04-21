@echo off
chcp 65001 >nul
if exist "pilha.lib" (
    echo Verificando pilhas...
    
    :: Verifica se a lanterna já está ligada (Carga 100)
    findstr /c:"ENERGIA_QUIMICA_100" "pilha.lib" >nul
    if not errorlevel 1 (
        echo.
        echo ===========================================
        echo A lanterna já está ligada e iluminando o quarto.
        echo ===========================================
        pause
        exit /b
    )
    
    :: Verifica se é a pilha correta para ligar (Carga 99)
    findstr /c:"ENERGIA_QUIMICA_99" "pilha.lib" >nul || goto :FALSA
    
    echo Carregando lanterna...
    timeout /t 2 >nul
    
    :: REVELAÇÃO DA LANTERNA: Revela o armário e os arquivos de puzzle (.bat)
    attrib -h "..\armario" /s /d >nul 2>&1
    attrib -h "..\cofre.bat" >nul 2>&1
    attrib -h "..\computador.bat" >nul 2>&1
    attrib -h "..\porta.bat" >nul 2>&1
    
    :: MANTÉM AS PASTAS DE PUZZLE E A MALETA OCULTAS
    attrib +h "..\cofre" /s /d >nul 2>&1
    attrib +h "..\computador" /s /d >nul 2>&1
    
    :: Atualiza a pilha para 100 (lanterna ligada)
    echo ENERGIA_QUIMICA_100 > "pilha.lib"
    
    echo.
    echo ===========================================
    echo LANTERNA LIGADA! Agora você pode ver o quarto.
    echo ===========================================
    echo.
    timeout /t 1 >nul
    echo Você avistou um ARMARIO, um COFRE e um COMPUTADOR.
    echo.
    pause
    exit /b

    :FALSA
    echo ERRO: Esta pilha não tem carga ou é falsificada!
    echo.
    timeout /t 1 >nul
    echo Procure a pilha original e mova para dentro da mochila.
    pause
    exit /b
) else (
    echo A lanterna está sem pilhas.
    echo.
    timeout /t 1 >nul
    echo Encontre as pilhas e coloque-as dentro da pasta mochila.
    pause
)