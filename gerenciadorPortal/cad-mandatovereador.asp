<% Response.CodePage = 65001 %>
<!--#include file="base.asp"-->

<%
IdVereador = request("IdVereador")

  call abreConexao
  sql = "SELECT   cam_vereador.Id_Vereador, cam_vereador.id_servidor, cam_servidores.CPF, cam_servidores.NomeCompleto, cam_vereadorMandato.Mandato, cam_vereador.statusVereador, cam_vereador.fotoVereador, cam_vereador.apelido, cam_vereador.partido, cam_vereador.ocupacao FROM   cam_vereador INNER JOIN  cam_servidores ON cam_vereador.id_servidor = cam_servidores.id_servidor inner join cam_vereadorMandato on cam_vereador.IdMandato = cam_vereadorMandato.IdMandato WHERE (cam_vereador.Id_Vereador = '"&IdVereador&"')"
  'response.write sql
  'response.end
  set rs = conn.execute(sql)
  IF not rs.eof THEN
    CPFServidor = rs("CPF")
    NomeServidor = rs("NomeCompleto")
    Mandato = rs("Mandato")
    fotoVereador = rs("fotoVereador")
    apelido = rs("apelido")
    partido = rs("partido")
    ocupacao = rs("ocupacao")
    statusVereador = rs("statusVereador")
    id_servidor = rs("id_servidor")
    Id_Vereador = rs("Id_Vereador")
    ' Verificar se o status está cadastrado
    If IsNull(rs("statusVereador")) Or rs("statusVereador") = "" Then
        statusVereador = "true" ' Valor padrão "Ativo"
    Else
        statusVereador = rs("statusVereador")
    End If
  END IF 


  call fechaConexao
%>
<script>
function Atualizar() {
    var form = document.forms["frm_SelecionarMandato"];
    form.action = "mandatosLeg.asp";
    form.submit();
}

function cadastrar(){      

var form = document.forms["frm_SelecionarMandato"];
form.Operacao.value = "3";
form.enctype = "multipart/form-data";
form.action = "crud-vereador.asp";
form.submit();

}
</script>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-user text-blue"></i> Inserir Dados Vereador
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="vereadores.asp">Administrador</a></li> /
      <span class="font-w-600">Dados Pessoais Vereador</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-3">
    <form method="post" name="frm_SelecionarMandato" class="d-flex align-items-end">
      <input type="hidden" name="Operacao" id="Operacao">
      <input type="hidden" name="id_servidor" id="id_servidor" value="<%=id_servidor%>">
      <input type="hidden" name="IdVereador" id="IdVereador" value="<%=Id_Vereador%>">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto de Perfil
                </div>
            </div>
            <div class="box-body">
                <% If fotoVereador <> "" Then %>
                <img class="profile-user-img img-responsive preview-upVereador" src="upVereador/<%= fotoVereador %>" style="height: 200px; width: 200px;">
                <% Else %>
                <img class="profile-user-img img-responsive preview-upVereador" src="images/avatar.jpg" style="height: 200px; width: 200px;">
                <% End If %>
            </div>
            <div class="box-footer">
                <div class="box-header with-border">
                    <button type="button" class="btn-file btn btn-action-default btn-success pull-right" id="upVereador"><span class="fa fa-camera"></span> Foto</button>
                    <input type="file" class="upVereador" name="upVereadorbt" id="upVereadorbt" accept="image/*" style="display: none" />
                </div>
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

          <!-- Dados Pessoais -->
          <div class="box box-primary">
            <div class="box-body">
              <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                    <label>CPF:</label>
                    <span id="cpfLabel" style="font-weight: normal; font-size: 16px;"><%=CPFServidor%></span>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                    <label>Nome:</label>
                    <span id="nomeLabel" style="font-weight: normal; font-size: 16px;"><%=Ucase(NomeServidor)%></span>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                    <label>Ano Legislativo:</label>
                    <span id="AnoLeg" style="font-weight: normal; font-size: 16px;"><%=Mandato%></span>
                    </div>
                </div>
              </div>
            </div>
          </div>

              <div class="row">
              </div>
              <div class="row" style="margin-top: 10px;">
                <div class="col-md-12">
                  <label for="apelido">Apelido(Nome popular)</label>
                  <input type="text" class="form-control" id="apelido" name="apelido" value="<%=apelido%>">
                </div>
              </div>
            <div class="row" style="margin-top: 10px;">
                <div class="col-md-3">
                  <label for="partido">Partido</label>
                  <input type="text" class="form-control" id="partido" name="partido" value="<%=partido%>">
                </div>
                <div class="col-md-6">
                  <label for="ocupacao">Ocupação</label>
                  <input type="text" class="form-control" id="ocupacao" name="ocupacao" value="<%=ocupacao%>">
                </div>
                <div class="col-md-3">
                    <label for="statusVereador">Status Vereador</label>
                    <select class="form-control" id="statusVereador" name="statusVereador">
                        <option disabled=""></option>
                        <option value="true" <% If statusVereador = true Then %> selected <% End If %>>Ativo</option>
                        <option value="false" <% If statusVereador = false Then %> selected <% End If %>>Inativo</option>
                    </select>
                </div>
            </div>
            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" onClick="<%if existe = 1 then%>return alterar()<%else%>return cadastrar()<%end if%>" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> <%if existe = 1 then%>Alterar<%else%>Cadastrar<%end if%></button>
            </div> 
          </div>

      </div>
    </form>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->