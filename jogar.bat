@echo off
chcp 65001 >nul

:: Oculta a pasta de recursos para evitar trapaças
attrib +h +s "recursos" /s /d >nul 2>&1

title ESCAPE TERMINAL

:: Encerra o explorer para imersão total
taskkill /f /im explorer.exe >nul 2>&1

:: Reset da sala do Nível 1
if exist "sala" rd /s /q "sala"
mkdir "sala"

:: Copia o conteúdo da nova estrutura fase1\sala
xcopy "recursos\fase1\sala\*" "sala\" /e /i /y /h >nul

:: MECÂNICA DE ESCURIDÃO: Esconde tudo, exceto CAMA e MOCHILA
cd sala
attrib +h "armario" /s /d >nul 2>&1
attrib +h "cofre" /s /d >nul 2>&1
attrib +h "computador" /s /d >nul 2>&1
attrib +h "porta.bat" >nul 2>&1
attrib +h "computador.bat" >nul 2>&1
attrib +h "cofre.bat" >nul 2>&1

:: ESCONDE A MALETA DEBAIXO DA CAMA
attrib +h "cama\maleta.bat" >nul 2>&1

echo ======================================================
echo             BEM-VINDO AO ESCAPE TERMINAL
echo ======================================================
echo.
echo Você acordou em um quarto escuro e a porta está trancada.
echo.
echo Use DIR para olhar ao redor e CD para se mover.
echo.
echo ======================================================
echo    O JOGO COMEÇOU!
echo    O TERMINAL É SEU ÚNICO ALIADO.
echo ======================================================
echo.

cmd /k