import 'package:fluxestore/models/cart_items_model.dart';
import 'package:fluxestore/models/delivery_address_model.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';


// ^ PENDING STATUS ITEMS
List<MyOrdersDataModel> pendingItems = [
  MyOrdersDataModel(
    orderID: "#1514",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 2,
    trackingNumber: "IK987362341",
    orderedItems: [
      CartItemsModel(
        productName: "White fashion hoodie",
        quantity: 1,
        price: 29.00,

      ),
      CartItemsModel(
        productName: "White fashion hoodie",
        quantity: 1,
        price: 29.00,

      ),
      // CartItemsModel(
      //   productName: "White fashion hoodie",
      //   quantity: 1,
      //   price: 29.00,

      // ),
      // CartItemsModel(
      //   productName: "White fashion hoodie",
      //   quantity: 1,
      //   price: 29.00,

      // ),
      // CartItemsModel(
      //   productName: "White fashion hoodie",
      //   quantity: 1,
      //   price: 29.00,

      // ),
    ],
    subTotal: 110,
    deliveryStatus: "PENDING",
    shippingCharges: 0.0,
    total: 110,
    
  ),
  MyOrdersDataModel(
    orderID: "#1514",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 2,
    trackingNumber: "IK987362341",
    orderedItems: [],
    subTotal: 110,
    deliveryStatus: "PENDING",
    shippingCharges: 0,
    total: 110,
  ),
];


//* DELIVERED ITEMS
List<MyOrdersDataModel> deliveredItems = [
  MyOrdersDataModel(
    orderID: "#1501",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 1,
    trackingNumber: "IK987362341",
    orderedItems: [],
    subTotal: 11,
    deliveryStatus: "DELIVERED",
    shippingCharges: 0,
    total: 11,
  ),
  MyOrdersDataModel(
    orderID: "#1502",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 6,
    trackingNumber: "IK987362341",
    orderedItems: [],
    subTotal: 175,
    deliveryStatus: "DELIVERED",
    shippingCharges: 0,
    total: 110,
  ),
];


//! CANCELLED ITEMS
List<MyOrdersDataModel> cancelledItems = [
  MyOrdersDataModel(
    orderID: "#1501",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 1,
    trackingNumber: "IK987362341",
    orderedItems: [],
    subTotal: 11,
    deliveryStatus: "CANCELLED",
    shippingCharges: 0,
    total: 11,
  ),
  MyOrdersDataModel(
    orderID: "#15099",
    date: DateTime.now().toString(),
    deliveryAddress: DeliveryAddress(
      street: "23 Main Street",
      city: "Santa Fe"
    ),
    quantity: 6,
    trackingNumber: "IK987362341",
    orderedItems: [
      
    ],
    subTotal: 175,
    deliveryStatus: "CANCELLED",
    shippingCharges: 0,
    total: 110,
  ),
];