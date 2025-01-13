<!--#include file="base.asp"-->
<%
cod = request("cod")
IdVereador = Request("IdVereador")
call abreConexao

if request.form("Operacao") = 2 then
   sql = "Insert cam_vereador(id_servidor, IdMandato) values('"&request.form("id_servidor")&"', '"&request.form("IdMandato")&"')"
   conn.execute(sql)
   response.Redirect("sel-mandatoVereador.asp?Atualizar=1&IdMandato="&Request.form("IdMandato")&"")
end if 





%>
<script>

      function consultar(){      
      var form = document.forms["frm_selmadatoVereador"];
      form.Operacao.value = "1";
      form.action = "sel-mandatoVereador.asp";
      form.submit();

      }

      function inserir(){    
      var form = document.forms["frm_selmadatoVereador"];
      form.Operacao.value = "2";
      form.action = "sel-mandatoVereador.asp";
      form.submit();

      }

      function MandadosLeg(IdVereador, Mandato){    
      var form = document.forms["frm_selmadatoVereador"];
      form.Operacao.value = "0";
      form.IdVereador.value = IdVereador;
      form.id_mandatoleg.value = Mandato;
      form.action = "cad-vereador.asp";
      form.submit();
      }

    
      //verificar essa função aqui IAN esta atualizando tudo de uma vez 
      function cadVereador(IdVereador){    
      var form = document.forms["frm_selmadatoVereador"];
      form.Operacao.value = "0";
      form.IdVereador.value = IdVereador;
      form.Mandato.value = Mandato;
      form.action = "cad-mandatovereador.asp";
      form.submit();
      }

    </script>
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-fw fa-calendar text-blue"></i> Gerenciar Legislatura dos Vereadores
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <li><a href="vereadores.asp">A Câmara</a></li> /
      <span class="font-w-600">Gerenciar Vereador</span>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-3">
    <form action="cad-mandatovereador.asp" method="post" name="frm_selmadatoVereador" class="d-flex align-items-end">
     <input type="hidden" name="Operacao" id="Operacao">
      <input type="hidden" name="IdVereador" id="IdVereador">
      <input type="hidden" name="Mandato" id="Mandato">
      <input type="hidden" name="id_mandatoleg" id="id_mandatoleg">
      <%IF REQUEST("Atualizar") = 1 THEN%>
       <input type="hidden" name="IdMandato" id="IdMandato" value="<%=request("IdMandato")%>">
          <script>
             consultar();
          </script>
      <%ELSE%>
      </div>
      <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
                <%
                  sql = "SELECT  IdMandato, Mandato  FROM  cam_vereadorMandato order by IdMandato"
                  set rs = conn.execute(sql)
                  'selecionar o ID mandato atual'
                  if request("IdMandato") <> "" then
                     CodigoanoLegislatura = request("IdMandato")
                  else
                      sql = " SELECT IdMandato  FROM  cam_vereadorMandato WHERE  (Mandato LIKE '%"&year(date())&"%')"
                      set rs_atual = conn.execute(sql)
                      CodigoanoLegislatura = rs_atual("IdMandato")
                  end if 
                %>
                <div class="row">
                    <div class="col-md-5">
                        <label for="anoLegislatura">Ano da Legislatura</label>
                        <select class="form-control" id="IdMandato" name="IdMandato">
                        <option> -- Selecionar --</option>
                        <option disabled></option>
                        <%do while not rs.eof %>
                        <option value="<%=rs("IdMandato")%>" <%IF RTRIM(CodigoanoLegislatura) = RTRIM(rs("IdMandato")) then%> selected <%end if%>><%=rs("Mandato")%></option>
                       <% rs.movenext 
                           loop %> 
                        </select>
                    </div>
                    
                     <div class="col-md-2 d-flex align-items-end">
                        <label for="vereadores">&nbsp</label>
                        <button type="button" class="btn btn-primary form-control"  onclick="consultar()">
                        <i class="fa fa-fw fa-check"></i> Consultar
                        </button>
                    </div>
                  </div>
                  <%sql = "SELECT COUNT(*) AS Total  FROM   cam_vereador  WHERE   (IdMandato = '"&CodigoanoLegislatura&"')"
                    set rs = conn.execute(sql)
                    Quantidade = rs("Total")
                  %>
                  <%IF Quantidade < 9 THEN%>
                  <div class="row">
                    <%
                      sql = "SELECT  id_servidor, NomeCompleto FROM   cam_servidores  where id_Cargo = 15 AND (NOT EXISTS (SELECT  id_servidor FROM   cam_vereador WHERE (id_servidor = cam_servidores.id_servidor) AND  (IdMandato = '"&CodigoanoLegislatura&"')))"
                      set rs = conn.execute(sql)
                    %>
                    <div class="col-md-5">
                        <label for="vereadores">Vereadores Disponíveis</label>
                        <select class="form-control" id="id_servidor" name="id_servidor">
                        <option> -- Selecionar --</option>
                        <option disabled></option>
                        <%do while not rs.eof%>
                        <option value="<%=rs("id_servidor")%>"><%=Ucase(rs("NomeCompleto"))%></option>
                        <% rs.movenext 
                           loop 
                        %>
                        </select>
                    </div>

                    <div class="col-md-2 d-flex align-items-end">
                        <label for="vereadores">&nbsp</label>
                        <button type="button" class="btn btn-primary form-control"  onclick="inserir()">
                        <i class="fa fa-fw fa-check"></i> Inserir
                        </button>
                    </div>
                   <%END IF%>
                
            </div>
        </div>
          <div class="box box-primary">
            <div class="box-body">
                <div class="col-md-12" style="margin-top: 15px;">
                    <table id="example2" class="table table-bordered table-hover">
                    <thead>
                        <tr>
                        <th>IdVereador</th>
                        <th>Nome</th>
                        <th>Status</th>
                        <th>Ações</th>
                        
                        </tr>
                    </thead>
                    <tbody>
                      <%
                         sql = "SELECT STRING_AGG(CONVERT(VARCHAR,id_mandatosLeg), '<=>') AS IdMandatosLegislatura,  STRING_AGG(mandatos, '<=>') AS MandatosLegislatura  FROM   cam_mandatosLeg WHERE   (IdMandato = '"&CodigoanoLegislatura&"')"
                         
                         set rs = conn.execute(sql)
                         Idmandato_001 = split(rs("IdMandatosLegislatura"),"<=>")(0)
                         Idmandato_002 = split(rs("IdMandatosLegislatura"),"<=>")(1)
                         mandato_001 = split(rs("MandatosLegislatura"),"<=>")(0)
                         mandato_002 = split(rs("MandatosLegislatura"),"<=>")(1)
                         sql = "SELECT cam_vereador.Id_Vereador, cam_servidores.NomeCompleto  FROM     cam_vereador INNER JOIN  cam_servidores ON cam_vereador.id_servidor = cam_servidores.id_servidor  WHERE  (cam_vereador.IdMandato = '"&CodigoanoLegislatura&"')"
                         set rs = conn.execute(sql)
                         
                      %>
                        <%do while not rs.eof%>
                            <tr>
                              <td><%=rs("Id_Vereador")%></td>
                                <td><%=ucase(rs("NomeCompleto"))%></td>
                                <td><%if IdVereador = rs("Id_Vereador") then%><span class="label center bg-green">Atualizado</span><%else%><span class="label center bg-gray">Desatualizado</span><%end if%></td>
                                <td class="d-flex justify-content-center align-items-center">
                                    <a href="#" onclick = "cadVereador('<%=rs("Id_Vereador")%>')" class="btn btn-info btn-sm"><i class="fa fa-user"></i> Dados Pessoais</a>
                                    <a href="#" onclick = "MandadosLeg('<%=rs("Id_Vereador")%>', '<%=Idmandato_001%>')"  class="btn btn-warning btn-sm"><i class="fa fa-users"></i><%=mandato_001%></a>
                                    <a href="#" onclick = "MandadosLeg('<%=rs("Id_Vereador")%>', '<%=Idmandato_002%>')" class="btn btn-warning btn-sm"><i class="fa fa-users"></i><%=mandato_002%></a>
                                 </td>
                              </tr>
                        <% rs.movenext 
                           loop 
                        %>
                    </tbody>
                    </table>
                </div>
            </div>
          </div>
          <%END IF%>
    </form>
    </div>
  </section>
</div>
<%call fechaConexao%>
<!--#include file="footer.asp"-->