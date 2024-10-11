<%@Language="VBScript" CodePage=65001 %>
<!DOCTYPE html>
<%
  Session("datatable") = 1
%>
<!--#include file ="base.asp"-->

<%

uvl = replace(request("uvlSelect"), ",", "")
DataInicial = replace(request("txtDataInicial"), ",", "")
DataFinal = replace(request("txtDataFinal"), ",", "")
'Programa = replace(request("ProgramaSelect"), ",", "")
call abreConexao
sql = "select * From SGCS_MunicipioLotacao where Id = '"&trim(uvl)&"'"
'response.write sql
'response.end
set rsCidade = conn.Execute(sql)
if not rsCidade.eof then
NomeCidade = rsCidade("Nome")
end if 
call fechaConexao
%>
<script>

function Ver_alterar(idPalestra)
{

    var form = document.forms["AltPalestra"];
    form.idPalestra.value = idPalestra;
    form.uvlSelect.value = <%=uvl%>;
    form.action = "Ins_Palestras.asp";
    form.submit();
    
}


</script>

<style>
    .funcionario-inativo {
    background-color: #f2f2f2;  /* Altere a cor de fundo conforme necessário */
    color: #888;  /* Altere a cor do texto conforme necessário */
    font-style: italic;  /* Adicione estilos adicionais conforme necessário */
    /* Adicione outros estilos conforme necessário */
}
</style>
<div class="col-md-12">
     <form method="POST" id="AltPalestra">
         <input type="hidden" name="BotaoVoltar">
         <input type="hidden" name="idPalestra" id="idPalestra">
         <input type="hidden" name="uvlSelect">
     </form>
     <a href="Cons_Palestras.asp" onclick="#" class="btn btn-link mt-2">
        <img src="img/Voltar.png" alt="Voltar" style="height: 30px; width: 30px;">
     </a>       
            <div class="card">
                <div class="card-body">
                  <div class="row"> 
                           <!-- Earnings (Monthly) Card Example -->
                         <div class="col-xl-4 col-md-6 mb-4">
                            <a href="Con_RelatorioExcel.asp"  style="text-decoration: none; color: inherit;" target="_blank" download>
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Gerar Relatório</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">em Excel</div>
                                        </div>
                                        <div class="col-auto">
                                          <!-- Substitua o ícone do calendário pelo ícone do Excel -->
                                           <img src="img/excell.png" alt="Excel Icon" style="height: 40px; width: 40px;">
                                      
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                         <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                             <a href="Con_RelatorioPdf.asp" style="text-decoration: none; color: inherit;" target="_blank" >
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Gerar Relatório</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">em Pdf</div>
                                        </div>
                                        <div class="col-auto">
                                            <img src="img/pdf.png" alt="Pdf Icon" style="height: 40px; width: 40px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </a>
                        </div>
                        <!-- Tasks Card Example -->
                        <div class="col-xl-4 col-md-6 mb-4">
                            <a href="Con_RelatorioWord.asp" style="text-decoration: none; color: inherit;" target="_blank" download>
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Gerar Relatório</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">em Word</div>
                                        </div>
                                        <div class="col-auto">
                                            <img src="img/word.png" alt="WORD Icon" style="height: 40px; width: 40px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                          </a>
                        </div>
                   </div> <!--row-->
                   
                                          <!-- Content Row -->
                    <%
                    call abreConexao
                    sql5 = "SELECT SUM(CASE WHEN Con_ConPalestra.id_Atividade = 1 THEN 1 ELSE 0 END) as qtd_Palestra, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 2 THEN 1 ELSE 0 END) as qtd_Reuniao, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 3 THEN 1 ELSE 0 END) as qtd_DiaCampo, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 4 THEN 1 ELSE 0 END) as qtd_Orientacao FROM Con_ConPalestra inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade INNER JOIN SGCS_MunicipioLotacao on SGCS_MunicipioLotacao.Id = Con_ConPalestra.IdUvl INNER JOIN Regional on Regional.RegionalId = SGCS_MunicipioLotacao.RegionalId WHERE idUvl = '"&trim(uvl)&"' and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103) >= CONVERT(DateTime, '"&Trim(DataInicial)&"', 103)) and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103)  <= CONVERT(DateTime, '"&Trim(DataFinal)&"', 103));"
                    'response.write sql5
                    'response.end
                   SET rsCon = CONN.EXECUTE(sql5)
                      Palestra = rsCon("qtd_Palestra")
                      Reuniao = rsCon("qtd_Reuniao")
                      DiaCampo = rsCon("qtd_DiaCampo")
                      OrientacaoTec = rsCon("qtd_Orientacao")
                      call fechaConexao
                    If IsNull(Palestra) Then Palestra = 0
                    If IsNull(Reuniao) Then Reuniao = 0
                    If IsNull(DiaCampo) Then DiaCampo = 0
                    If IsNull(OrientacaoTec) Then OrientacaoTec = 0

                      TotalAtividade = clng(Palestra) + clng(Reuniao) + clng(DiaCampo) + clng(OrientacaoTec)
                      Porcentagem_Palestra = 0
                      Porcentagem_Reuniao = 0
                      Porcentagem_DiaCampo = 0
                      Porcentagem_OrientacaoTec = 0
                      IF CLNG(TotalAtividade) > 0 THEN
                      Porcentagem_Palestra = clng(Palestra * 100/ TotalAtividade)
                      Porcentagem_Reuniao = clng(Reuniao * 100/ TotalAtividade)
                      Porcentagem_DiaCampo = clng(DiaCampo * 100/ TotalAtividade)
                      Porcentagem_OrientacaoTec = clng(OrientacaoTec * 100/ TotalAtividade)
                      END IF
                    %>
                    <div class="row">
                    <!-- Content Column -->
                    <div class="col-lg-6 mb-4 h-100">
                        <!-- Project Card Example -->
                        <div class="card shadow mb-4 h-100" >
                            <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Quantidade de Atividade Por Municipio: <i><%=NomeCidade%></i> <i>Total: <%IF LEN(TotalAtividade) = 1 THEN RESPONSE.WRITE "0"& TotalAtividade ELSE RESPONSE.WRITE TotalAtividade END IF%></i></h6>
                                 </div>
                                 <div class="card-body" >
                                    <h4 class="small font-weight-bold">Palestras<span class="float-right"><%=Palestra%></span></h4>
                                    <div class="progress mb-4">
                                       <div class="progress-bar bg-danger" role="progressbar" style="width: <%=Porcentagem_Palestra%>%" aria-valuenow="<%=Porcentagem_Palestra%>" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Reunião<span class="float-right"><%=Reuniao%></span></h4>
                                    <div class="progress mb-4">
                                       <div class="progress-bar bg-info" role="progressbar" style="width: <%=Porcentagem_Reuniao%>%" aria-valuenow="<%=Porcentagem_Reuniao%>" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Dia de Campo<span class="float-right"><%=DiaCampo%></span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: <%=Porcentagem_DiaCampo%>%" aria-valuenow="<%=Porcentagem_DiaCampo%>" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div></br>
                                    <h4 class="small font-weight-bold">Orientação Técnica<span class="float-right"><%=OrientacaoTec%></span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: <%=Porcentagem_OrientacaoTec%>%" aria-valuenow="<%=Porcentagem_OrientacaoTec%>" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                  </div>
                             </div>
                        </div>
                    <%
                    call abreConexao
                    'sql5 = "SELECT SUM(CASE WHEN Con_ConPalestra.id_Atividade = 1 THEN 1 ELSE 0 END) as qtd_Palestra, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 2 THEN 1 ELSE 0 END) as qtd_Reuniao, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 3 THEN 1 ELSE 0 END) as qtd_DiaCampo, SUM(CASE WHEN Con_ConPalestra.id_Atividade = 4 THEN 1 ELSE 0 END) as qtd_Orientacao FROM Con_ConPalestra inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade INNER JOIN SGCS_MunicipioLotacao on SGCS_MunicipioLotacao.Id = Con_ConPalestra.IdUvl INNER JOIN Regional on Regional.RegionalId = SGCS_MunicipioLotacao.RegionalId WHERE Regional.RegionalId = '"&RegionalId&"' and convert(DateTime, DataPalestra,103) >= convert(DateTime, '01/"&MesInicial&"/"&Ano&"',103) and convert(DateTime, DataPalestra,103) <= convert(Datetime, '"&day(UltimoDiaDoMes(MesFinal, Ano))&"/"&MesFinal&"/"&Ano&"',103);"
                    sql5 = "SELECT SUM(CASE WHEN Con_Programa.id_Programa = 1 THEN 1 ELSE 0 END) as PEEFA, SUM(CASE WHEN Con_Programa.id_Programa = 2 THEN 1 ELSE 0 END) as PEEEB, SUM(CASE WHEN Con_Programa.id_Programa = 3 THEN 1 ELSE 0 END) as PECRH, SUM(CASE WHEN Con_Programa.id_Programa = 4 THEN 1 ELSE 0 END) as PECEBT, SUM(CASE WHEN Con_Programa.id_Programa = 5 THEN 1 ELSE 0 END) as PESA, SUM(CASE WHEN Con_Programa.id_Programa = 6 THEN 1 ELSE 0 END) as PESS, SUM(CASE WHEN Con_Programa.id_Programa = 7 THEN 1 ELSE 0 END) as PESE_AIE, SUM(CASE WHEN Con_Programa.id_Programa = 8 THEN 1 ELSE 0 END) as PESAA, SUM(CASE WHEN Con_Programa.id_Programa = 9 THEN 1 ELSE 0 END) as PESCO, SUM(CASE WHEN Con_Programa.id_Programa = 10 THEN 1 ELSE 0 END) as PESAPI, SUM(CASE WHEN Con_Programa.id_Programa = 11 THEN 1 ELSE 0 END) as INSPECAO_ANIMAL, SUM(CASE WHEN Con_Programa.id_Programa = 12 THEN 1 ELSE 0 END) as OUTROS, SUM(CASE WHEN Con_Programa.id_Programa = 13 THEN 1 ELSE 0 END) as AGROTOXICO, SUM(CASE WHEN Con_Programa.id_Programa = 14 THEN 1 ELSE 0 END) as VEGETAL, SUM(CASE WHEN Con_Programa.id_Programa= 15 THEN 1 ELSE 0 END) as PESE_MORMO FROM Con_ConPalestra inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade INNER JOIN SGCS_MunicipioLotacao on SGCS_MunicipioLotacao.Id = Con_ConPalestra.IdUvl INNER JOIN Regional on Regional.RegionalId = SGCS_MunicipioLotacao.RegionalId inner join Con_Programa on Con_Programa.Id_Programa = Con_ConPalestra.Id_Programa WHERE idUvl = '"&Trim(uvl)&"' and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103) >= CONVERT(DateTime, '"&Trim(DataInicial)&"', 103)) and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103)  <= CONVERT(DateTime, '"&Trim(DataFinal)&"', 103));"
                    'response.write sql5
                    'response.end

                   SET rsCon = CONN.EXECUTE(sql5)
                        PEEFA = rsCon("PEEFA")
                        PEEEB = rsCon("PEEEB")
                        PECRH = rsCon("PECRH")
                        PECEBT = rsCon("PECEBT")
                        PESA = rsCon("PESA")
                        PESS = rsCon("PESS")
                        PESE_AIE = rsCon("PESE_AIE")
                        PESAA = rsCon("PESAA")
                        PESCO = rsCon("PESCO")
                        PESAPI = rsCon("PESAPI")
                        INSPECAO_ANIMAL = rsCon("INSPECAO_ANIMAL")
                        OUTROS = rsCon("OUTROS")
                        AGROTOXICO = rsCon("AGROTOXICO")
                        VEGETAL = rsCon("VEGETAL")
                        PESE_MORMO = rsCon("PESE_MORMO")
                      call fechaConexao

                    If IsNull(PEEFA) Then PEEFA = 0
                    If IsNull(PEEEB) Then PEEEB = 0
                    If IsNull(PECRH) Then PECRH = 0
                    If IsNull(PECEBT) Then PECEBT = 0
                    If IsNull(PESA) Then PESA = 0
                    If IsNull(PESS) Then PESS = 0
                    If IsNull(PESE_AIE) Then PESE_AIE = 0
                    If IsNull(PESAA) Then PESAA = 0
                    If IsNull(PESCO) Then PESCO = 0
                    If IsNull(PESAPI) Then PESAPI = 0
                    If IsNull(INSPECAO_ANIMAL) Then INSPECAO_ANIMAL = 0
                    If IsNull(OUTROS) Then OUTROS = 0
                    If IsNull(AGROTOXICO) Then AGROTOXICO = 0
                    If IsNull(VEGETAL) Then VEGETAL = 0
                    If IsNull(PESE_MORMO) Then PESE_MORMO = 0

                      totalProgramas = clng(PEEFA) + clng(PEEEB) + clng(PECRH) + clng(PECEBT) + clng(PESA) + clng(PESS) + clng(PESE_AIE) + clng(PESAA) + clng(PESCO) + clng(PESAPI) + clng(INSPECAO_ANIMAL) + clng(OUTROS) + clng(AGROTOXICO) + clng(VEGETAL) + clng(PESE_MORMO)

                    %>

    <!-- Content Column -->
    <div class="col-lg-6 mb-4">
        <!-- Project Card Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Quantidade do Programa por Municipio: <i><%=NomeCidade%></i> <i>Total: <%IF LEN(totalProgramas) = 1 THEN RESPONSE.WRITE "0"& totalProgramas ELSE RESPONSE.WRITE totalProgramas END IF%></i></h6>
             </div>
        <!-- Bar Chart -->
        <div class="col-lg-12 mt-5"> <!-- Alterei o tamanho da coluna para 12 -->

                <canvas id="ambarchart4"></canvas>

        </div>
         </div>
    </div>

                        <!--<script src="plugins/common/common.min.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
if ($('#ambarchart4').length) {
    var ctx = document.getElementById('ambarchart4').getContext('2d');

    var data = {
        labels: ['PEEFA', 'PEEEB', 'PECRH', 'PECEBT', 'PESA', 'PESS', 'PESE_AIE', 'PESAA', 'PESCO', 'PESAPI', 'INSPECAO_ANIMAL', 'OUTROS', 'AGROTOXICO', 'VEGETAL', 'PESE_MORMO'],
        datasets: [{
            label: 'Quantidade do Programa por Municipio <%=NomeCidade%>',
            data: [<%= PEEFA %>, <%= PEEEB %>, <%= PECRH %>, <%= PECEBT %>, <%= PESA %>, <%= PESS %>, <%= PESE_AIE %>, <%= PESAA %>, <%= PESCO %>, <%= PESAPI %>, <%= INSPECAO_ANIMAL %>, <%= OUTROS %>, <%= AGROTOXICO %>, <%= VEGETAL %>, <%= PESE_MORMO %>],
            backgroundColor: [
                '#8918FE',
                '#7474F0',
                '#C5C5FD',
                '#952FFE',
                '#7474F0',
                '#CBCBFD',
                '#FD9C21',
                '#0D8ECF',
                '#0D52D1',
                '#2A0CD0',
                '#8A0CCF',
                '#9F43FE',
                '#FF5733',
                '#4CAF50',
                '#FFC300'
            ],
            borderColor: [
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)',
                'rgba(0, 0, 0, 0.2)'
            ],
            borderWidth: 1
        }]
    };


    var options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        }
    };

    var myBarChart = new Chart(ctx, {
        type: 'bar',
        data: data,
        options: options
    });
}
</script>
                 </div>
            </div>
<div>&nbsp</div>
                   <!-- DataTales Example -->
                   <%
                    call abreConexao
                    sql = "SELECT id_ConPalestra, Programas, Atividades, Publico, Tema, frequencia, SUM(Qtd_Publico) AS Total_Publico, idUsuarioCad, DataPalestra, idUsuarioAlt, DataAlt, anexo, DataPalestra, statusPalestra, idUvl, (SELECT Nome FROM SGCS_MunicipioLotacao WHERE (Id = idUvl)) as NomeMunicipio FROM Con_ConPalestra inner join Con_Programa on Con_Programa.id_Programa = Con_ConPalestra.id_Programa inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade inner join Con_Publico on Con_Publico.id_Publico = Con_ConPalestra.id_Publico WHERE idUvl = '"&Trim(uvl)&"' and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103) >= CONVERT(DateTime, '"&Trim(DataInicial)&"', 103)) and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103)  <= CONVERT(DateTime, '"&Trim(DataFinal)&"', 103)) group by Con_ConPalestra.id_ConPalestra, Con_Programa.Programas, Con_Atividade.Atividades,Con_Publico.Publico, Con_ConPalestra.Tema,Con_ConPalestra.frequencia,Con_ConPalestra.idUsuarioCad, Con_ConPalestra.DataPalestra, Con_ConPalestra.idUsuarioAlt, Con_ConPalestra.DataAlt, Con_ConPalestra.anexo, Con_ConPalestra.DataPalestra, Con_ConPalestra.statusPalestra, Con_ConPalestra.idUvl"
                    set rs_Soma = conn.execute(sql)
                    Dim somaTotalPublico
                    somaTotalPublico = 0
                    Do While Not rs_Soma.EOF
                        somaTotalPublico = somaTotalPublico + rs_Soma("Total_Publico")
                        rs_Soma.MoveNext
                    Loop

                        Session("Soma") = somaTotalPublico
                    call fechaConexao
                    call abreConexao
                    sql = "SELECT id_ConPalestra, Programas, Atividades, Publico, Tema, frequencia, Qtd_Publico, idUsuarioCad, DataPalestra, idUsuarioAlt, DataAlt, anexo, DataPalestra, statusPalestra, idUvl, (SELECT Nome FROM SGCS_MunicipioLotacao WHERE (Id = idUvl)) as NomeMunicipio FROM Con_ConPalestra inner join Con_Programa on Con_Programa.id_Programa = Con_ConPalestra.id_Programa inner join Con_Atividade on Con_Atividade.id_Atividade = Con_ConPalestra.id_Atividade inner join Con_Publico on Con_Publico.id_Publico = Con_ConPalestra.id_Publico WHERE idUvl = '"&Trim(uvl)&"' and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103) >= CONVERT(DateTime, '"&Trim(DataInicial)&"', 103)) and (CONVERT(DateTime, con_ConPalestra.DataPalestra, 103)  <= CONVERT(DateTime, '"&Trim(DataFinal)&"', 103))"
                    'response.write sql
                    'response.end
                    SESSION("SQL1") = sql
                    SESSION("sqlData") = DataInicial & " - " & DataFinal 
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
                            <h6 class="m-0 font-weight-bold text-primary">MUNICÍPIO: <%=rs_Palestra("NomeMunicipio")%></h6>
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
                                            <th>Publico Total: <i class="font-weight-bold text-danger"><%=somaTotalPublico%></i></th>
                                            <th>Data da Palestra</th>
                                            <th>Frequência</th>
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
                                            <td><a href="./<%=rs_Palestra("frequencia")%>" download><%=Mid(rs_Palestra("frequencia"), 14)%></a></td>
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
                            </div>
                        </div>
                    <%end if%>
                    </div>  

</div><!-- End Customers Card -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"></script>

