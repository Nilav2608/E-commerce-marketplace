// ignore: file_names
class MyOrdersDataModel {
  String? orderID;
  String? trackingNumber;
  String? date;
  String? deliveryAddress;
  int? quantity;
  List<OrderedItems>? orderedItems;
  double? subTotal;
  int? shippingCharges;
  double? total;
  String? deliveryStatus;

  MyOrdersDataModel(
      {this.orderID,
      this.trackingNumber,
      this.date,
      this.deliveryAddress,
      this.quantity,
      this.orderedItems,
      this.subTotal,
      this.shippingCharges,
      this.total,
      this.deliveryStatus});

  MyOrdersDataModel.fromJson(Map<String, dynamic> json) {
    orderID = json['orderID'];
    trackingNumber = json['trackingNumber'];
    date = json['date'];
    deliveryAddress = json['deliveryAddress'];
    quantity = json['quantity'];
    if (json['orderedItems'] != null) {
      orderedItems = <OrderedItems>[];
      json['orderedItems'].forEach((v) {
        orderedItems!.add(OrderedItems.fromJson(v));
      });
    }
    subTotal = json['subTotal'];
    shippingCharges = json['shippingCharges'];
    total = json['total'];
    deliveryStatus = json['deliveryStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderID'] = orderID;
    data['trackingNumber'] = trackingNumber;
    data['date'] = date;
    data['deliveryAddress'] = deliveryAddress;
    data['quantity'] = quantity;
    if (orderedItems != null) {
      data['orderedItems'] = orderedItems!.map((v) => v.toJson()).toList();
    }
    data['subTotal'] = subTotal;
    data['shippingCharges'] = shippingCharges;
    data['total'] = total;
    data['deliveryStatus'] = deliveryStatus;
    return data;
  }
}

class OrderedItems {
  String? productID;
  int? quantity;
  double? price;

  OrderedItems({this.productID, this.quantity, this.price});

  OrderedItems.fromJson(Map<String, dynamic> json) {
    productID = json['productID'];
    quantity = json['quantity'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productID'] = productID;
    data['quantity'] = quantity;
    data['price'] = price;
    return data;
  }
}
