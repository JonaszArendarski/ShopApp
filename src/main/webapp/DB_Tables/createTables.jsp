<%@ page import = "project.ConnectProvider" %>
<%@ page import = "java.sql.*" %>
<% 
try{
	Connection con = ConnectProvider.getConnect();
	Statement st = con.createStatement();
	String query1 = "CREATE TABLE users(name varchar(100),email varchar(100)primary key , mobileNumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(200),address varchar(200),city varchar(50),state varchar(50),country varchar(50))";
	String query2 =  "CREATE TABLE product(id int , name varchar(100), category varchar(100) , price int , active varchar(10))";
	String query3 = "CREATE TABLE cart(email varchar(100),product_id int , quantity int , price int , total int, address varchar(500),city varchar(100) ,  state varchar(100), country varchar(100), mobileNumber bigint , orderDate varchar(100) , deliveryDate varchar(100), paymentMethod varchar(100) , transactionId varchar(100) , status varchar(10))";
 	String query4 = "CREATE TABLE message(id SERIAL PRIMARY KEY,email varchar(100),subject varchar(100), body varchar(1000))";
	//st.execute(query1);
	//st.execute(query2);
	//st.execute(query3);
	st.execute(query4);
	System.out.print("Table created");
	con.close();
}catch(Exception ex){
	System.out.println(ex);
}



%>