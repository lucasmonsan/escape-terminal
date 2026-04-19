@echo off
chcp 65001 >nul
if exist "pilha.lib" (
    echo Verificando pilhas...
    
    findstr /c:"ENERGIA_QUIMICA_99" "pilha.lib" >nul || goto :FALSA
    
    echo Carregando lanterna...
    timeout /t 2 >nul
    
    if not exist "..\..\recursos\fase_lanterna" (
        echo [ERRO DE SISTEMA]: Pasta de recursos não encontrada!
        echo Verifique se C:\escape-terminal\recursos\fase_lanterna existe.
        pause
        exit /b
    )

    xcopy "..\..\recursos\fase_lanterna\*" ".." /e /i /y /h >nul
    
    del "pilha.lib"
    
    echo.
    echo ===========================================
    echo LANTERNA LIGADA! Agora você pode ver o quarto.
    echo ===========================================
    pause
    exit /b

    :FALSA
    echo ERRO: Esta pilha não tem carga ou é falsificada!
    echo APAGUE A PILHA FALSA, procure a pilha original e mova para dentro da mochila.
    pause
    exit /b
) else (
    echo A lanterna está sem pilhas. 
    echo Encontre as pilhas e coloque-as dentro da pasta mochila.
    pause
)
