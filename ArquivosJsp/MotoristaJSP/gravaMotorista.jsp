<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações digitadas pelo usuario

    int     vmatricula = Integer.parseInt(request.getParameter("m-matricula"));
    String  vnome = request.getParameter("m-nome");
    int     vcnh = Integer.parseInt(request.getParameter("m-cnh"));
    int     vcpf = Integer.parseInt(request.getParameter("m-cpf"));
    String  vtransportadora = request.getParameter("m-transportadora");

    //variaveis para o banco de dados
    String banco = "weblog";
    String endereco = "jdbc:mysql://localhost:8080/"+banco;
    String usuario = "root";
    String senha = "";

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver";

    
//carregar driver na memoria
    Class.forName( driver );

    //criar variavel para conectar com banco
    Connection conexao ;

    //Abrir conexão com banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    //Criar a variavel sql com o comando insert
    String sql = "INSERT INTO motoristatb (MotoristaID, Nome_Motorista, CNH_Motorista, CPF_Motorista, Transportadora_Motorista) values (?,?,?,?,?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setInt( 1, vmatricula);
    stm.setString( 2 , vnome);
    stm.setInt( 3 , vcnh);
    stm.setInt( 4 , vcpf);
    stm.setString( 5 , vtransportadora);

    stm.execute();
    stm.close() ;
    out.print("Dados gravados com sucesso!!!");
    out.print("<br><br>");
    out.print("<a href='paginaMotorista.html'>Voltar</a>");

%>