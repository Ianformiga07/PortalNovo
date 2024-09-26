<%
	dim conn
sub abreConexao

	'Criando a conexão com o BD
	strcon = "Provider=MSOLEDBSQL;Server=localhost;Database=PortalAnanas;Uid=sa;Pwd=123;"
	'strcon =  "Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User ID=IANFORMIGA;Initial Catalog=PortalAnanas;Data Source=localhost"
	set conn = Server.CreateObject("ADODB.Connection")
	conn.open(strcon)	
end sub


sub fechaConexao
	'Fechando a conexão com o BD
	conn.Close()
	Set conn = Nothing
end sub
%>