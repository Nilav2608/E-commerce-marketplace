import 'package:flutter/material.dart';
import '../models/product_data_model.dart';

final List<ProductDataModel> productsList = [
  ProductDataModel(
      id: "3",
      productName: "Turtleneck Sweater",
      descriptionn: "xxxxxxx",
      price: 39.99,
      imageUrl:
          "https://admin.pixelstrap.com/enzo/assets/images/ecommerce/07.jpg",
      sizes: ["S", "M", "L", "XL"], //{"S" :1, "M":1, "L":1, "XL":1,},
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
  ProductDataModel(
      id: "3",
      productName: "Long Sleeve Dress",
      descriptionn: "xxxxxxx",
      price: 80.00,
      imageUrl:
          "https://autos.divloo.com/wp-content/uploads/2022/09/clothingstore2-woman-pic5.webp",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
  ProductDataModel(
      id: "3",
      productName: "Sportwear Set",
      descriptionn: "xxxxxxx",
      price: 75.00,
      imageUrl:
          "https://assets.ajio.com/medias/sys_master/root/20210921/uS8b/6149fc1bf997ddce89d478cd/-473Wx593H-469008747-black-MODEL4.jpg",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
  ProductDataModel(
      id: "3",
      productName: "Elegant Dress",
      descriptionn: "xxxxxxx",
      price: 39.99,
      imageUrl:
          "https://www.hawtcelebs.com/wp-content/uploads/2021/05/gigi-paris-for-shein-accessoires-2021-5.jpg",
      // "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D"
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
];

final List<ProductDataModel> recommendedList = [
  ProductDataModel(
      id: "3",
      productName: "White fashion hoodie",
      descriptionn: "xxxxxxx",
      price: 29.00,
      imageUrl:
          "https://images.unsplash.com/photo-1599839614778-a0ee8a16f2a9?auto=format&fit=crop&w=1080&h=915",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
  ProductDataModel(
      id: "3",
      productName: "Cotton T-shirts",
      descriptionn: "xxxxxxx",
      price: 30.00,
      imageUrl:
          "https://images.unsplash.com/photo-1583744946564-b52ac1c389c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHQlMjBzaGlydHxlbnwwfHwwfHx8MA%3D%3D",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent, Colors.black, Colors.pink],
      favorite: false,
      ratings: 4),
];
