<!--#include file="base.asp"-->


    <script>
    function formatPopulation(input) {
        // Remove todos os caracteres que não sejam números
        let value = input.value.replace(/\D/g, '');
        
        // Adiciona pontos como separadores de milhar
        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
        
        // Atualiza o valor do campo de entrada
        input.value = value;
    }


      function cadastrar(){
          var form = document.forms["frmHistoria"];
          form.Operacao.value = 2;
          form.action = "crud-historia.asp";
          form.submit();
      }

    </script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-fw fa-check-square-o text-blue"></i> História
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">História</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">

        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Dados Pessoais</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" name="frmHistoria" method="post">
                  <input type="hidden" name="Operacao" id="Operacao">
                <div class="box-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="anoFundacao">Ano de Fundação</label>
                                <input type="text" class="form-control" id="anoFundacao" name="anoFundacao">
                            </div>
                            <div class="col-md-2">
                                <label for="diaAniversario">Dia de Aniversário</label>
                                <select class="form-control" id="diaAniversario" name="diaAniversario">
                                    <option value="">Selecione o dia</option>
                                    <% For i = 1 To 31 %>
                                        <option value="<%=i%>"><%=i%></option>
                                    <% Next %>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="mesAniversario">Mês de Aniversário</label>
                                <select class="form-control" id="mesAniversario" name="mesAniversario">
                                    <option value="">Selecione o mês</option>
                                    <option value="Janeiro">Janeiro</option>
                                    <option value="Fevereiro">Fevereiro</option>
                                    <option value="Março">Março</option>
                                    <option value="Abril">Abril</option>
                                    <option value="Maio">Maio</option>
                                    <option value="Junho">Junho</option>
                                    <option value="Julho">Julho</option>
                                    <option value="Agosto">Agosto</option>
                                    <option value="Setembro">Setembro</option>
                                    <option value="Outubro">Outubro</option>
                                    <option value="Novembro">Novembro</option>
                                    <option value="Dezembro">Dezembro</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="populacao">População</label>
                                 <input type="text" class="form-control" id="populacao" name="populacao" oninput="formatPopulation(this)">
                            </div>
                            <div class="col-md-6">
                                <label for="area">Área (km²)</label>
                                <input type="text" class="form-control" id="area" name="area">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>
                            Conteúdo
                            <span class="text-red-light">*</span>
                        </label>
                        <div class="box-body pad">
                            <textarea id="editor1" name="editor1" rows="10" cols="90">
                                
                            </textarea>
                        </div>
                    </div>

                </div>

                <div class="box-footer">
                    <a href="javascript:history.back()" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
                    <button type="submit" onClick="return cadastrar()" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
                </div>
                </form>
            </div>
            <!-- /.box -->

          </div>
          <!-- /.nav-tabs-custom -->
        </div>

        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto da Cidade
                </div>
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-image-cidade" src="images/avatar.jpg" style="height: 150px; width: 150px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="image-cidade"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="image-cidade" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Imagem do Brasão
                </div>
            </div>
            <div class="box-body">
                <img class="profile-user-img img-responsive preview-image-brasao" src="images/avatar.jpg" style="height: 150px; width: 150px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="image-brasao"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="image-brasao" name="users_imagem" style="display: none"/>
            </div>
          </div>
          <!-- /.box -->
        </div>

      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

  </div>

<!--#include file="footer.asp"-->