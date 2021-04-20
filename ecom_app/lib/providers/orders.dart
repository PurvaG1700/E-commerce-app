import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.amount,
    @required this.dateTime,
    @required this.id,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;
  Orders(this.authToken,this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        "https://ecom-app-59dcd-default-rtdb.firebaseio.com/orders.json?auth=$authToken";
    final timestamp = DateTime.now();
    final response = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((prod) => {
                    'id': prod.id,
                    'title': prod.title,
                    'quantity': prod.quantity,
                    'price': prod.price
                  })
              .toList()
        }));
    _orders.insert(
      0,
      OrderItem(
          amount: total,
          dateTime: timestamp,
          id: json.decode(response.body)['name'],
          products: cartProducts),
    );
    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    final url =
        "https://ecom-app-59dcd-default-rtdb.firebaseio.com/orders.json?auth=$authToken";
    final response = await http.get(url);
    print(json.decode(response.body));
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData==null){
      return;
    }

    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(OrderItem(
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        id: orderId,
        products: (orderData['products'] as List<dynamic>)
            .map((item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title']
                ))  
            .toList(),
      ));
    });
    _orders=loadedOrders.reversed.toList();
    notifyListeners();
  }
}
