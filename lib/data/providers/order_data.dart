import 'dart:async';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noesatrip_app/data/models/order.dart';
import 'package:noesatrip_app/helpers/http_exception.dart';

class OrderData with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  final String? token;
  final String? userId;

  OrderData(this.token, this.userId, this._items);

  Order findById(int id) {
    return _items.firstWhere((order) => order.id == id);
  }

  Future<void> fetchOrder() async {
    final url = Uri.parse("http://localhost:8000/api/orders/$userId");

    try {
      final res = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );
      final jsonMembers = jsonDecode(res.body);
      print(jsonMembers);

      final List<Order> loadedOrder = [];

      jsonMembers.forEach((json) {
        Order order = Order.fromJson(json);
        loadedOrder.add(order);
      });

      _items = loadedOrder;
      notifyListeners();
      return Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createOrder(Order order) async {
    final url = Uri.parse('http://localhost:8000/api/orders');

    try {
      final res = await http.post(
        url,
        headers: {"Authorization": "Bearer $token"},
        body: json.encode({
          "user_id": userId,
          "destination_id": order.destinationId,
          "start_date": order.startDate,
          "duration": order.duration,
          "ticket_quantity": order.ticketQuantity,
          "total_amount": order.totalAmount
        }),
      );

      final resData = json.decode(res.body);
      print(resData);
    } catch (e) {
      rethrow;
    }
  }
}
