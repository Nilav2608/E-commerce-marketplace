import 'dart:convert';

import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/repository/OrdersRepo/orders_repository.interface.dart';
import 'package:http/http.dart' as http;
import '../../network/api.dart';

class OrdersRepository extends Api implements IOrdersrepository {
  @override
  Future<Map<String, dynamic>> newOrder(MyOrdersDataModel orderedItem) async {
    try {
      var mappedOrder = orderedItem.toJson();
      var response = await http.post(Uri.parse(newOrderUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(mappedOrder));
      var results = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return results;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      return {"status": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> getUserOrders(String userId) async {
    try {
      var response = await http.post(Uri.parse(getUserOrdersUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId}));
      var results = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return results;
      } else if (response.statusCode == 400) {
        return results;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      return {"status": false, "message": e};
    }
  }

  @override
  Future<Map<String, dynamic>> cancelUserOrders(
      String userId, String orderId) async {
    print(userId);
    print(orderId);
    try {
      var response = await http.put(Uri.parse(cancelUserOrder),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId, "orderId": orderId}));
      var results = jsonDecode(response.body);
      print(results);
      if (response.statusCode == 201) {
        return results;
      } else if (response.statusCode == 400) {
        return results;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      return {"status": false, "message": e};
    }
  }
}
