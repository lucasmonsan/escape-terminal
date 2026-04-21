@echo off
chcp 65001 >nul
if exist "diario.txt" (
    echo [SISTEMA]: Diário detectado e legível. 
    echo.
    timeout /t 1 >nul
    echo O diário é muito grande, e está cheio de coisas desnecessárias.
    echo.
    timeout /t 1 >nul
    echo Para ajudar, as coisas importantes estão marcadas com a palavra IMPORTANTE maiúscula.
    echo.
    timeout /t 1 >nul
    echo Você pode procurar por uma palavra dentro de um arquivo, é só usar o comando FIND "PALAVRA" NOMEAQUIVO
) else (
    echo [SISTEMA]: Erro. O diário está corrompido.
    echo.
    timeout /t 1 >nul
    echo Para desbloquear a dica, recupere o diário.
    echo.
    timeout /t 1 >nul
    echo Para recuperá-lo, renomeie para diario.txt.
)
echo.
pause
