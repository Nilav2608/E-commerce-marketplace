import 'dart:convert';

import 'package:fluxestore/models/banners_data_model.dart';
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

        for (var i = 0; i < products.length; i++) {
          ProductDataModel productData = ProductDataModel.fromJson(products[i]);
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

  @override
  Future<List<BannersDataModel>> getAllBanners() async {
    List<BannersDataModel> tempList = [];

    try {
      var response = await http.get(Uri.parse(bannersUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var banners = data['data'];
        for (var i = 0; i < banners.length; i++) {
          BannersDataModel bannersData = BannersDataModel.fromJson(banners[i]);
          tempList.add(bannersData);
        }
        return tempList;
      } else {
        throw "Unable to load banners";
      }
    } catch (e) {
      return [];
    }
  }
}
