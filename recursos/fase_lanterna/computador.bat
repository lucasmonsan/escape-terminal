@echo off
chcp 65001 >nul
cls
echo ======================================================
echo                  TERMINAL DE ACESSO
echo ======================================================
echo.

:: Verifica se o pendrive está na mochila dentro da sala
if exist "mochila\pendrive.sys" (
    
    echo Verificando unidade externa...
    :: Valida a assinatura do pendrive
    findstr /c:"SISTEMA_OPERACIONAL_V1" "mochila\pendrive.sys" >nul || goto :FALHA
    
    echo Carregando Kernel... [100%%]
    timeout /t 2 >nul
    
    :: Copia a pasta do computador de recursos para sala
    if exist "..\recursos\fase_computador\computador" (
        xcopy "..\recursos\fase_computador\computador" ".\computador\" /e /i /y /h >nul
        echo Sistema carregado com sucesso! Explore a pasta 'computador'.
    )
    
    echo.
    echo Este terminal de instalação será removido.
    pause
    del "%~f0"
) else (
    echo [ERRO]: Disco de boot não encontrado.
    echo Insira o pendrive do sistema na mochila e tente novamente.
    pause
)
exit /b

:FALHA
echo [ERRO]: Dados do pendrive corrompidos ou ilegíveis.
pause
