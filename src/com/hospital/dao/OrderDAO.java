package com.hospital.dao;

import java.util.List;

import com.hospital.model.Order;


public interface OrderDAO {

	boolean placeOrder(Order order);
	List<Order> getAllOrders();
	Order searchOrder(int orderId);
	boolean changeOrderStatusToConfirmed(int orderId);
	boolean changeOrderStatusToCancelled(int orderId);
}
