@echo off
chcp 65001 >nul
echo ======================================================
echo                   TERMINAL DE ACESSO
echo ======================================================
echo.
timeout /t 1 >nul

:: Verifica se o pendrive está na mochila dentro da sala
if exist "mochila\pendrive.sys" (
    
    echo Verificando unidade externa...
    :: Valida a assinatura do pendrive
    findstr /c:"SISTEMA_OPERACIONAL_V1" "mochila\pendrive.sys" >nul || goto :FALHA
    
    echo Carregando Kernel... [100%%]
    timeout /t 2 >nul
    
    :: Revela a pasta computador
    attrib -h "computador" /s /d >nul 2>&1
    echo Sistema carregado com sucesso! Explore a pasta 'computador'.
    
    timeout /t 1 >nul
    echo Este terminal de instalação será removido.
    pause
    del "%~f0"
) else (
    echo [ERRO]: Disco de boot não encontrado.
    timeout /t 1 >nul
    echo Insira o pendrive na mochila e tente novamente.
    pause
)
exit /b

:FALHA
echo [ERRO]: Dados do pendrive corrompidos ou ilegíveis.
pause