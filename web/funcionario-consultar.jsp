<%-- 
    Document   : funcionario-consultar
    Created on : 12 de jan de 2021, 18:08:28
    Author     : Janine
--%>

<%@page import="utils.Web"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8"); //para não desconfigurar a acentuação
%>
<jsp:include page = "header.jsp">
    <jsp:param name="tituloPagina" value="Relação de Funcionários Cadastrados" />
</jsp:include>

                <h1>Relação de Funcionários Cadastrados</h1>
                <%
                    String pesquisa = request.getParameter("pesquisa");
                    String txtPesquisa = "";
                    List <Funcionario> funcionarios = null;
                    if (pesquisa == null || "".equals(pesquisa)) {
                        funcionarios = Funcionario.consultar();
                    }
                    else {
                        txtPesquisa = request.getParameter("txtPesquisa").toUpperCase();
                        Funcionario funcionario = null;
                        switch(pesquisa){
                            case "idfuncionario":
                                funcionario = Funcionario.consultar(Integer.parseInt(txtPesquisa));
                                funcionarios = new ArrayList<>();
                                funcionarios.add(funcionario);
                                break;
                            case "nome":
                                funcionarios = Funcionario.consultarNome(txtPesquisa);
                                break;
                        }
                    }
                %>

                <form method="POST" class="form-pesquisa">
                    <label>Pesquisar: </label>
                    <select class="form-campo" name="pesquisa">
                        <option value="" <% out.write("".equals(pesquisa) || pesquisa == null ? " selected='selected'" : "");%> > </option> <!-- retorna a lista completa cadastrada -->
                        <option value="idfuncionario" <%out.write("idfuncionario".equals(pesquisa) ? " selected='selected'" : "");%> >Código</option> <!-- fixa a opção de consulta no código após busca -->
                        <option value="nome" <% out.write("nome".equals(pesquisa) ? " selected='selected'" : "");%> >Nome</option>
                    </select>
                    <input class="form-campo" type="text" name="txtPesquisa" value="<%out.write(txtPesquisa);%>"/>
                    <button class="btn btn-azul btn-sm" type="submit"><i class="fas fa-search"></i> Buscar</button>
                </form>
                    
                <table class="tabela-consulta"> <!-- Indicação do início da tabela -->
                    <thead> <!-- Indicação de início do cabeçalho da tabela -->
                        <th class="direita">Código</th> <!-- Item do cabeçalho da tabela -->
                        <th class="esquerda">Nome do Funcionario</th>
                        <th class="direita">CPF</th>                         
                        <th class="direita">Telefone</th>
                        <th class="direita">Telefone 2</th>
                        <th class="esquerda">E-Mail</th>
                        <th class="centro">Data de Nascimento </th>
                        <th class="centro">Ações</th> 
                    </thead> <!-- Indicação de final do cabeçalho da tabela -->
                    <tbody class="consulta"> <!-- Indicação de início do corpo da tabela -->
                        <% for (Funcionario func : funcionarios) { %>
                            <tr id="botao"> <!-- Indicação do início dos itens que formarão as linhas da tabela -->
                                <td class="direita"><%out.write(String.valueOf(func.getIdFuncionario()));%></td>
                                <td class="esquerda"><%out.write(func.getNome()); %></td> 
                                <td class="direita"><%out.write(func.getCpf()); %></td>
                                <td class="direita"><%out.write(func.getTelefone1());%></td>
                                <td class="direita"><%out.write(func.getTelefone2());%></td>
                                <td class="esquerda"><%out.write(func.getEmail());%></td>
                                <td class="centro"><%out.write(Web.dataParaString(func.getDataNascimento()));%></td> 
                                <td class="centro"><%out.write("<a href=funcionario-cadastro-alterar.jsp?idfuncionario="+String.valueOf(func.getIdFuncionario())
                                        +"><i class='fas fa-edit' title='Editar'></i></a>");%>&nbsp;&nbsp;&nbsp;<%out.write("<a href=\"javascript:if(confirm('Confirma Exclusão?')){document.location='funcionario-excluir.jsp?"
                                        + "idfuncionario="+String.valueOf(func.getIdFuncionario())+"';}\"><i class='fas fa-trash-alt' title='Excluir'></i></a>");%></td>
                            </tr> <!-- Indicação do fim dos itens que formarão as linhas da tabela -->
                        <% } %>
                    </tbody> <!-- Indicação de final do corpo da tabela -->
                </table> <!-- Indicação do final da tabela -->

                <div class="grupo-botoes">
                    <button class="btn btn-vermelho" type="reset" value="Cancelar" onclick="document.location='index.jsp';">Cancelar</button>
                </div>
<jsp:include page = "footer.jsp"/>
