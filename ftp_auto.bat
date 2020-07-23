REM é possível usar também com SFTP
open ftp://user:password@server
cd <pasta>
REM baixar arquivo
get <filename> <pasta_destino>
REM remover arquivo remoto
rm <filename>
exit
REM concede permissão total no arquivo baixado
cacls <caminho_arquivo> /E /G everyone:F

