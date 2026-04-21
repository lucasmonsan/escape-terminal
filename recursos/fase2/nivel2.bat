@echo off
chcp 65001 >nul
title ESCAPE TERMINAL - NIVEL 2

:: 1. Imersao
taskkill /f /im explorer.exe >nul 2>&1
attrib +h +s "recursos" /s /d >nul 2>&1

:: 2. Reset da Sala
if exist "sala" rd /s /q "sala"
mkdir "sala"

:: 3. Preparacao: Copia arquivos visiveis
xcopy "recursos\fase2\sala\*" "sala\" /e /i /y /h >nul

:: CRIA O ARQUIVO SECRETO COM EXTENSAO BLOQUEADA (.tmp)
set "SENHA_DINAMICA=%COMPUTERNAME%_2026_SAIDA"
echo %SENHA_DINAMICA% > "sala\segredo.tmp"
attrib +h "sala\segredo.tmp"

:: TRAVA AS INSTRUCOES (Somente Leitura)
attrib +r "sala\instrucoes.txt"

:: 4. Inicio
cd sala
echo ==============================================================
echo        ESCAPE TERMINAL - NIVEL 2: O ORGANIZADOR
echo ==============================================================
echo.
timeout /t 1 >nul
echo A sala esta um caos. Organize tudo para sair.
timeout /t 1 >nul
echo Leia o arquivo instrucoes.txt para saber o que fazer.
echo.
echo ==============================================================
timeout /t 1 >nul
cmd /k