import 'package:flutter/material.dart';

class CartItemsModel {
  String? id;
  String? productName;
  double? price;
  String? size;
  Color? color;
  int? quantity;
  String? imageUrl;
  bool? selected;

  CartItemsModel(
      {this.id,
      this.productName,
      this.price,
      this.size,
      this.color,
      this.quantity,
      this.imageUrl,
      this.selected});

  CartItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    price = json['price'];
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
    imageUrl = json['imageUrl'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['price'] = price;
    data['size'] = size;
    data['color'] = color;
    data['quantity'] = quantity;
    data['imageUrl'] = imageUrl;
    data['selected'] = selected;
    return data;
  }
  
  double subTotal(List<CartItemsModel> totalCartItems) {
  double total = 0;
  for (var items in totalCartItems) {
    if (items.selected!) {
      double currentPrice = double.parse(items.price.toString());
      var quantity = items.quantity;
      total += currentPrice * quantity!;
    }
  }
  return total;
}
}
