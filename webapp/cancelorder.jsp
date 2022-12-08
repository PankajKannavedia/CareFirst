<%@page import="com.hospital.model.Product"%>
<%@page import="com.hospital.dao.ProductDAO"%>
<%@page import="com.hospital.daoimpl.ProductDAOImpl"%>
<%@page import="com.hospital.daoimpl.OrderDAOImpl"%>
<%@page import="com.hospital.dao.OrderDAO"%>
<%@page import="com.hospital.model.Order"%>
<%@page import="com.hospital.daoimpl.UserDAOImpl"%>
<%@page import="com.hospital.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0);
    %>




<%
	int oid = Integer.parseInt(request.getParameter("orderid"));
	

	ProductDAO pdao = new ProductDAOImpl();
	UserDAO udao = new UserDAOImpl();
	OrderDAO odao  = new OrderDAOImpl();
	Order o = new Order();
	o.setOrderid(oid);
	
	int detail[] = odao.getProductDetailsFromOrderId(o);
	Product p = new Product();
	p.setProductid(detail[0]);
	int quantity = pdao.getQuantityOfProduct(p);
	int upquantity = detail[1]+quantity;
	
	if(odao.getStatus(oid)==false){
		if(udao.cancelOrder(o))
		{	Product p2 = new Product();
			p2.setProductid(detail[0]);
			p2.setQuantity(upquantity);
			pdao.updateQuantityAfterCancellation(p2);
			
			out.print("success");
			
		}
		else
		{
			System.out.println("failure");	
		}
	}
	else{
		System.out.println("product is already cancelled");
		
		%>
		
		<p style="color:green">Product Already Cancelled </p>
		<jsp:include page="userhome.jsp"></jsp:include>
	<% 		
	}
%>
