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

                <div class="row">
                  <div class="col-md-3">
                      <div class="form-group">
                      <label class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">CPF:</label>
                      <span id="cpfLabel" class="box-title text-black" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">000.000.000-00</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Nome:</label>
                      <span id="nomeLabel" class="box-title text-black" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Nome do Servidor</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Cargo:</label>
                      <span id="cargoLabel" class="box-title text-black" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Cargo do Servidor</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Setor:</label>
                      <span id="setorLabel" class="box-title text-black" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">Setor do Servidor</span>
                      </div>
                  </div>
                </div>

              <!-- Mês de Referência e Salário Base (Lado a lado) -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="mes_referencia">Mês de Referência</label>
                    <input type="month" id="mes_referencia" name="mes_referencia" class="form-control" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="salario_base">Salário Base (R$)</label>
                    <input type="number" step="0.01" id="salario_base" name="salario_base" class="form-control" required>
                  </div>
                </div>
              </div>

            <!-- Proventos (lado a lado) -->
              <div class="box-header text-blue" style="border: none; padding: 0;">
                  <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                  <i class="fa fa-caret-right"></i> Proventos
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="auxilio_transporte">Auxílio Transporte (R$)</label>
                    <input type="number" step="0.01" id="auxilio_transporte" name="auxilio_transporte" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="auxilio_alimentacao">Auxílio Alimentação (R$)</label>
                    <input type="number" step="0.01" id="auxilio_alimentacao" name="auxilio_alimentacao" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="adicional_incentivo">Adicional de Incentivo Funcional (20%) (R$)</label>
                    <input type="number" step="0.01" id="adicional_incentivo" name="adicional_incentivo" class="form-control">
                  </div>
                </div>
              </div>

              <!-- Descontos (lado a lado) -->
              <div class="box-header text-blue" style="border: none; padding: 0;">
                  <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                  <i class="fa fa-caret-right"></i> Descontos
                  </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="inss">INSS (R$)</label>
                    <input type="number" step="0.01" id="inss" name="inss" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="irrf">IRRF (R$)</label>
                    <input type="number" step="0.01" id="irrf" name="irrf" class="form-control">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="outros_descontos">Outros Descontos (R$)</label>
                    <input type="number" step="0.01" id="outros_descontos" name="outros_descontos" class="form-control">
                  </div>
                </div>
              </div>

              <!-- Total Líquido -->
              <div class="form-group">
                <label for="total_liquido">Total Líquido (R$)</label>
                <input type="number" step="0.01" id="total_liquido" name="total_liquido" class="form-control" readonly>
              </div>

            </div>
            <!-- Submit Button -->
            <div class="box-footer">
              <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
              <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Cadastrar</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->