<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Empenho
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="empenho.asp">Empenho</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Form start -->
          <form role="form" action="cadastrar_empenho.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <!-- General Information -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="empenhoNumber">Número do Empenho</label>
                    <input type="text" class="form-control" id="empenhoNumber" name="empenhoNumber" placeholder="Digite o número do empenho" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="date">Data do Empenho</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="dueDate">Data de Vencimento</label>
                    <input type="date" class="form-control" id="dueDate" name="dueDate" required>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label for="description">Descrição</label>
                <textarea class="form-control" id="description" name="description" rows="3" placeholder="Descreva o empenho" required></textarea>
              </div>
              
              <!-- Financial Information -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="amount">Valor</label>
                    <input type="number" class="form-control" id="amount" name="amount" placeholder="Digite o valor" step="0.01" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="paymentType">Tipo de Pagamento</label>
                    <select class="form-control" id="paymentType" name="paymentType" required>
                      <option value="">Selecione...</option>
                      <option value="boleto">Boleto</option>
                      <option value="transferencia">Transferência</option>
                      <option value="cheque">Cheque</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="costCenter">Centro de Custo</label>
                    <input type="text" class="form-control" id="costCenter" name="costCenter" placeholder="Digite o centro de custo" required>
                  </div>
                </div>
              </div>

              <!-- Vendor Information -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="vendorName">Nome do Fornecedor</label>
                    <input type="text" class="form-control" id="vendorName" name="vendorName" placeholder="Digite o nome do fornecedor" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="vendorCNPJ">CNPJ do Fornecedor</label>
                    <input type="text" class="form-control" id="vendorCNPJ" name="vendorCNPJ" placeholder="Digite o CNPJ do fornecedor" required>
                  </div>
                </div>
              </div>

              <!-- Responsible Person -->
              <div class="form-group">
                <label for="responsiblePerson">Responsável pelo Empenho</label>
                <input type="text" class="form-control" id="responsiblePerson" name="responsiblePerson" placeholder="Digite o nome do responsável" required>
              </div>

              <!-- Document Upload -->
              <div class="form-group">
                <label for="attachment">Anexar Documentos</label>
                <input type="file" id="attachment" name="attachment[]" multiple>
                <p class="help-block">Você pode anexar vários documentos, como contratos ou notas fiscais.</p>
              </div>
            </div>

            <!-- Submit Button -->
            <div class="box-footer">
                <button type="submit" class="btn btn-primary">Cadastrar Empenho</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->