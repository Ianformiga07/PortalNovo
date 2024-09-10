  <!--#include file="base.asp"-->
<div class="content-wrapper" style="min-height: 577px;">
                
<!--- Content Header--->
<section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
        <i class="fa fa-users text-blue"></i> Filiados
    </h1>
    <ol class="breadcrumb font-s-1">
        <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
        <span class="font-w-600">Filiados</span>
    </ol>
</section>

<!--- Main content --->
<section class="content">

    <!--- Users --->
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="row p-right-10">
                    <div class="box-header with-border text-black-light m-bottom-5">

                        <div class="btn-group fl-right">
                            <a href="dashboard.php?control=users/create" class="btn btn-success btn-action-default"><i class="fa fa-plus"></i> Novo Cadastro</a>
                        </div>
                    </div>
                </div>

                <div class="box-body">
                    <div class="row">
                        <div class="box-inline col-md-3 col-sm-6 col-xs-12">
                            <div class="form-inline p-top-20 font-w-400">
                                <label style="width: auto;">
                                    <select class="datatables-len-input-select form-control">
                                        <option value="10">10</option>
                                        <option value="20" selected="">20</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </label>
                                &nbsp; Resultados por páginas
                            </div>
                        </div>  

                        <div class="box-inline col-md-3 col-sm-6 col-xs-12">
                            <label class="m-bottom-0">
                                Nome
                            </label>  
                            <input type="text" id="2" class="datatables-search-input-text form-control">
                        </div>

                        <div class="box-inline col-md-3 col-sm-6 col-xs-12">
                            <label class="m-bottom-0">
                                Data
                            </label>
                            <div class="input-group">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" id="6" name="daterange" class="datatables-search-input-date form-control">
                            </div>
                        </div>

                        <div class="box-inline col-md-3 col-sm-6 col-xs-12">
                            <label class="m-bottom-0">
                                Status
                            </label>
                            <select id="7" class="datatables-search-input-select form-control">
                                <option value="" selected="">Todos</option>
                                <option value="1">Ativo</option>
                                <option value="2">Inativo</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="box-body p-top-5">
                    <div id="datatables_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"><div id="datatables_filter" class="dataTables_filter" style="display: none;"><label><input type="search" class="form-control fl-right" placeholder="" aria-controls="datatables"><span class="fl-right m-top-5">Pesquisar: </span></label></div></div></div><div class="row"><div class="col-sm-12"><table id="datatables" class="table table-striped table-bordered table-hover table-condensed dataTable no-footer dtr-column" width="100%" role="grid" aria-describedby="datatables_info" style="width: 100%;">
                        <thead>
                            <tr role="row"><th class="control sorting_desc" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 0px; display: none;" aria-sort="descending" aria-label=": Ordenar colunas de forma ascendente"></th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 35px;" aria-label=""></th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 116px;" aria-label="Nome: Ordenar colunas de forma ascendente">Nome</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 30px;" aria-label="Fone: Ordenar colunas de forma ascendente">Fone</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 73px;" aria-label="Regional: Ordenar colunas de forma ascendente">Regional</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 88px;" aria-label="Seção: Ordenar colunas de forma ascendente">Seção</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 51px;" aria-label="Data: Ordenar colunas de forma ascendente">Data</th><th class="sorting" tabindex="0" aria-controls="datatables" rowspan="1" colspan="1" style="width: 62px;" aria-label="Status: Ordenar colunas de forma ascendente">Status</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 42px;" aria-label="Ações">Ações</th></tr>
                        </thead>
                        <tbody>
                        <tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>HELENO MOURA MARQUES</td><td></td><td>Taguatinga</td><td>Paranã</td><td>12/11/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="183" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_183"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>GERMANO RODRIGO ALVES NETO</td><td></td><td>Taguatinga</td><td></td><td>12/11/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="182" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=182" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_182"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>RAFAEL MASSAD MANSO</td><td></td><td>Porto Nacional</td><td>SANTA RITA DO TOCANTINS</td><td>18/08/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="181" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=181" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_181"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>JORGE ANTONIO SILVA FRANÇA</td><td></td><td>Formoso do Araguaia</td><td>FORMOSO</td><td>29/06/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="180" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=180" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_180"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>GILSON DOS SANTOS PEDREIRA</td><td></td><td>Taguatinga</td><td></td><td>29/06/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="179" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=179" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_179"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>JORDÊNIA MOREIRA SCHULT BARBOSA </td><td></td><td>Gurupi</td><td>GURUPI</td><td>29/06/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="178" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=178" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_178"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>ELIZÂNGELA LIMA DA SILVA BRITO</td><td></td><td>Paraíso do Tocantins</td><td>CRISTALÂNDIA</td><td>29/06/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="177" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=177" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_177"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>DAIANY KELEN PIMENTEL SOUSA</td><td></td><td>Araguatins</td><td>TOCANTINÓPOLIS</td><td>20/05/2021</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="176" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=176" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_176"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>SONIA MÁRCIA DE SOUZA</td><td></td><td>Colinas</td><td>GUARAÍ</td><td>21/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="175" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=175" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_175"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>KÁTIA APARECIDA SILVA</td><td></td><td>Miracema</td><td></td><td>21/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="174" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=174" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_174"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>WESLEY ALVES FERREIRA</td><td></td><td>Paraíso do Tocantins</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="173" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=173" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_173"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>WERIDIANO ROCHA SILVEIRA</td><td></td><td>Araguaína</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="172" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=172" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_172"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>WANDERSON MARQUES GOMES</td><td></td><td>Araguatins</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="171" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=171" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_171"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>WALMIR CAVALCANTE GOMES</td><td></td><td>Paraíso do Tocantins</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="170" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=170" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_170"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>VERA MARCIA DOS SANTOS</td><td></td><td>Paraíso do Tocantins</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="169" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=169" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_169"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>VALDINEY FERREIRA ALVES</td><td></td><td>Palmas</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="168" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=168" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_168"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>THIAGO OLIVEIRA DE SOUSA GOMES DA SILVA</td><td></td><td>Palmas</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="167" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=167" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_167"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>TED MARIANO AGUIAR</td><td></td><td>Pedro Afonso</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="166" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=166" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_166"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="odd"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>SILVIO ANTÔNIO DA SILVEIRA MAIA</td><td></td><td>Palmas</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="164" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=164" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_164"><i class="fa fa-trash"></i></button></td></tr><tr role="row" class="even"><td class="control sorting_1" tabindex="0" style="display: none;"></td><td><div class="img-thumbnail"><img src="../timthumb.php?src=admin-pcs/images/avatar.jpg&amp;w=40&amp;h=35" alt=""></div></td><td>SEBASTIÃO PINHEIRO MORAES</td><td></td><td>Colinas</td><td></td><td>10/09/2020</td><td><div mdl-name="users" mdl-page="all" type-action="UpdateStatus" id="163" class="btn-group btn-switch-status" style="white-space: nowrap;"><button class="btn active btn-success btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-right: 0px;">Ativo</button><button class="btn btn-default btn-action-sm switch-disabled" style="float: none; display: inline-block; margin-left: 0px;">&nbsp;&nbsp;&nbsp;</button></div></td><td><a href="dashboard.php?control=users/create&amp;id=163" class="btn btn-primary btn-action-sm"><i class="fa fa-pencil"></i></a><button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-action-sm" id="delete_row_163"><i class="fa fa-trash"></i></button></td></tr></tbody>
                    </table><div id="datatables_processing" class="dataTables_processing panel panel-default" style="display: none;">Processando...</div></div></div><div class="row"><div class="col-sm-5"><div class="dataTables_info" id="datatables_info" role="status" aria-live="polite">Mostrando de 1 até 20 de 182 registros</div></div><div class="col-sm-7"><div class="dataTables_paginate paging_simple_numbers" id="datatables_paginate"><ul class="pagination"><li class="paginate_button previous disabled" id="datatables_previous"><a href="#" aria-controls="datatables" data-dt-idx="0" tabindex="0">Anterior</a></li><li class="paginate_button active"><a href="#" aria-controls="datatables" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="4" tabindex="0">4</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="5" tabindex="0">5</a></li><li class="paginate_button disabled" id="datatables_ellipsis"><a href="#" aria-controls="datatables" data-dt-idx="6" tabindex="0">…</a></li><li class="paginate_button "><a href="#" aria-controls="datatables" data-dt-idx="7" tabindex="0">10</a></li><li class="paginate_button next" id="datatables_next"><a href="#" aria-controls="datatables" data-dt-idx="8" tabindex="0">Próximo</a></li></ul></div></div></div></div>
                </div>
            </div>
        </div>      
    </div><!--- /row --->
</section>             </div>
<!--#include file="footer.asp"-->