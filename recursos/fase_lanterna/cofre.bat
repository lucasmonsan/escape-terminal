@echo off
chcp 65001 >nul
cls
echo ======================================================
echo                  COFRE DE SEGURANÇA
echo ======================================================
echo.
echo O cofre possui um teclado numérico. 
echo Digite a senha para abrir:
echo.

set /p senha="SENHA > "

if "%senha%"=="84" (
    echo.
    echo [CLIQUE]... O cofre destrancou!
    timeout /t 2 >nul
    
    if exist "..\recursos\fase_cofre\cofre" (
        xcopy "..\recursos\fase_cofre\cofre" ".\cofre\" /e /i /y /h >nul
        echo A pasta 'cofre' agora está visível.
    ) else (
        echo [ERRO DE SISTEMA]: Recursos do cofre não encontrados.
    )

    echo.
    echo Este terminal de acesso ao cofre será desativado.
    pause
    del "%~f0"
) else (
    echo.
    echo [BIP-BIP-BIP] Senha incorreta!
    echo DICA: Talvez você precise contar algo... já olhou no armário?
    echo Use o comando HELP para ver o que o sistema conhece.
    pause
    cls
)
