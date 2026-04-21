@echo off
chcp 65001 >nul
echo ======================================================
echo                   COFRE DE SEGURANÇA
echo ======================================================
echo.
timeout /t 1 >nul
echo O cofre possui um teclado numérico.
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
    
    :: Revela a pasta que já está na sala
    attrib -h "cofre" /s /d >nul 2>&1
    echo A pasta 'cofre' agora está visível.
    echo.
    timeout /t 1 >nul
    pause
    del "%~f0"
) else (
    echo.
    echo [ERRO] Senha incorreta!
    echo.
    timeout /t 1 >nul
    echo DICA: Talvez você precise contar algo... já olhou no armário?
    echo.
    pause
)