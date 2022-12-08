<%@page import="com.hospital.dao.UserDAO"%>
<%@page import="com.hospital.daoimpl.UserDAOImpl"%>
<%@page import="com.hospital.model.Order"%>
<%@page import="com.hospital.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int oid = Integer.parseInt(request.getParameter("orderid"));
	String address = request.getParameter("address");
	UserDAO udao = new UserDAOImpl();
	Order o = new Order();
	o.setOrderid(oid);
	o.setAddress(address);
	
	if(udao.register(o))
	{
		out.print("success");
	}
	else
	{
		out.print("failure");	
	}
%>