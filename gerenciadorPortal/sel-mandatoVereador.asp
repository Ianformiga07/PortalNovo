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

</script>
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-calendar text-blue"></i> Gerenciar Legislatura dos Vereadores
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="vereadores.asp">A Câmara</a></li> /
      <span class="font-w-600">Gerenciar Vereador</span>
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
      </div>
      <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5">
                        <label for="anoLegislatura">Ano da Legislatura</label>
                        <select class="form-control" id="anoLegislatura" name="anoLegislatura" onchange="buscarLegislatura()">
                        <option> -- Selecionar --</option>
                        <option disabled></option>
                        <option value="1">2021-2024</option>
                        <option value="2">2025-2028</option>
                        <option value="3">2029-2032</option>
                        </select>
                    </div>

                    <div class="col-md-5">
                        <label for="vereadores">Vereadores Disponíveis</label>
                        <select class="form-control" id="vereadores" name="vereadores">
                        <option> -- Selecionar --</option>
                        <option disabled></option>
                        <option value="101">João da Silva</option>
                        <option value="102">Maria dos Santos</option>
                        <option value="103">Carlos Pereira</option>
                        </select>
                    </div>

                    <div class="col-md-2 d-flex align-items-end">
                        <label for="vereadores">&nbsp</label>
                        <button type="button" class="btn btn-primary form-control"  onclick="inserirVereador(document.getElementById('vereadores').value, document.getElementById('anoLegislatura').value)">
                        <i class="fa fa-fw fa-check"></i> Inserir
                        </button>
                    </div>
                </div>
            </div>
        </div>
          <div class="box box-primary">
            <div class="box-body">
                <div class="col-md-12" style="margin-top: 15px;">
                    <table id="example2" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                        <th>Nome</th>
                        <th>Ano da Legislatura</th>
                        <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                        <td>João da Silva</td>
                        <td>2025-2028</td>
                        <td class="d-flex justify-content-center align-items-center">
                            <a href="cadastroDados.asp?id_vereador=101" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                            <a href="mesaComissao.asp?id_vereador=101&ano=2025" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2025/2026</a>
                            <a href="mesaComissao.asp?id_vereador=101&ano=2027" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2027/2028</a>
                        </td>
                        </tr>
                        <tr>
                        <td>Maria dos Santos</td>
                        <td>2025-2028</td>
                        <td class="d-flex justify-content-center align-items-center">
                            <a href="cadastroDados.asp?id_vereador=102" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                            <a href="mesaComissao.asp?id_vereador=102&ano=2025" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2025/2026</a>
                            <a href="mesaComissao.asp?id_vereador=102&ano=2027" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2027/2028</a>
                        </td>
                        </tr>
                        <tr>
                        <td>Carlos Pereira</td>
                        <td>2029-2032</td>
                        <td class="d-flex justify-content-center align-items-center">
                            <a href="cadastroDados.asp?id_vereador=103" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                            <a href="mesaComissao.asp?id_vereador=103&ano=2029" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2029/2030</a>
                            <a href="mesaComissao.asp?id_vereador=103&ano=2031" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> 2031/2032</a>
                        </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
            </div>
          </div>
    </form>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->