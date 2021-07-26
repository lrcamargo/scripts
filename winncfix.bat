@echo off
:menu
echo -------------------------------------------------
echo Menu Principal
echo -------------------------------------------------
echo 1 - Editar registro (prompt em modo administrador)
echo 2 - Deletar pasta
echo 3 - Copiar pasta
echo 4 - Editar arquivos
echo 5 - Sair
set /p Input=Escolha a opcao do menu:
if %Input%==1 goto reg
if %Input%==2 goto delete
if %Input%==3 goto copiar
if %Input%==4 goto editar
if %Input%==5 goto sair

:reg
powershell -Command "(Set-ItemProperty -Path 'Registry::HKEY_CLASSES_ROOT\exefile\shell\open\command' -Name '(default)' -Value '\"%%1\" %%*')"
goto menu

:delete
cls
for /L %%i in (1,1,60) do (
  rmdir /s /q C:\Users\aluno%%i\WINNC
)
goto menu

:copiar
for /L %%i in (1,1,60) do (
  xcopy C:\WINNC C:\Users\aluno%%i\WINNC /E /H /C /I
)
goto menu

:editar
for /L %%i in (1,1,60) do (
echo "Editando usuario %%i..."
  powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\FAN0.M\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\FAN0.M\project.ini"
  powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\FAN0.T\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\FAN0.T\project.ini"	
  powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\SIE810.M\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\SIE810.M\project.ini"
  powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\SIE810.T\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\SIE810.T\project.ini"
  powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\SIE820.M\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\SIE820.M\project.ini"
powershell -Command "(gc -path C:\Users\aluno%%i\WINNC\SIE820.T\project.ini) -replace 'C:', 'C:\Users\aluno%%i' | Out-File -encoding ASCII C:\Users\aluno%%i\WINNC\SIE820.T\project.ini"
)
goto menu

:sair
exit/b
