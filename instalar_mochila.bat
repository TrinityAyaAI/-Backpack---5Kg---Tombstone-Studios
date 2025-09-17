@echo off
set /p DBUSER=Usuário MySQL:
set /p DBNAME=Nome da database:
echo Será solicitado a senha; digite-a quando aparecer.
mysql -u %DBUSER% -p %DBNAME% < "%~dp0install_mochila.sql"
if %ERRORLEVEL%==0 (
  echo Import concluida com sucesso.
) else (
  echo ERRO: verifique credenciais ou arquivo.
)
pause
