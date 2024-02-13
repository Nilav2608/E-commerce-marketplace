import 'dart:convert';

import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/repository/CartRepo/cart_repository.interface.dart';
import 'package:http/http.dart' as http;
import '../../network/api.dart';

class CartRepository extends Api implements ICartRepository {
  @override
  Future<Map<String, dynamic>> addTocart(CartItemsModel data) async {
    try {
      var cartItem = data.toJson();
      print(cartItem);
      var response = await http.post(Uri.parse(addToCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(cartItem));
      var results = jsonDecode(response.body);
      print(results);
      if (response.statusCode == 201) {
        return results;
      } else {
        throw Exception("failed to get data");
      }
    } catch (e) {
      return {"status": false, "message": e};
    }
  }
}
