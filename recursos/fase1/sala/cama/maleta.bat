@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo.
echo ======================================================
echo                   MALETA DE SEGURANÇA
echo ======================================================
echo.
timeout /t 1 >nul

set "SENHA_REAL=%USERNAME%"

echo A maleta exige uma senha biométrica e temporal.
echo.
timeout /t 1 >nul
set /p SENHA_USER="DIGITE A SENHA: "

if "%SENHA_USER%"=="%SENHA_REAL%" (
    echo.
    echo [ACESSO CONCEDIDO]
    echo Gerando chave de segurança. Aguarde...
    echo.
    timeout /t 3 >nul
    
    :: O %~dp0 aponta para 'cama\'. Subimos um nível para 'sala' e entramos em 'mochila'.
    echo LIBERDADE_TOTAL_2026 > "%~dp0..\mochila\chave.key"
    
    echo.
    echo A 'chave.key' foi enviada para sua mochila.
    pause
    :: Opcional: deletar a maleta após o uso para "limpar" o cenário
    del "%~f0"
) else (
    echo.
    echo [ACESSO NEGADO]
    timeout /t 1 >nul
    echo DICA: Senha incorreta.
    pause
)