<!--#include file="base.asp"-->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-plane text-blue"></i> Solicitação de Diárias
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="diarias.asp">Diárias</a></li> /
      <span class="font-w-600">Solicitação de Diária</span>
    </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- Form start -->
          <form role="form" action="solicitar_diaria.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
              <!-- Server Information (Static Labels) -->
                <div class="row">
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>CPF:</label>
                      <span id="cpfLabel" style="font-weight: normal;">000.000.000-00</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>Nome:</label>
                      <span id="nomeLabel" style="font-weight: normal;">Nome do Servidor</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>Cargo:</label>
                      <span id="cargoLabel" style="font-weight: normal;">Cargo do Servidor</span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>Setor:</label>
                      <span id="setorLabel" style="font-weight: normal;">Setor do Servidor</span>
                      </div>
                  </div>
                </div>

              <!-- Diária Request Fields -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="destination">Destino</label>
                    <input type="text" class="form-control" id="destination" name="destination" placeholder="Digite o destino da viagem" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="startDate">Data de Saída</label>
                    <input type="date" class="form-control" id="startDate" name="startDate" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="endDate">Data de Chegada</label>
                    <input type="date" class="form-control" id="endDate" name="endDate" required>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="destination">Quantidade de Diarias</label>
                    <input type="text" class="form-control" id="destination" name="destination" required>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="startDate">Valor da Diária</label>
                    <input type="text" class="form-control" id="startDate" name="startDate" required>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="endDate">Tipo de Devolução</label>
                    <input type="text" class="form-control" id="endDate" name="endDate" required>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="form-group">
                    <label for="endDate">Valor de Devolução</label>
                    <input type="text" class="form-control" id="endDate" name="endDate" required>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="reason">Motivo da Viagem</label>
                    <textarea class="form-control" id="reason" name="reason" rows="3" placeholder="Descreva o motivo da viagem" required></textarea>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="bankAccount">Banco</label>
                    <input type="text" class="form-control" id="bankAccount" name="bankAccount" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="bankAccount">Agência</label>
                    <input type="text" class="form-control" id="bankAccount" name="bankAccount" required>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="bankAccount">Conta Corrente</label>
                    <input type="text" class="form-control" id="bankAccount" name="bankAccount" required>
                  </div>
                </div>
              </div>
            </div>

            <!-- Submit Button -->
            <div class="box-footer">
              <button type="submit" class="btn btn-primary pull-right">Solicitar Diária</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</div>
<!--#include file="footer.asp"-->