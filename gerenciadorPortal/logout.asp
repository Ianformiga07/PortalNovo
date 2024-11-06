<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<%
' Encerra a sessão do usuário
Session.Abandon

' Remove todas as variáveis de sessão, caso necessário
Session.Contents.RemoveAll

' Redireciona o usuário para a página de login
Response.Redirect "login.asp"
%>