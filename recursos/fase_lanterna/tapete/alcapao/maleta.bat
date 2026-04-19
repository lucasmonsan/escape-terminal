@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
cls
echo ======================================================
echo                  MALETA DE SEGURANÇA
echo ======================================================
echo.

set SENHA_REAL=%USERNAME%

echo A maleta exige uma senha biométrica e temporal.
set /p SENHA_USER="DIGITE A SENHA: "

if "%SENHA_USER%"=="%SENHA_REAL%" (
    echo.
    echo [ACESSO CONCEDIDO]
    echo Gerando chave de segurança...
    
    :: O %~dp0 aponta para 'alcapao\'. Subimos para 'tapete' e depois 'sala'.
    echo LIBERDADE_TOTAL_2026 > "%~dp0..\..\mochila\chave.key"
    
    echo.
    echo A 'chave.key' foi enviada para sua mochila.
    pause
) else (
    echo.
    echo [ACESSO NEGADO]
    pause
)
