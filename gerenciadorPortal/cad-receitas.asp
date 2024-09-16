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
                    <label for="processNumber">Número do Processo</label>
                    <input type="text" class="form-control" id="processNumber" name="processNumber" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="empenhoNumber">Número do Empenho</label>
                    <input type="text" class="form-control" id="empenhoNumber" name="empenhoNumber" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="date">Data do Empenho</label>
                    <input type="date" class="form-control" id="date" name="date" value="" required>
                  </div>
                </div>
              </div>

              <!-- Financial Information -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="amount">Valor Empenhado</label>
                    <input type="number" class="form-control" id="amount" name="amount" value="" step="0.01" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="cancellationValue">Valor da Anulação do Empenho</label>
                    <input type="number" class="form-control" id="cancellationValue" name="cancellationValue" value="" step="0.01">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="totalEmpenhoValue">Valor Total do Empenho</label>
                    <input type="number" class="form-control" id="totalEmpenhoValue" name="totalEmpenhoValue" value="" step="0.01" required>
                  </div>
                </div>
              </div>

              <!-- Vendor Information -->
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="vendorName">Nome do Fornecedor</label>
                    <input type="text" class="form-control" id="vendorName" name="vendorName" value="" required>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="vendorCNPJ">CNPJ do Fornecedor</label>
                    <input type="text" class="form-control" id="vendorCNPJ" name="vendorCNPJ" value="" required>
                  </div>
                </div>
              </div>

              <!-- Additional Details -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="orgao">Órgão/Unidade Gestora</label>
                    <input type="text" class="form-control" id="orgao" name="orgao" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="unidade">Unidade</label>
                    <input type="text" class="form-control" id="unidade" name="unidade" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="action">Ação</label>
                    <input type="text" class="form-control" id="action" name="action" value="" required>
                  </div>
                </div>
              </div>

              <!-- Budget Information -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="source">Fonte</label>
                    <input type="text" class="form-control" id="source" name="source" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="subFunction">Sub Função</label>
                    <input type="text" class="form-control" id="subFunction" name="subFunction" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="rubrica">Rúbrica Despesa</label>
                    <input type="text" class="form-control" id="rubrica" name="rubrica" value="" required>
                  </div>
                </div>
              </div>

              <!-- More Financial Information -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="empenhoPhase">Fase</label>
                    <input type="text" class="form-control" id="empenhoPhase" name="empenhoPhase" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="modality">Modalidade</label>
                    <input type="text" class="form-control" id="modality" name="modality" value="" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="licitacao">Licitação/Ano</label>
                    <input type="text" class="form-control" id="licitacao" name="licitacao" value="">
                  </div>
                </div>
              </div>

              <!-- Description -->
              <div class="form-group">
                <label for="description">Histórico</label>
                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
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
                <button type="submit" class="btn btn-primary pull-right">Cadastrar Empenho</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>

<!--#include file="footer.asp"-->