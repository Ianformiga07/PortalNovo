<!--#include file="base.asp"-->

<%

IF REQUEST("Operacao") = 1 THEN  'CADASTRAR'
   call abreConexao
   sql = "UPDATE  cam_vereador SET MesaDiretora = '"&REQUEST.FORM("mesaDiretora")&"' WHERE Id_Vereador = '"&REQUEST.FORM("IdVereador")&"'" 'FLAG'
   CONN.EXECUTE(SQL)
   SQL = "INSERT  INTO cam_legislativo(Id_Vereador, id_mandato, id_funcoes,statusLeg) VALUES('"&REQUEST.FORM("IdVereador")&"','"&REQUEST.FORM("anoLegMesa")&"','"&REQUEST.FORM("funcaoMesa")&"',1)"
   CONN.EXECUTE(SQL)

   'COMISSÃO'

   ARRAYLISACOMISSAO = SPLIT(REQUEST.FORM("listaComissoesLegislacao"), ",")
   
   FOR I = 0 TO UBOUND(ARRAYLISACOMISSAO)
      ARRAYITEMCOMISSAO = SPLIT(ARRAYLISACOMISSAO(I),"-")
      SQL = "INSERT INTO cam_comissao(Id_Vereador, id_funcoes, id_mandato, id_tipoComissao, statusComissao) VALUES('"&REQUEST.FORM("IdVereador")&"', '"&ARRAYITEMCOMISSAO(1)&"', '"&ARRAYITEMCOMISSAO(2)&"', '"&ARRAYITEMCOMISSAO(0)&"', 1)"
      CONN.EXECUTE(SQL)
   NEXT
  
   'ANOS ANTERIORES'
   ARRAYLISTAMANDATOSANTERIORES= SPLIT(REQUEST.FORM("ListaMandatosAnteriores"), ",")
   FOR I = 0 TO UBOUND(ARRAYLISTAMANDATOSANTERIORES)
     ARRAYITEMMANDATOSANTERIORES = SPLIT(ARRAYLISTAMANDATOSANTERIORES(I),"-")
     SQL = "INSERT INTO cam_mandatoAnt(Id_Vereador, anoInicio, anoFim) VALUES('"&REQUEST.FORM("IdVereador")&"','"&ARRAYITEMMANDATOSANTERIORES(0)&"', '"&ARRAYITEMMANDATOSANTERIORES(1)&"')"
     CONN.EXECUTE(SQL)
   NEXT
   RESPONSE.WRITE "INSERÇÃO OK TESTE !"
   RESPONSE.END
END IF 


%>

    <script>

      function cadastrar(){      

      var form = document.forms["frmLegislacao"];
      form.Operacao.value = "1";
      form.action = "cad-vereador.asp";
      form.submit();

      }

    </script>

<!-- Novo Vereador - Formulário Melhorado -->
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1><i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Vereador</h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Novo Vereador</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
    <form role="form" name="frmLegislacao" method="post">
      <input type="hidden" name="IdVereador" id="IdVereador" value = "<%=Request.form("IdVereador")%>">
      <input type="hidden" name="nomeVereador" id="nomeVereador" value = "<%=Request.form("nomeVereador")%>">
      <input type="hidden" name="Operacao" id="Operacao">
      <input type="hidden" name="listaComissoesLegislacao" id="listaComissoesLegislacao">
      <input type="hidden" name="ListaMandatosAnteriores" id="ListaMandatosAnteriores">
      
      <input type="hidden" name="id_servidor" id="id_servidor" value="<%=id_servidor%>">
      <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto Vereador
                </div>
            </div>
            <div class="box-body" >
                <img class="profile-user-img img-responsive preview-upVereador" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
          </div>
      </div>

      <div class="col-md-9">

          <!-- Dados Pessoais -->
          <div class="box box-primary">
            <div class="box-body">
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
                </div>
            </div>

            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Ano Legislativo</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>4</td>
                  <td>2025/2026</td>
                  <td>
                  <a href="#" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>

          <!-- Legislativo -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Legislativo
                    </div>
                </div>
              <div class="row">
                <div class="col-md-4">
                  <label for="mesaDiretora">Faz Parte da Mesa Diretora?</label>
                  <select class="form-control" id="mesaDiretora" name="mesaDiretora" onchange="toggleMesaDiretora(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="1">Sim</option>
                    <option value="0">Não</option>
                  </select>
                </div>
            <div id="mostraMesaDiretora" style="display: none;">
              <%
              call abreConexao
              sql = "SELECT id_mandatosLeg, mandatos FROM cam_mandatosLeg INNER JOIN   cam_vereadorMandato ON cam_mandatosLeg.IdMandato = cam_vereadorMandato.IdMandato INNER JOIN cam_vereador ON cam_vereadorMandato.IdMandato = cam_vereador.IdMandato WHERE  Id_Vereador = '"&Request.form("IdVereador")&"'"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-4">
                  <label for="anoLegMesa">Ano Legislativo</label>
                  <select class="form-control" id="anoLegMesa" name="anoLegMesa">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option  value="<%=rs_Mandato("id_mandatosLeg")%>"><%=rs_Mandato("mandatos")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                  </select>
                </div>
              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 2, 3, 4)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-4">
                  <label for="funcaoMesa">Função</label>
                  <select class="form-control" id="funcaoMesa" name="funcaoMesa">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option  value="<%=rs_Mandato("id_funcoes")%>"><%=rs_Mandato("desc_funcoes")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                  </select>
                </div>
              </div>
            </div>

                    <!-- Comissões -->
            <div class="row" style="margin-top: 15px;">
            <div class="col-md-6">
                <label for="comissoes">Faz Parte de Comissões?</label>
                <select class="form-control" id="comissoes" name="comissoes" onchange="toggleComissoes(this.value)">
                <option value=""> -- Selecionar --</option>
                <option value="sim">Sim</option>
                <option value="nao">Não</option>
                </select>
            </div>

            <div class="col-md-6" id="anoLegDiv" style="display: none;">
              <%
              call abreConexao
              sql = "SELECT id_mandatosLeg, mandatos FROM cam_mandatosLeg INNER JOIN   cam_vereadorMandato ON cam_mandatosLeg.IdMandato = cam_vereadorMandato.IdMandato INNER JOIN cam_vereador ON cam_vereadorMandato.IdMandato = cam_vereador.IdMandato WHERE  Id_Vereador = '"&Request.form("IdVereador")&"'"
              set rs_anoLegComissao = conn.execute(sql)
              %>
                <label for="AnoLegComissao">Ano Legislativo</label>
                <select class="form-control" id="AnoLegComissao" name="AnoLegComissao">
                <option value=""> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_anoLegComissao.eof%>
                    <option  value="<%=rs_anoLegComissao("id_mandatosLeg")%>"><%=rs_anoLegComissao("mandatos")%></option>
              <% rs_anoLegComissao.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>
            </div>

            <div class="row" id="mostraComissoes" style="display: none; margin-top: 10px;">
              <%
              call abreConexao
              sql = "SELECT id_tipoComissao, DescComissao FROM cam_tipoComissao"
              set rs_tipoComissao = conn.execute(sql)
              %>
            <div class="col-md-6">
                <label for="nomeComissao">Comissão</label>
                <select class="form-control" id="nomeComissao" name="nomeComissao" onchange="mostrarCamposComissao(this.value)">
                <option value=""> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_tipoComissao.eof%>
                    <option  value="<%=rs_tipoComissao("id_tipoComissao")%>"><%=rs_tipoComissao("DescComissao")%></option>
              <% rs_tipoComissao.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>

              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 5, 6)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-6">
                  <label for="funcaoComissao">Função</label>
                  <select class="form-control" id="funcaoComissao" name="funcaoComissao">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option  value="<%=rs_Mandato("id_funcoes")%>"><%=rs_Mandato("desc_funcoes")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>

            <div class="col-md-2">
                <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarComissao()">Adicionar</button>
            </div>
            </div>

            <div class="form-group" style="margin-top: 10px;">
            <h4>Comissões Selecionadas</h4>
            <ul id="listaComissoes"></ul>
            </div>

            <!-- Mandatos Anteriores -->
            <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Mandatos Anteriores
                </div>
                </div>            

                <div class="row">
                <!-- Select Já Teve Mandatos Anteriores -->
                <div class="col-md-5">
                    <label for="mandatosAnteriores">Já Teve Mandatos Anteriores?</label>
                    <select class="form-control" id="mandatosAnteriores" name="mandatosAnteriores" onchange="toggleMandatosAnteriores(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                    </select>
                </div>

                <!-- Input e botão na mesma linha, com espaço entre eles -->
                <div class="col-md-6" id="mostraMandatosAnteriores" style="display: none;">
                    <div class="col-md-5">
                      <label for="AnoInicioMandato">Ano Início</label>
                      <input type="text" class="form-control" id="AnoInicioMandato" name="AnoInicioMandato">
                    </div>
                    <div class="col-md-5">
                      <label for="AnoFimMandato">Ano Fim</label>
                      <input type="text" class="form-control" id="AnoFimMandato" name="AnoFimMandato">
                    </div>
                    <div class="col-md-2">
                      <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarMandato()">Adicionar</button>
                    </div>
                    </div>
                </div>
                </div>

                <div class="form-group" style="margin-top: 10px;">
                <h4>Mandatos Anteriores</h4>
                <ul id="listaMandatos"></ul>
                </div>
            </div>
            </div>
          <!-- Botão Salvar -->
        <div class="box-footer">
            <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
            <button type="submit" class="form-btn btn btn-primary pull-right" onclick="cadastrar()"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
        </div>
      </div>
    </form>
    </div>
  </section>
</div>

<script>
// Funções JavaScript para alternar exibição de seções e adicionar itens

function toggleMesaDiretora(value) {
    if (value === "1") {
        document.getElementById("mostraMesaDiretora").style.display = "block";
    } else {
        document.getElementById("mostraMesaDiretora").style.display = "none";
    }
}

  function toggleComissoes(value) {
    const anoLegDiv = document.getElementById("anoLegDiv");
    const mostraComissoes = document.getElementById("mostraComissoes");

    if (value === "sim") {
      anoLegDiv.style.display = "block"; // Exibe o campo Ano Legislativo
      mostraComissoes.style.display = "block"; // Exibe os outros campos
    } else {
      anoLegDiv.style.display = "none"; // Oculta o campo Ano Legislativo
      mostraComissoes.style.display = "none"; // Oculta os outros campos
      resetCampos(); // Reseta os valores dos campos
    }
  }

  function resetCampos() {
    document.getElementById("AnoLegComissao").selectedIndex = 0;
    document.getElementById("nomeComissao").selectedIndex = 0;
    document.getElementById("funcaoComissao").selectedIndex = 0;
  }

  function adicionarComissao() {
    
    //const AnoLegComissao_Texo = selectElement.options[document.getElementById("AnoLegComissao").selectedIndex].text; //testo pra visulização
    var selectElement = document.getElementById("nomeComissao");
    const nomeComissao_Texo = selectElement.options[selectElement.selectedIndex].text; // texto visualização
    selectElement = document.getElementById("funcaoComissao");
    const funcaoComissao_Texo = selectElement.options[selectElement.selectedIndex].text; // texto visualização

    if (nomeComissao_Texo && funcaoComissao_Texo) {
      const listaComissoes = document.getElementById("listaComissoes");
      const li = document.createElement("li");
      li.textContent = `${nomeComissao_Texo} - ${funcaoComissao_Texo}`;
      listaComissoes.appendChild(li);
    }
    
   
    // LISTA PARA ENVIAR PRA BASE DE DADOS 
    const AnoLegComissao = document.getElementById("AnoLegComissao").value; //IDS
    const nomeComissao = document.getElementById("nomeComissao").value; // IDS
    const funcaoComissao = document.getElementById("funcaoComissao").value; // IDS
    
    const currentComissoesLegislacao = document.getElementById("listaComissoesLegislacao").value;
    const newComissoesLegislacao = `${nomeComissao}-${funcaoComissao}-${AnoLegComissao}`;
    document.getElementById("listaComissoesLegislacao").value = currentComissoesLegislacao ? currentComissoesLegislacao + "," + newComissoesLegislacao : newComissoesLegislacao;



     // Limpar campos após adicionar
        document.getElementById("nomeComissao").value = '';
        document.getElementById("funcaoComissao").value = '';
  }

function toggleMandatosAnteriores(value) {
    if (value === "sim") {
        document.getElementById("mostraMandatosAnteriores").style.display = "block";
    } else {
        document.getElementById("mostraMandatosAnteriores").style.display = "none";
    }
}

function adicionarMandato() {
    const anoInicioMandato = document.getElementById("AnoInicioMandato").value;
    const anoFimMandato = document.getElementById("AnoFimMandato").value;

    if (anoInicioMandato && anoFimMandato) {
        const listaMandatos = document.getElementById("listaMandatos");
        const li = document.createElement("li");
        li.textContent = `Mandato: ${anoInicioMandato} - ${anoFimMandato}`;
        listaMandatos.appendChild(li);
        
        // Adicionar os mandatos ao campo hidden para enviar no formulário
            const currentMandatos = document.getElementById("ListaMandatosAnteriores").value;
            const newMandato = `${anoInicioMandato}-${anoFimMandato}`;
            document.getElementById("ListaMandatosAnteriores").value = currentMandatos ? currentMandatos + "," + newMandato : newMandato;

        // Limpar campos após adicionar
        document.getElementById("AnoInicioMandato").value = '';
        document.getElementById("AnoFimMandato").value = '';
    } else {
        alert("Por favor, preencha ambos os campos de Ano Início e Ano Fim.");
    }
}
</script>
<!--#include file="footer.asp"-->