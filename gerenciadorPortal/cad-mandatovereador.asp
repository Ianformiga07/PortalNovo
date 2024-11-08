<!--#include file="base.asp"-->
<%
call abreConexao

if request.form("Tipo") = 1 then
   sql = "Insert cam_vereador(id_servidor, IdMandato) values('"&request.form("id_servidor")&"', '"&request.form("selAnoMandato")&"')"
   conn.execute(sql)
   response.Redirect("cad-mandatovereador.asp?Atualizar=1&id_servidor="&Request.form("id_servidor")&"&nomeVereador="&Request.form("nomeVereador")&"")
end if 





%>
<script>
function Atualizar() {
    var form = document.forms["frm_SelecionarMandato"];
    form.action = "mandatosLeg.asp";
    form.submit();
}

function cadastrar(){      

var form = document.forms["frmHistoria"];
form.Operacao.value = "2";
form.enctype = "multipart/form-data";
form.action = "crud-historia.asp";
form.submit();

}
</script>
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-calendar text-blue"></i> Inserir Mandato Vereador <%=UCASE(Request("nomeVereador"))%>
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="vereadores.asp">Administrador</a></li> /
      <span class="font-w-600">Selecionar Ano de Mandato</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-3">
    <form action="cad-mandatovereador.asp" method="post" name="frm_SelecionarMandato" class="d-flex align-items-end">
      <input type="hidden" name="id_servidor" id="id_servidor" value="<%=Request("id_servidor")%>">
      <input type="hidden" name="nomeVereador" id="nomeVereador" value="<%=Request("nomeVereador")%>">
      <%IF REQUEST("Atualizar") = 1 THEN%>
      <script>
            Atualizar();
      </script>
      <%END IF%>
      <input type="hidden" name="Tipo" id="Tipo" value="1">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto de Perfil
                </div>
            </div>
            <div class="box-body" >
                <img class="profile-user-img img-responsive preview-upVereador" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="upVereador"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="upVereador" name="users_imagem" style="display: none"/>
            </div>
          </div>
      </div>
      <div class="col-xs-9">
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
              <div class="row">
                <div class="col-md-12">
                  <label for="nomeCompleto">Nome Completo</label>
                  <input type="text" class="form-control" id="nomeCompleto" value="<%=nomeVereador%>" disabled>
                </div>

              </div>
              <div class="row" style="margin-top: 10px;">
                <div class="col-md-6">
                  <label for="apelido">Apelido</label>
                  <input type="text" class="form-control" id="apelido" name="apelido">
                </div>
                <div class="col-md-6">
                  <label for="partido">Partido</label>
                  <input type="text" class="form-control" id="partido" name="partido" accept=".pdf">
                </div>
              </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-6">
                  <label for="ocupacao">Ocupação</label>
                  <input type="text" class="form-control" id="ocupacao" name="ocupacao">
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    <label for="selAnoMandato">Ano do Mandato</label>
                    <select class="form-control" id="selAnoMandato" name="selAnoMandato">
                        <option value="">Selecione o Ano</option>
                        <% 
                        ' Recupera anos de mandato da tabela cam_mandatos (por exemplo)
                        Dim sql, rsAnos
                        sql = "SELECT IdMandato, Mandato  FROM     cam_vereadorMandato"
                        Set rsAnos = conn.Execute(sql)
                        Do While Not rsAnos.EOF
                        %>
                            <option value="<%= rsAnos("IdMandato") %>"><%= rsAnos("Mandato") %></option>
                        <%
                            rsAnos.MoveNext
                        Loop
                        rsAnos.Close
                        Set rsAnos = Nothing
                        call fechaConexao
                        %>
                    </select>
                    </div>
                </div>
            </div>
            <div class="box-footer">
                <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
            </div>
          </div>

      </div>
    </form>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->