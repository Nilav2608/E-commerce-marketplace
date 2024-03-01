import 'dart:convert';

import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/repository/CartRepo/cart_repository.interface.dart';
import 'package:http/http.dart' as http;
import '../../network/Api/api.dart';

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
  Future<Map<String, dynamic>> getCartItems(String userId) async {
    try {
      var response = await http.post(Uri.parse(getUserCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({'userId': userId}));
      var results = jsonDecode(response.body);
      if (response.statusCode == 200) {
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
  Future<Map<String, dynamic>> deleteCartItem(
      String userId, String docId) async {
    try {

      var quaries = {'docId': docId, 'userId': userId};

      var response = await http.delete(Uri.parse(deleteUserCartUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(quaries));

      var results = jsonDecode(response.body);
      
      if (response.statusCode == 200) {
        return results;
      } else if (response.statusCode == 400) {
        return results;
      } else {
        return results;
      }
    } catch (e) {
      return {"status": false, "message": e};
    }
  }
}
