@echo off
chcp 65001 >nul
if exist "diario.txt" (
    echo [SISTEMA]: Diário detectado e legível. 
    echo.
    echo O diario e muito grande, e esta cheio de coisas desnecessarias.
    echo Para ajudar, as coisas importantes estao marcadas com a palavra IMPORTANTE maiuscula.
    echo Voce pode procurar por uma palavra dentro de um arquivo, e so usar o comando find palavra nomearquivo 
    echo.
) else (
    echo [SISTEMA]: Erro. diario está corrompido. 
    echo Para recupera-lo, renomeie para diario.txt.
)
pause
