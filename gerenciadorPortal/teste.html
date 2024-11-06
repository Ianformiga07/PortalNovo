<%@Language="VBScript" CodePage=65001 %>

<!DOCTYPE html>
 <%
  Session("datatable") = 0
  uvl = REQUEST("uvlSelect")
  programa = REQUEST.FORM("ProgramaSelect")
  idPalestra = Request("idPalestra")
   
   'response.write REQUEST("uvlSelect")
   'response.end

call abreConexao
sql = "SELECT id_ConPalestra, Con_Programa.id_Programa, Programas, Con_Atividade.id_Atividade, Atividades, Con_Publico.id_Publico, Publico, Tema, frequencia, Qtd_Publico, idUsuarioCad, DataCad, idUsuarioAlt, DataAlt, anexo, DataPalestra, statusPalestra, idUvl, (SELECT Nome FROM SGCS_MunicipioLotacao WHERE (Id = idUvl)) as NomeMunicipio FROM Con_ConPalestra inner join Con_Programa on Con_Programa.id_Programa = Con_ConPalestra.id_Programa inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade inner join Con_Publico on Con_Publico.id_Publico = Con_ConPalestra.id_Publico WHERE idUvl = '"&uvl&"' and Id_ConPalestra = '"&idPalestra&"'"
'response.write sql
'response.end
set rs = conn.execute(sql)
if not rs.eof then
idPalestra = rs("id_ConPalestra")
id_Programa = rs("id_Programa")
Programas = rs("Programas")
id_Atividade = rs("id_Atividade")
Atividades = rs("Atividades")
id_Publico = rs("id_Publico")
Publico = rs("Publico")
Tema = rs("Tema")
frequencia = rs("frequencia")
Qtd_Publico = rs("Qtd_Publico")
idUsuarioCad = rs("idUsuarioCad")
DataCad = rs("DataCad")
idUsuarioAlt = rs("idUsuarioAlt") 
DataAlt = rs("DataAlt") 
anexo = rs("anexo") 
DataPalestra = rs("DataPalestra") 
statusPalestra = rs("statusPalestra") 
idUvl = rs("idUvl")
NomeMunicipio = rs("NomeMunicipio")
existe = 1
end if
call fechaConexao
%>       
<!--#include file ="base.asp"-->

<style type="text/css">
.img-container{
   overflow: hidden;
}

.img-container img{
   width: 100%;
   height: 100%;
   -webkit-transition: -webkit-transform .5s ease;
   transition: transform .5s ease;
}

.img-container:hover img{
   -webkit-transform: scale(1.8);
   transform: scale(1.8);
}

</style>




<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.all.min.js"></script>
<script src="js/validacao.js"></script>
<script>
    function cadastrar(){

        if (validacao() == false) {
            return false;
        }
        //alert("oii");
        var form = document.forms["Cad_Palestra"];
        form.Operacao.value = 2;
        form.action = "crud_Palestra.asp";
        form.setAttribute("enctype", "multipart/form-data");
        form.submit();
    }



function Ver_alterar(idPalestra)
{
    var form = document.forms["Cad_Palestra"];
    form.idPalestra.value = idPalestra;
    form.action = "Ins_Palestras.asp";
    form.submit();
    
}
function alterar(idPalestra)
{
        if (validacaoAlt() == false) {
        return false;
        }

    var form = document.forms["Cad_Palestra"];
    form.idPalestra.value = idPalestra;
    form.Operacao.value = 4;
    form.action = "crud_Palestra.asp?id="+idPalestra+"&Operacao="+4;
    form.setAttribute("enctype", "multipart/form-data");
    form.submit();
    
}

    function mascararData(input) {
    // Remove caracteres não numéricos
        input.value = input.value.replace(/\D/g, '');

        // Verifica o comprimento do valor e adiciona as barras de acordo com a posição
        if (input.value.length >= 2) {
            input.value = input.value.substring(0, 2) + '/' + input.value.substring(2);
        }
        if (input.value.length >= 5) {
            input.value = input.value.substring(0, 5) + '/' + input.value.substring(5);
        }

        // Limita o valor a 10 caracteres (dd/mm/yyyy)
        if (input.value.length > 10) {
            input.value = input.value.substring(0, 10);
        }
    }

function mensagem(resp){
if(resp == 1){
	Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Cadastrado realizado com Sucesso!',
        showConfirmButton: false,
        timer: 2000
      });
      return false;
}
if(resp == 2){
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Alteração realizada com Sucesso!',
        showConfirmButton: false,
        timer: 2000
    });
    return false; 
}
}

function atualizar(uvlSelect)
{
    var form = document.forms["Cad_Palestra"];
    form.Operacao.value = 3;
    form.Resp.value = 1;
    form.uvlSelect.value = uvlSelect;
    form.action = "Ins_Palestras.asp";
    form.submit();  
}
function atualizarAlt(uvlSelect)
{
    var form = document.forms["Cad_Palestra"];
    form.Operacao.value = 5;
    form.Resp.value = 2;
    form.uvlSelect.value = uvlSelect;
    form.action = "Ins_Palestras.asp";
    form.submit();  
}

function BuscarUVL()
{
var form = document.forms["Cad_Palestra"];
form.Operacao.value = 1;
form.action = "Ins_Palestras.asp";
form.submit();
}

</script>
<%if request("Resp") = 1 or request("Resp") = 2 then%>
<script>
  mensagem(<%=request("Resp")%>);
</script>
<%end if%>
<div class="col-md-12">
            <a href="iniPalestra.asp" onclick="#" class="btn btn-link mt-2">
                <img src="img/Voltar.png" alt="Voltar" style="height: 30px; width: 30px;">
            </a>  
<form method="POST" id="Cad_Palestra"  name="Cad_Palestra">
     <input type="hidden" name="Operacao">
     <%IF REQUEST("Crud") = 1 THEN%>
        <input type="hidden" name="Resp">
        <input type="hidden" name="uvlSelect">
        <script>
           atualizar(<%=request("uvlSelect")%>);
        </script>
     <%END IF%>

    <%IF REQUEST("Crud") = 2 THEN%>
        <input type="hidden" name="Resp">
        <input type="hidden" name="uvlSelect">
        <script>
           atualizarAlt(<%=request("uvlSelect")%>);
        </script>
     <%END IF%>
     <input type="hidden" name="idPalestra">
     
            <div class="card overflow-hidden" >
                <div class="card">
                    <div class="card-body">
                      <%IF Resposta <> "" THEN%>
                        <div class="alert alert-success alert-dismissible fade show" role="alert" align="center">
                            <%=Resposta%>
                        </div>
                       <%END IF%>
                        <h5 class="card-title text-center">Cadastro de Palestras</h5>

                        <%
                        call abreConexao 
                        sql = "SELECT * FROM SGCS_MunicipioLotacao ORDER BY Nome"
                        set rs2 = conn.execute(sql) 
                        %> 
                        <div class="row mb-3">
                            <div class="col-sm-12">
                                <div class="flex-container">
                                <label class="col-form-label">Município: </label>&nbsp
                                    <select class="form-select form-control" id="uvlSelect" name="uvlSelect" <%if existe <> 1 then%>onchange="BuscarUVL();"<%end if%>>
                                        <option value ="">-- Selecione --</option>
                                        <%do while not rs2.eof%>
                                        <option <%if  rtrim(uvl) = rtrim(rs2("id")) then response.write("selected") end if%> value="<%=rs2("id")%>"><%=rs2("Nome")%></option>
                                        <% rs2.movenext 
                                        loop 
                                        call fechaConexao
                                        %>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-sm-3">
                            <%
                                call abreConexao 
                                sql = "SELECT * FROM Con_Programa ORDER BY Programas"
                                set rs1 = conn.execute(sql)   
                            %>
            
                                <div class="flex-container">
                                <label class="col-form-label">Programas: </label>&nbsp
                                    <select class="form-select form-control" id="ProgramaSelect" name="ProgramaSelect">
                                        <option value="">-- Selecione --</option>
                                        <%do while not rs1.eof%>
                                        <option <%if  rtrim(rs1("id_Programa")) = rtrim(id_Programa) then response.write("selected") end if%> value="<%=rs1("id_Programa")%>"><%=rs1("Programas")%></option>

                                        <% rs1.movenext 
                                        loop 
                                        call fechaConexao
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="col-sm-9">
                                <div class="flex-container" >
                                <label class="col-form-label ">Tema: </label>&nbsp
                                    <input type="text" id="txtTema" class="form-control" name="txtTema" style="text-transform: uppercase;" value="<%=Tema%>">
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-sm-6">
                            <%
                                call abreConexao 
                                sql = "SELECT * FROM Con_Atividade"
                                set rs3 = conn.execute(sql)   
                            %>
            
                                <div class="flex-container" >
                                <label class="col-form-label">Atividade: </label>&nbsp
                                    <select class="form-select form-control" id="AtividadeSelect" name="AtividadeSelect">
                                        <option value="">-- Selecione --</option>
                                        <%do while not rs3.eof%>
                                        <option <%if rtrim(rs3("id_Atividade")) = rtrim(id_Atividade)  then response.write("selected") end if%> value="<%=rs3("id_Atividade")%>"><%=rs3("Atividades")%></option>
                                        <%rs3.movenext 
                                        loop 
                                        call fechaConexao
                                        %>
                                    </select>
                                </div>
                            </div>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM Con_Publico"
                        set rs4 = conn.execute(sql) 
                        %>                           
                            <div class="col-sm-6">
                                <div class="flex-container" >
                                <label class="col-form-label ">Publico: </label>&nbsp
                                    <select class="form-select form-control" id="PublicoSelect" name="PublicoSelect">
                                        <option value ="">-- Selecione --</option>
                                        <%do while not rs4.eof%>
                                        <option <%if rtrim(rs4("id_Publico")) = rtrim(id_Publico) then response.write("selected") end if%> value="<%=rs4("id_Publico")%>"><%=rs4("Publico")%></option>
                                        <% rs4.movenext 
                                        loop 
                                        call fechaConexao
                                        %>    
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-sm-6">
                                <div class="flex-container" >
                                <label class="col-form-label ">Data da Palestra: </label>&nbsp
                                <input type="text" id="txtDataPalestra" class="form-control" name="txtDataPalestra" value="<%=DataPalestra%>" onkeyup="mascararData(this);" onchange="validarDataPalestra();">
                                </div>
                            </div>
                            <script>

                                function validarDataPalestra() {
                                    var inputData = document.getElementById('txtDataPalestra').value;

                                    var partesData = inputData.split('/');
                                    var dia = parseInt(partesData[0], 10);
                                    var mes = parseInt(partesData[1], 10) - 1; // Janeiro é 0, Fevereiro é 1, etc.
                                    var ano = parseInt(partesData[2], 10);
                                    var data = new Date(ano, mes, dia);

                                    if (data.getDate() !== dia || data.getMonth() !== mes || data.getFullYear() !== ano) {
                                            Swal.fire({
                                                position: 'top-end',
                                                icon: 'error',
                                                title: 'Por favor, a Data Inserida é Invalida.',
                                                showConfirmButton: false,
                                                timer: 2000
                                            });
                                        document.getElementById("txtDataPalestra").value = "";
                                        document.getElementById("txtDataPalestra").focus();
                                        return false; 
                                    }

                                    return true;
                                }
                            </script>

                            <div class="col-sm-6">
                                <div class="flex-container" >
                                <label class="col-form-label ">Público Total: </label>&nbsp
                                    <input type="number" id="QtdPublico" class="form-control" name="QtdPublico" maxlength="2" value="<%=Qtd_Publico%>" oninput="validarNumero(this)">
                                </div>
                            </div>
                        </div>
                        <script>
                            function validarNumero(input) {
                                // Verifica se o valor inserido é menor que zero
                                if (input.value < 0) {
                                    // Se for menor que zero, define o valor como zero
                                    input.value = 0;
                                }
                            }
                        </script>
                        <%
                        call abreConexao 
                        sql = "SELECT * FROM Con_ConPalestra Where  id_ConPalestra = '"&idPalestra&"'"
                        set rsFreq = conn.execute(sql) 
                        %>  
                        <div class="row mb-3">
                            <div class="col-sm-6">
                                <div class="flex-container" >
                                <label class="col-form-label ">Frequência: </label>&nbsp
                                    <input type="file" class="form-control" name="frequencia" id="frequencia" value="<%%>" accept="application/pdf">
                                    <%if existe = 1 then%><a href="./<%=rsFreq("frequencia")%>" download><%=Mid(rsFreq("frequencia"), 14)%></a><%end if%>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="flex-container" >
                                    <label class="col-form-label ">Anexo: </label>&nbsp
                                    <input type="file" class="form-control" name="anexo" id="anexo" value="<%=Anexo%>" accept="image/*">
                                    <%if existe = 1 then%><a href="./<%=rsFreq("anexo")%>"  data-toggle="modal" data-target="#exampleModal<%=rsFreq("id_ConPalestra")%>" data-value="<%=rsFreq("anexo")%>"><%=Mid(rsFreq("anexo"), 14)%></a>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal<%=rsFreq("id_ConPalestra")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Palestra</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                            <div class="modal-body d-flex align-items-center img-container">
                                <img id="imageModal" src="<%=rsFreq("anexo")%>" class="img-fluid mx-auto d-block north" alt="..." style="height: 400px; width:450px" >
                            </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                            </div>
                            </div>
                        </div>
                        </div>
                        <%end if%>
                        <%call fechaConexao%>                                    
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">                             
                        <%IF existe = 1 THEN %>
                            <div class="col-sm-6">
                                <div class="flex-container" >
                                <label class="col-form-label ">Status da Palestra: </label>&nbsp
                                    <select class="form-select form-control" id="StatusPalestra" name="StatusPalestra">
                                        <option value="1" <%IF StatusPalestra = TRUE THEN%> selected <%END IF%>>Ativo</option>
                                        <option value="0" <%IF StatusPalestra = FALSE THEN%> selected <%END IF%>>Inativo</option>
                                    </select>
                                </div>
                            </div>
                        <%END IF%>
                        </div>

                        <div class="col-sm-12 mt-4" align="center">
                           <input type="submit" class="btn btn-primary" value="<%IF existe = 1 THEN%>Alterar<%ELSE%>Cadastrar<%END IF%>" onClick="<%IF existe = 1 THEN%>return alterar('<%=idPalestra%>')<%ELSE%>return cadastrar()<%END IF%>">
                        </div>
                </div>
              </div>
            </div><!-- End Customers Card -->
    <div>&nbsp</div>          
<%
if uvl <> "" then
call abreConexao
sql = "SELECT id_ConPalestra, Programas, Atividades, Publico, Tema, frequencia, Qtd_Publico, idUsuarioCad, DataCad, idUsuarioAlt, DataAlt, anexo, DataPalestra, statusPalestra, idUvl, (SELECT Nome FROM SGCS_MunicipioLotacao WHERE (Id = idUvl)) as NomeMunicipio FROM Con_ConPalestra inner join Con_Programa on Con_Programa.id_Programa = Con_ConPalestra.id_Programa inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade inner join Con_Publico on Con_Publico.id_Publico = Con_ConPalestra.id_Publico WHERE idUvl = '"&uvl&"' and StatusPalestra = 1"
'response.write sql
set rs_Palestra = conn.execute(sql)

%>
                    <%if rs_Palestra.eof then%>
                    <div class="col-lg-12" align="center">
                    <br>
                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                            <i class="bi bi-exclamation-triangle me-1"></i>
                            Não Existe Nenhum Registro na Base de Dados!
                        </div>
                    </div>
                    <%Else%>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary"><%=rs_Palestra("NomeMunicipio")%></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Programa</th>
                                            <th>Tema</th>
                                            <th>Atividade</th>
                                            <th>Publico Alvo</th>
                                            <th>Publico Tota</th>
                                            <th>Data da Palestra</th>
                                            <th>Anexo</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%do while not rs_Palestra.eof %>
                                        <tr>
                                            <td><%=rs_Palestra("Programas")%></td>
                                            <td><%=rs_Palestra("Tema")%></td>
                                            <td><%=rs_Palestra("Atividades")%></td>
                                            <td><%=rs_Palestra("Publico")%></td>
                                            <td><%=rs_Palestra("Qtd_Publico")%></td>
                                            <td><%=rs_Palestra("DataPalestra")%></td>
                                            <td>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn modal-trigger" data-toggle="modal" data-target="#exampleModal<%=rs_Palestra("id_ConPalestra")%>" data-value="<%=rs_Palestra("anexo")%>">
                                            <img src="<%if rtrim(rs_Palestra("anexo")) <> ".\upload\" then%><%=rs_Palestra("anexo")%><%else%>upload/Sem_Foto.png<%end if%>" style=" width: 6rem; height: 3rem; border: 1px #555; border-radius: 6px;">
                                            </button>

                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal<%=rs_Palestra("id_ConPalestra")%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Palestra</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                <div class="modal-body d-flex align-items-center img-container">
                                                    <img id="imageModal" src="<%if rtrim(rs_Palestra("anexo")) <> ".\upload\" then%><%=rs_Palestra("anexo")%><%else%>upload/Sem_Foto.png<%end if%>" class="img-fluid mx-auto d-block north" alt="..." style="height: 400px; width:450px" >
                                                </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                </div>
                                                </div>
                                            </div>
                                            </div>

                                            </td>
                                            <td><a href="#" onClick="Ver_alterar('<%=rs_Palestra("id_ConPalestra")%>');"><img style="width: 30px;" src="img/editar.png"></a></td>
                                        </tr>
                                            <% rs_Palestra.movenext 
                                            loop 
                                            call fechaConexao
                                            
                                            %>    
                                    </tbody>
                                </table>
                            <%end if%>    
                            </div>
                    </div>
                </div>
            </div><!-- End Customers Card -->
<%END IF%>
</form>
</div>
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>

<script>
      $(document).ready(function(){
  $('.modal-trigger').on("click", function(e) {
    e.preventDefault();

    var $this  = $(this),
        $modal = $($this.data("target")),
        linkImg = $this.data("value")

      $modal.find('#exampleModal').html(name);
      document.getElementById("imageModal").src = linkImg;
        $modal.modal('show');
    });
 });
</script>
  
  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function () {
       $('#dataTable').DataTable( {
        "ordering": false,
        "language": {
            "lengthMenu": "Exibindo _MENU_ registros por página",
            "zeroRecords": "Nenhum dado encontrado",
            "info": "Página _PAGE_ de _PAGES_",
            "infoEmpty": "Nenhum registro encontrado",
            "infoFiltered": "(_MAX_ rotas filtradas)",
            "search": "Buscar:",
            "paginate":{
              "previous": "Anterior",
              "next": "Próximo"
            }
        }
    } );
    });
  </script>