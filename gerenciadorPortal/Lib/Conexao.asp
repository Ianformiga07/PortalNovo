<%
'Conexão de Banco de Dados SQL Server
dim conn, dbPassword, dbUser, dbName, dbHost
sub abreConexao

    'Variáveis de conexão
    dbPassword = "123"
    dbUser     = "sa"
    dbName     = "PortalAnanas"
    dbHost     = "IANFORMIGA"

'Criando a conexão com o BD
set conn = Server.CreateObject("ADODB.Connection")
    strcon =  "Provider=SQLOLEDB.1;Password="&dbPassword&";Persist Security Info=True;User ID="&dbUser&";Initial Catalog="&dbName&";Data Source="&dbHost&";"
    conn.open strcon
   
end sub

sub fechaConexao
'Fechando a conexão com o BD
conn.Close()
Set conn = Nothing
end sub
%>