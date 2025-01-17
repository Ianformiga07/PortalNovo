<!--#include file="base.asp"-->

<%
IdVereador = request("IdVereador")
IdMandato = request("id_mandatoleg")
erroValidacao = "" ' Variável para armazenar o erro

IF REQUEST("Operacao") = 1 THEN  ' CADASTRAR/ALTERAR
  call abreConexao

  id_funcoes = "NULL"
  
  IF REQUEST.FORM("mesaDiretora") = 1 THEN ' EXISTE CARGO
    id_funcoes = "'" & REQUEST.FORM("funcaoMesa") & "'"
    
    ' Verifica se já existe alguém com a mesma função na mesa diretora
    sqlVerificaFuncao = "SELECT COUNT(*) AS qtd FROM cam_legislativo WHERE id_funcoes = " & id_funcoes & " AND mesaDiretora = 1"
    set rs_Verifica = conn.execute(sqlVerificaFuncao)

    if not rs_Verifica.EOF and rs_Verifica("qtd") > 0 then
        ' Define a mensagem de erro para funções exclusivas
        select case REQUEST.FORM("funcaoMesa")
            case "1": erroValidacao = "Já existe um Presidente cadastrado na mesa diretora."
            case "2": erroValidacao = "Já existe um Vice-Presidente cadastrado na mesa diretora."
            case "3": erroValidacao = "Já existe um 1º Secretário cadastrado na mesa diretora."
            case "4": erroValidacao = "Já existe um 2º Secretário cadastrado na mesa diretora."
        end select
    end if

    rs_Verifica.Close
  END IF 

  IF erroValidacao <> "" THEN
    ' Caso haja erro, exibe a mensagem e interrompe a operação
    Response.Write("<script>alert('" & erroValidacao & "'); history.back();</script>")
    Response.End
  ELSE
    ' Atualiza ou insere os dados na tabela cam_legislativo
    SQL = "SELECT 1 AS EXISTE FROM cam_legislativo WHERE Id_Vereador = '" & REQUEST.FORM("IdVereador") & "' AND id_mandatoleg = '" & REQUEST.FORM("id_mandatoleg") & "'"
    SET RS = CONN.EXECUTE(SQL)

    IF RS.EOF THEN
      SQL = "INSERT INTO cam_legislativo(Id_Vereador, id_mandatoleg, MesaDiretora, id_funcoes, statusLeg) VALUES('" & REQUEST.FORM("IdVereador") & "', '" & REQUEST.FORM("id_mandatoleg") & "', '" & REQUEST.FORM("mesaDiretora") & "', " & id_funcoes & ", 1)"
    ELSE
      SQL = "UPDATE cam_legislativo SET MesaDiretora = '" & REQUEST.FORM("mesaDiretora") & "', id_funcoes = " & id_funcoes & " WHERE Id_Vereador = '" & REQUEST.FORM("IdVereador") & "' AND id_mandatoleg = '" & REQUEST.FORM("id_mandatoleg") & "'"
    END IF 


    CONN.EXECUTE(SQL)

    ' EXCLUIR COMISSÕES ANTERIORES E INSERIR NOVAS
    SQL = "DELETE FROM cam_comissao WHERE Id_Vereador = '" & REQUEST.FORM("IdVereador") & "' AND id_mandatoleg = '" & REQUEST.FORM("id_mandatoleg") & "'"
    CONN.EXECUTE(SQL)

    ARRAYLISACOMISSAO = SPLIT(REQUEST.FORM("listaComissoesLegislacao"), "<==>")
    
    FOR I = 0 TO UBOUND(ARRAYLISACOMISSAO)
      ARRAYITEMCOMISSAO = SPLIT(ARRAYLISACOMISSAO(I), "-")
      SQL = "INSERT INTO cam_comissao(Id_Vereador, id_funcoes, id_mandatoleg, id_tipoComissao, statusComissao) VALUES('" & REQUEST.FORM("IdVereador") & "', '" & ARRAYITEMCOMISSAO(1) & "', '" & REQUEST.FORM("id_mandatoleg") & "', '" & ARRAYITEMCOMISSAO(0) & "', 1)"
      CONN.EXECUTE(SQL)
    NEXT

    ' EXCLUIR ANOS ANTERIORES E INSERIR NOVOS
    SQL = "DELETE FROM cam_mandatoAnt WHERE Id_Vereador = '" & REQUEST.FORM("IdVereador") & "' AND id_mandatoleg = '" & REQUEST.FORM("id_mandatoleg") & "'"
    CONN.EXECUTE(SQL)

    ARRAYLISTAMANDATOSANTERIORES = SPLIT(REQUEST.FORM("ListaMandatosAnteriores"), "<==>")
    
    FOR I = 0 TO UBOUND(ARRAYLISTAMANDATOSANTERIORES)
      ARRAYITEMMANDATOSANTERIORES = SPLIT(ARRAYLISTAMANDATOSANTERIORES(I), "-")
      SQL = "INSERT INTO cam_mandatoAnt(Id_Vereador, id_mandatoleg, anoInicio, anoFim) VALUES('" & REQUEST.FORM("IdVereador") & "', '" & REQUEST.FORM("id_mandatoleg") & "', '" & ARRAYITEMMANDATOSANTERIORES(0) & "', '" & ARRAYITEMMANDATOSANTERIORES(1) & "')"
      CONN.EXECUTE(SQL)
    NEXT

  END IF
END IF

%>

    <script>

      function cadastrar(){      
   
      var form = document.forms["frmLegislacao"];
      if(form.mesaDiretora.value == "999")
      {
        alert("obrigatorio selecionar se faz parte da mesa diretora!");
        return false;
      }
      form.Operacao.value = "1";
      form.action = "cad-vereador.asp";
      form.submit();

      }

      function consultar(){      
        var form = document.forms["frmLegislacao"];
        form.Operacao.value = "2";
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
      <input type="hidden" name="IdVereador" id="IdVereador" value = "<%=Request("IdVereador")%>">
      <input type="hidden" name="id_mandatoleg" id="id_mandatoleg" value = "<%=Request("id_mandatoleg")%>">
      <input type="hidden" name="Operacao" id="Operacao">
      <input type="hidden" name="listaComissoesLegislacao" id="listaComissoesLegislacao">
      <input type="hidden" name="ListaMandatosAnteriores" id="ListaMandatosAnteriores">
    <%IF REQUEST("Atualizar") = 1 THEN%>
          <script>
             consultar();
          </script>
    <%ELSE%>
     
      
    
      <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto Vereador
                </div>
            </div>
            <%
            call abreConexao
            sql5 = "SELECT   cam_vereador.Id_Vereador, cam_vereador.fotoVereador FROM cam_vereador INNER JOIN  cam_servidores ON cam_vereador.id_servidor = cam_servidores.id_servidor WHERE (cam_vereador.Id_Vereador = '"&IdVereador&"')"
            set rsPerfil = conn.execute(sql5)
            %>
            <div class="box-body" >
                <% If rsPerfil("fotoVereador") <> "" Then %>
                <img class="profile-user-img img-responsive preview-upVereador" src="upVereador/<%= rsPerfil("fotoVereador") %>" style="height: 200px; width: 200px;">
                <% Else %>
                <img class="profile-user-img img-responsive preview-upVereador" src="images/avatar.jpg" style="height: 200px; width: 200px;">
                <% End If %>
            <% call fechaConexao %>
            </div>
          </div>
      </div>
     
       <%
         call abreConexao
         sql = "SELECT   cam_servidores.CPF, cam_servidores.NomeCompleto, (SELECT   mandatos FROM      cam_mandatosLeg   WHERE    (id_mandatosLeg = '"&IdMandato&"')) AS MandatosLeg  FROM   cam_vereador INNER JOIN  cam_servidores ON cam_vereador.id_servidor = cam_servidores.id_servidor  WHERE        (cam_vereador.Id_Vereador = '"&IdVereador&"')"
        
         set rs = conn.execute(sql)
         IF not rs.eof THEN
            CPFServidor = rs("CPF")
            NomeServidor = rs("NomeCompleto")
            MandatosLeg = rs("MandatosLeg")
         END IF 
         call fechaConexao
       %>
      <div class="col-md-9">
   
          <!-- Dados Pessoais -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="row">
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>CPF:</label>
                      <span id="cpfLabel" style="font-weight: normal;"><%=CPFServidor%></span>
                      </div>
                  </div>
                  <div class="col-md-6">
                      <div class="form-group">
                      <label>Nome:</label>
                      <span id="nomeLabel" style="font-weight: normal;"><%=Ucase(NomeServidor)%></span>
                      </div>
                  </div>
                  <div class="col-md-3">
                      <div class="form-group">
                      <label>Ano Legislativo:</label>
                      <span id="AnoLeg" style="font-weight: normal;"><%=MandatosLeg%></span>
                      </div>
                  </div>
                </div>
            </div>
          </div>
           <%
              call abreConexao
               sql = "SELECT  MesaDiretora, id_funcoes FROM    cam_legislativo where  id_vereador = '" & request("IdVereador") & "' AND id_mandatoleg = '" & request("id_mandatoleg") & "'"
               set rs = conn.execute(sql)
               existeCadastro = 0
               if not rs.eof then
                 existeCadastro = 1
                 MesaDiretora = rs("MesaDiretora")
                 id_funcoes = rs("id_funcoes")
               end if 
              call fechaConexao
           %>
           <!-- Legislativo -->
          <div class="box box-primary">
            <div class="box-body">
              <div class="row">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 15px;">
                    <i class="fa fa-caret-right"></i> Mesa Diretora
                    </div>
                <div class="col-md-6">
                  <label for="mesaDiretora">Faz Parte da Mesa Diretora?</label>
                  <select class="form-control" id="mesaDiretora" name="mesaDiretora" onchange="toggleMesaDiretora(this.value)">
                    <option value="999"> -- Selecionar --</option>
                    <option value="1" <%if MesaDiretora = true then%> selected <%end if%>>Sim</option>
                    <option value="0" <%if MesaDiretora = false then%> selected <%end if%>>Não</option>
                  </select>
                </div>
            <div id="mostraMesaDiretora" style="<%if existeCadastro = 1 then %><%else%>display: block;<%end if%>">
              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 2, 3, 4)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-6">
                  <label for="funcaoMesa">Função</label>
                  <select class="form-control" id="funcaoMesa" name="funcaoMesa">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option  value="<%=rs_Mandato("id_funcoes")%>" <%if id_funcoes = rs_Mandato("id_funcoes") then%> selected <%end if%>><%=rs_Mandato("desc_funcoes")%></option>
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
              <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 15px;">
              <i class="fa fa-caret-right"></i> Comissões
              </div>
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
              sql = "SELECT id_tipoComissao, DescComissao FROM cam_tipoComissao"
              set rs_tipoComissao = conn.execute(sql)
              %>
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
            </div>

            <div class="row" id="mostraComissoes" style="display: none; margin-top: 10px;">
              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 5, 6)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-10">
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
            <button type="button" class="btn btn-block btn-success" style="margin-top: 25px;" onclick="adicionarComissao()"><i class="fa fa-fw fa-plus"></i>
Adicionar</button>
            </div>
            </div>

            <div class="form-group" style="margin-top: 10px;">
              <!--<table class="table table-bordered">
                <tr>
                  <th>Comissão</th>
                  <th>Função</th>
                  <th style="width: 40px">Ação</th>
                </tr>-->
                <div id="ListaComissao"></div>
                <%
                  ' Abertura da conexão com o banco de dados
                    Call abreConexao

                   ' Consulta SQL para buscar os dados
                    sql = "SELECT id_tipoComissao, (SELECT DescComissao FROM cam_tipoComissao WHERE id_tipoComissao = cam_comissao.id_tipoComissao) AS NomeComissao, id_funcoes, (SELECT desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes = cam_comissao.id_funcoes) AS NomeFuncao FROM cam_comissao WHERE id_vereador = '" & request("IdVereador") & "' AND id_mandatoleg = '" & request("id_mandatoleg") & "' AND statusComissao = 1"
                    set rs = conn.execute(sql)
                    EXISTEDADOSCOMISSAO = 0
                    IF NOT RS.EOF THEN
                       EXISTEDADOSCOMISSAO  = 1 
                      ' Inicializando os arrays que irão armazenar os dados
                      Dim comissoesArray, comissoesIdArray
                      comissoesArray = ""
                      comissoesIdArray = ""

                      ' Preenchendo os arrays com os dados da consulta
                      Do While Not rs.EOF
                       ' Adiciona o nome e função da comissão
                        comissoesArray = comissoesArray & "{" & "'nomeComissao': '" & rs("NomeComissao") & "'," & "'funcaoComissao': '" & rs("NomeFuncao") & "'" & "},"
                        ' Adiciona as IDs
                        comissoesIdArray = comissoesIdArray & "{" & "'idnomeComissao': '" & rs("id_tipoComissao") & "'," & "'idfuncaoComissao': '" & rs("id_funcoes") & "'" & "},"
                      rs.MoveNext
                      Loop

                     ' Remove a última vírgula de cada lista
                      If Len(comissoesArray) > 1 Then
                        comissoesArray = Left(comissoesArray, Len(comissoesArray) - 1)
                      End If
                      If Len(comissoesIdArray) > 1 Then
                          comissoesIdArray = Left(comissoesIdArray, Len(comissoesIdArray) - 1)
                      End If

                   END IF 
                   call fechaConexao
                   %>


                <script>
                       <%IF EXISTEDADOSCOMISSAO  = 1 THEN%>
                        const comissoes = [<%= comissoesArray %>];
                        const comissoesId = [<%= comissoesIdArray %>];
                            let listaComissoes_banco = comissoesId.map(m => m.idnomeComissao + " - " + m.idfuncaoComissao).join("<==>");
                            document.getElementById('listaComissoesLegislacao').value = listaComissoes_banco;
                            AtulizarComissao();
                       <%ELSE%>
                       const comissoes = [];
                       const comissoesId = [];
                       <%END IF%>
                       



                       function adicionarComissao()
                       {
                         //id para ir pro banco de dados 
                         const idnomeComissao = document.getElementById('nomeComissao').value.trim();
                         const idfuncaoComissao = document.getElementById('funcaoComissao').value.trim();
                         // visualizar
                         const ElementNomeComissao = document.getElementById('nomeComissao');
                         const nomeComissao = ElementNomeComissao.options[ElementNomeComissao.selectedIndex].text;
                         const ElementFuncaoComissao = document.getElementById('funcaoComissao');
                         const funcaoComissao = ElementFuncaoComissao.options[ElementFuncaoComissao.selectedIndex].text;
                         
                          // Verifica se os campos estão preenchidos
                         if(!idnomeComissao || !idfuncaoComissao)
                         {
                          alert("obrigatorio selecionar Nome Comissao e Função da Comissao!");
                          return false;
                         }
                         
                          // Adiciona o novo usuário à lista
                          comissoes.push({ nomeComissao, funcaoComissao });
                          comissoesId.push({ idnomeComissao, idfuncaoComissao });
                          
                          let listaComissoes = comissoesId.map(m => m.idnomeComissao + " - " + m.idfuncaoComissao).join("<==>");
                          document.getElementById('listaComissoesLegislacao').value = listaComissoes;
                           // Atualiza a exibição da lista
                          AtulizarComissao();

                          document.getElementById('nomeComissao').value = '';
                          document.getElementById('funcaoComissao').value = '';
                       }

                       function AtulizarComissao() {
                             const listaComissao = document.getElementById('ListaComissao');
                             listaComissao.innerHTML = ''; // Limpa a exibição anterior

                              // Monta a tabela
                              let tabela = '<table class="table table-bordered"><tr><th>Nome da Comissão</th><th>Função</th><th style="width: 40px">Ação</th></tr>';
                              for (let i = 0; i < comissoes.length; i++) {
                                  const comissao = comissoes[i];
                                  tabela += `
                                              <tr>
                                                    <td>${comissao.nomeComissao}</td>
                                                    <td>${comissao.funcaoComissao}</td>
                                                    <td>
                                                        <button type="button" onClick="confirmarExclusao(${i});" class="btn btn-danger btn-xs">
                                                        <i class="fa fa-trash"></i> Excluir</button>
                                                    </td>
                                              </tr>`;
                                }
                              tabela += '</table>';

                              // Atualiza o HTML
                          listaComissao.innerHTML = tabela;
                        }

                        function confirmarExclusao(index) {
                          const confirmacao = confirm("Tem certeza de que deseja excluir esta comissão?");
                          if (confirmacao) {
                                // Remove o item do array
                              comissoes.splice(index, 1);
                              comissoesId.splice(index, 1);
                              let listaComissoes = comissoesId.map(m => m.idnomeComissao + " - " + m.idfuncaoComissao).join("<==>");
                              document.getElementById('listaComissoesLegislacao').value = listaComissoes;
                              // Atualiza a exibição da tabela
                             AtulizarComissao();
                           }
                         }


                        
                          </script>
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
               
               <div id="ListaMandatos"></div>
               
                <%
                  ' Abertura da conexão com o banco de dados
                    Call abreConexao

                   ' Consulta SQL para buscar os dados
                    sql = "SELECT anoInicio, anoFim  FROM  cam_mandatoAnt  WHERE id_vereador = '" & request("IdVereador") & "' AND id_mandatoleg = '" & request("id_mandatoleg") & "'"
                    set rs = conn.execute(sql)
                    EXISTEDADOSMANDATOS = 0
                    IF NOT RS.EOF THEN
                       EXISTEDADOSMANDATOS = 1 
                      ' Inicializando os arrays que irão armazenar os dados
                      Dim MandatosArray
                      MandatosArray = ""
                      

                      ' Preenchendo os arrays com os dados da consulta
                      Do While Not rs.EOF
                       ' Adiciona o nome e função da comissão
                        MandatosArray = MandatosArray & "{" & "'AnoInicioMandato': '" & rs("anoInicio") & "'," & "'AnoFimMandato': '" & rs("anoFim") & "'" & "},"
                        rs.MoveNext
                      Loop

                     ' Remove a última vírgula de cada lista
                      If Len(MandatosArray) > 1 Then
                        MandatosArray = Left(MandatosArray, Len(MandatosArray) - 1)
                      End If
                   END IF 
                   call fechaConexao
                   %>
                <script>
                       <%IF EXISTEDADOSMANDATOS = 1 THEN%>
                       const Mandatos = [<%=MandatosArray%>];
                            let listaMandatos_banco = Mandatos.map(m => m.AnoInicioMandato + " - " + m.AnoFimMandato).join("<==>");
                            document.getElementById('ListaMandatosAnteriores').value = listaMandatos_banco;
                            AtulizarMandatos();
                       <%ELSE%>
                       const Mandatos = [];
                       <%END IF%>
                       function adicionarMandato()
                       {
                         //id para ir pro banco de dados 
                         const AnoInicioMandato = document.getElementById('AnoInicioMandato').value.trim();
                         const AnoFimMandato = document.getElementById('AnoFimMandato').value.trim();
                         
                         
                         
                          // Verifica se os campos estão preenchidos
                         if(!AnoInicioMandato || !AnoInicioMandato)
                         {
                          alert("obrigatorio digitar Ano Inicial e Final!");
                          return false;
                         }
                         
                          // Adiciona o novo usuário à lista
                          Mandatos.push({ AnoInicioMandato, AnoFimMandato });
                          
                          // campo Hindem que enviar para a base de dados 
                          //document.getElementById('ListaMandatosAnteriores').value = Mandatos;
                          // Gera uma string separada por quebras de linha (ou qualquer outro delimitador que você preferir)
                          let listaMandatos = Mandatos.map(m => m.AnoInicioMandato + " - " + m.AnoFimMandato).join("<==>");
                          document.getElementById('ListaMandatosAnteriores').value = listaMandatos;

                           // Atualiza a exibição da lista
                          AtulizarMandatos();

                          document.getElementById('AnoInicioMandato').value = '';
                          document.getElementById('AnoFimMandato').value = '';
                       }

                       function AtulizarMandatos() {
                             const listaMandatos = document.getElementById('ListaMandatos');
                             listaMandatos.innerHTML = ''; // Limpa a exibição anterior

                              // Monta a tabela
                              let tabela = '<table class="table table-bordered"><tr><th>#</th><th>Mandatos</th><th style="width: 20px">Ação</th></tr>';
                              for (let i = 0; i < Mandatos.length; i++) {
                                  const mandato = Mandatos[i];
                                  tabela += `
                                              <tr>
                                                    <td>${i+1}°</td>
                                                    <td>${mandato.AnoInicioMandato} - ${mandato.AnoFimMandato}</td>
                                                    <td>
                                                        <button type="button" onClick="confirmarExclusaoMandato(${i});" class="btn btn-danger btn-xs">
                                                        <i class="fa fa-trash"></i> Excluir</button>
                                                    </td>
                                              </tr>`;
                                }
                              tabela += '</table>';

                              // Atualiza o HTML
                          listaMandatos.innerHTML = tabela;
                        }

                        function confirmarExclusaoMandato(index) {
                          const confirmacao = confirm("Tem certeza de que deseja excluir este mandato?");
                          if (confirmacao) {
                                // Remove o item do array
                              Mandatos.splice(index, 1);
                              // Atualiza o campo oculto com a nova lista de mandatos
                              // Gerando uma nova string com os mandatos restantes
                               let listaMandatos = Mandatos.map(m => m.AnoInicioMandato + " - " + m.AnoFimMandato).join("<==>");
                               document.getElementById('ListaMandatosAnteriores').value = listaMandatos;
                              // Atualiza a exibição da tabela
                             AtulizarMandatos();
                           }
                         }

                </script>

             </div>


            </div>
            </div>
          <!-- Botão Salvar -->
        <div class="box-footer">
            <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
            <button type="submit" class="form-btn btn btn-primary pull-right" onclick="cadastrar()"><i class="fa fa-fw fa-check"></i> <%IF existeCadastro = 1 THEN%>Alterar <%ELSE%>Cadastrar<%END IF%></button>
        </div>
      </div>
      <%END IF 'DO ATUALIZAR NO INICIO DO FORMULARIO%>
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

  

function toggleMandatosAnteriores(value) {
    if (value === "sim") {
        document.getElementById("mostraMandatosAnteriores").style.display = "block";
    } else {
        document.getElementById("mostraMandatosAnteriores").style.display = "none";
    }
}


</script>
<!--#include file="footer.asp"-->