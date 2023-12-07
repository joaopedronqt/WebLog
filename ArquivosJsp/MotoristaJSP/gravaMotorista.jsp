<%@page language="java" import="java.sql.*" %>
<%
    //cria as variaveis para armazenar as informações digitadas pelo usuario

    int     vmatricula = Integer.parseInt(request.getParameter("m-matricula"));
    String  vnome = request.getParameter("m-nome");
    int     vcnh = Integer.parseInt(request.getParameter("m-cnh"));
    int     vcpf = Integer.parseInt(request.getParameter("m-cpf"));
    String  vtransportadora = request.getParameter("m-transportadora");

    //variaveis para o banco de dados
    String banco = "weblogdb";
    String endereco = "jdbc:mysql://localhost:4306/"+banco;
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
    

    //Try Catch
    try{
        System.out.Println("Teste");
        
        String sql = "INSERT INTO motoristatb (MotoristaID, Nome_Motorista, CNH_Motorista, CPF_Motorista, Transportadora_Motorista) values (?,"Guilherme Berranteiro",123456789,12345678901,"Point")";
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
    }
    catch(Exception exception){
        System.out.Println(exception.getMessage());
    }



%>