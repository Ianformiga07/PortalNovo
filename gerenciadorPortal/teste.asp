<!--#include file="base.asp"-->
<%
%>
<script>
function buscarLegislatura() {
    document.forms["frmBuscar"].submit();
}

function inserirVereador(idVereador, anoLegislatura) {
    if (confirm("Deseja inserir este vereador na legislatura?")) {
        var form = document.forms["frmInserir"];
        form.action = "inserirVereadorLegislatura.asp";
        form.id_vereador.value = idVereador;
        form.ano_legislatura.value = anoLegislatura;
        form.submit();
    }
}
</script>

<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-calendar text-blue"></i> Gerenciar Legislatura dos Vereadores
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-6">
        <form action="pagina_atual.asp" method="post" name="frmBuscar" class="d-flex align-items-end">
          <label for="anoLegislatura">Ano da Legislatura</label>
          <select class="form-control" id="anoLegislatura" name="anoLegislatura" onchange="buscarLegislatura()">
            <option value="">Selecione o Ano</option>
            <option value="1">2021-2024</option>
            <option value="2">2025-2028</option>
            <option value="3">2029-2032</option>
          </select>
        </form>
      </div>
      
      <div class="col-md-6">
        <label for="vereadores">Vereadores Disponíveis</label>
        <select class="form-control" id="vereadores" name="vereadores">
            <option value="101">João da Silva</option>
            <option value="102">Maria dos Santos</option>
            <option value="103">Carlos Pereira</option>
        </select>
      </div>

      <div class="col-md-12" style="margin-top: 15px;">
        <button type="button" class="btn btn-primary" onclick="inserirVereador(document.getElementById('vereadores').value, document.getElementById('anoLegislatura').value)">
          <i class="fa fa-fw fa-check"></i> Inserir Vereador na Legislatura
        </button>
      </div>

      <div class="col-md-12" style="margin-top: 15px;">
        <table class="table table-bordered table-hover">
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
              <td>
                <a href="cadastroDados.asp?id_vereador=101" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                <a href="mesaComissao.asp?id_vereador=101&ano=2025" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2025/2026</a>
                <a href="mesaComissao.asp?id_vereador=101&ano=2027" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2027/2028</a>
              </td>
            </tr>
            <tr>
              <td>Maria dos Santos</td>
              <td>2025-2028</td>
              <td>
                <a href="cadastroDados.asp?id_vereador=102" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                <a href="mesaComissao.asp?id_vereador=102&ano=2025" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2025/2026</a>
                <a href="mesaComissao.asp?id_vereador=102&ano=2027" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2027/2028</a>
              </td>
            </tr>
            <tr>
              <td>Carlos Pereira</td>
              <td>2029-2032</td>
              <td>
                <a href="cadastroDados.asp?id_vereador=103" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                <a href="mesaComissao.asp?id_vereador=103&ano=2029" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2029/2030</a>
                <a href="mesaComissao.asp?id_vereador=103&ano=2031" class="btn btn-warning btn-sm"><i class="fa fa-users"></i> Mesa 2031/2032</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->