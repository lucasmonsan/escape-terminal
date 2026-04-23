@echo off
:: Forca a pagina de codigo para compatibilidade de simbolos
chcp 850 >nul

cls

:: Oculta a pasta de recursos
attrib +h +s "recursos" /s /d >nul 2>&1

title ESCAPE TERMINAL

:: Adiciona a pasta atual ao PATH para o comando "jogar" funcionar em qualquer subpasta
set PATH=%PATH%;%~dp0

:: Customiza o prompt do aluno
prompt [ESCAPE TERMINAL] $P$G

:: Encerra o explorer para imersao total
taskkill /f /im explorer.exe >nul 2>&1

:: Reset da sala do Nivel 1
if exist "sala" rd /s /q "sala"
mkdir "sala"

:: Copia o conteudo usando Robocopy (nativo no Win 7/10 e mais estavel que xcopy)
robocopy "recursos\fase1\sala" "sala" /e /h /njh /njs /ndl /nc /ns >nul

:: MECANICA DE ESCURIDAO: Esconde itens que precisam de luz
cd sala
attrib +h "armario" /s /d >nul 2>&1
attrib +h "cofre" /s /d >nul 2>&1
attrib +h "computador" /s /d >nul 2>&1
attrib +h "porta.bat" >nul 2>&1
attrib +h "computador.bat" >nul 2>&1
attrib +h "cofre.bat" >nul 2>&1

:: Esconde a maleta debaixo da cama
attrib +h "cama\maleta.bat" >nul 2>&1

:: Garante que a lanterna esteja visivel na sala (conforme nova regra)
attrib -h "lanterna.bat" >nul 2>&1

cls
echo =========================================================
echo              BEM-VINDO AO ESCAPE TERMINAL
echo =========================================================
echo.
echo Voce acordou em um quarto escuro e a porta esta trancada.
echo.
echo Use DIR para olhar ao redor e CD para se mover.
echo.
echo =========================================================
echo     O JOGO COMECOU!
echo     O TERMINAL E SEU UNICO ALIADO.
echo =========================================================
echo.

cmd /k
