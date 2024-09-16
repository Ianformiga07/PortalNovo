<!--#include file="base.asp"-->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-money text-blue"></i> Cadastrar Folha de Pagamento
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> /
          <li><a href="folha_pagamento.asp">Folha de Pagamento</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Form start -->
          <form role="form" action="cadastrar_folha_pagamento.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <!-- Server List -->
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>Servidor</th>
                      <th>Salário Base (R$)</th>
                      <th>INSS (R$)</th>
                      <th>Outras Remunerações (R$)</th>
                      <th>Proventos (R$)</th>
                      <th>Descontos (R$)</th>
                      <th>Valor Líquido (R$)</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Loop through the list of servidores -->
                    <% 
                      ' Exemplo de loop para gerar a lista de servidores
                      Dim servidores
                      servidores = Array("Servidor 1", "Servidor 2", "Servidor 3") ' Lista de servidores
                      For Each servidor in servidores
                    %>
                    <tr>
                      <td><%= servidor %></td>
                      <td><input type="number" class="form-control" name="salarioBase[]" step="0.01" required></td>
                      <td><input type="number" class="form-control" name="inss[]" step="0.01"></td>
                      <td><input type="number" class="form-control" name="outrasRemuneracoes[]" step="0.01"></td>
                      <td><input type="number" class="form-control" name="proventos[]" step="0.01" readonly></td>
                      <td><input type="number" class="form-control" name="descontos[]" step="0.01"></td>
                      <td><input type="number" class="form-control" name="liquido[]" step="0.01" readonly></td>
                    </tr>
                    <% Next %>
                  </tbody>
                </table>
              </div>
            </div>
<script>
document.querySelectorAll('input').forEach(input => {
  input.addEventListener('input', function() {
    const row = this.closest('tr');
    const salarioBase = parseFloat(row.querySelector('input[name="salarioBase[]"]').value) || 0;
    const inss = parseFloat(row.querySelector('input[name="inss[]"]').value) || 0;
    const outrasRemuneracoes = parseFloat(row.querySelector('input[name="outrasRemuneracoes[]"]').value) || 0;
    const descontos = parseFloat(row.querySelector('input[name="descontos[]"]').value) || 0;

    const proventos = salarioBase + outrasRemuneracoes;
    const liquido = proventos - inss - descontos;

    row.querySelector('input[name="proventos[]"]').value = proventos.toFixed(2);
    row.querySelector('input[name="liquido[]"]').value = liquido.toFixed(2);
  });
});
</script>
            <!-- Submit Button -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Salvar Folha de Pagamento</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->