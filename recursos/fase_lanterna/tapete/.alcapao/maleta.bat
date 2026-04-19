@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cls
echo ======================================================
echo                  MALETA DE SEGURANÇA
echo ======================================================
echo.

:: Pega os dígitos da hora e minuto
set HORA=%TIME:~0,1%
set MINUTO=%TIME:~3,1%
set SENHA_REAL=%HORA%%MINUTO%%USERNAME%

echo A maleta exige uma senha biométrica e temporal.
set /p SENHA_USER="DIGITE A SENHA: "

if "%SENHA_USER%"=="%SENHA_REAL%" (
    echo.
    echo [ACESSO CONCEDIDO]
    echo Gerando chave de segurança...
    
    :: Criamos o arquivo DIRETAMENTE na mochila a partir da pasta sala
    :: Como o aluno rodou o script de dentro da sala, o caminho é simples:
    echo LIBERDADE_TOTAL_2026 > "../../mochila/chave.key"
    
    echo.
    echo A 'chave.key' foi enviada para sua mochila.
    pause
) else (
    echo.
    echo [ACESSO NEGADO]
    echo Senha incorreta. Verifique os dados do sistema.
    pause
)
