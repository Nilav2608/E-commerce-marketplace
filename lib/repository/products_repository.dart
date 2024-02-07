import 'dart:convert';

import 'package:fluxestore/models/product_data_model.dart';

import '../../network/api.dart';
import 'products_repository.interface.dart';
import 'package:http/http.dart' as http;

class ProductsRepository extends Api implements IproductsRepository {
  @override
  Future<List<ProductDataModel>> getAllProducts() async {
    List<ProductDataModel> tempList = [];
    try {
      var response = await http.get(Uri.parse(productsUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var products = data['data'];
        print(products);

        for (var i = 0; i < products.length; i++) {
          ProductDataModel productData = ProductDataModel.fromJson(products[i]);
          print(productData);
          tempList.add(productData);
        }
        return tempList;
      } else {
        throw "User Id is empty";
      }
    } catch (e) {
      return [];
      // return {"status": false, "message": e};
    }
  }
}
