import 'dart:convert';

import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/SearchRepo/search.repository.interface.dart';
import '../../network/Api/api.dart';
import 'package:http/http.dart' as http;

class SearchRepository extends Api implements ISearchRepository{
  @override
  Future<List<ProductDataModel>> searchProducts(String query) async {
    List<ProductDataModel> tempList = [];
    try {
      var response = await http.get(Uri.parse("$searchByProductsUrl/$query"));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var products = data['data'];

        for (var i = 0; i < products.length; i++) {
          products.remove('__v');
          ProductDataModel productData = ProductDataModel.fromJson(products[i]);
          tempList.add(productData);
        }
        return tempList;
      } else {
        throw "User Id is empty";
      }
    } catch (e) {
      return [];
    }
  }
}