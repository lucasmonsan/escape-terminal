@echo off
chcp 65001 >nul
title ESCAPE TERMINAL
cls

taskkill /f /im explorer.exe >nul 2>&1

if exist "sala" rd /s /q "sala"
mkdir "sala"

xcopy "recursos\inicio\*" "sala\" /e /i /y /h >nul

cd sala
cls
echo ======================================================
echo           BEM-VINDO AO ESCAPE TERMINAL
echo ======================================================
echo.
echo Você acordou em um quarto escuro e a porta está trancada.
echo.
echo Use DIR para olhar ao redor e CD para se mover.
echo.
echo ======================================================
echo   O JOGO COMEÇOU!
echo   O TERMINAL É SEU ÚNICO ALIADO.
echo ======================================================
echo.

cmd /k
