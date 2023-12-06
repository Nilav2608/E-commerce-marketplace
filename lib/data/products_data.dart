import 'package:flutter/material.dart';
import 'package:fluxestore/models/ProducDatatModel.dart';

final List<ProducDatatModel> productsList = [
  ProducDatatModel(
      id: 3,
      productName: "Street Wear",
      descriptionn: "xxxxxxx",
      price: 80.00,
      imageUrl:
          "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D",
      //  imageUrl: "https://firebasestorage.googleapis.com/v0/b/fluxestore-b6cb3.appspot.com/o/StreetWear.png?alt=media&token=f40e7bb5-f8b7-4f06-a8e1-1a32da385eb9",
      // imageUrl: "assets/images/StreetWear.svg",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4
      ),
  ProducDatatModel(
      id: 4,
      productName: "Elegant Dress",
      descriptionn: "xxxxxxx",
      price: 75.00,
      imageUrl:
          "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D",
      // imageUrl: "https://firebasestorage.googleapis.com/v0/b/fluxestore-b6cb3.appspot.com/o/TurtleNeck.png?alt=media&token=25a11671-3246-4164-bb1c-c8f5ebb925de",
      // imageUrl: "assets/images/ElagantDress.svg",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4),
  ProducDatatModel(
      id: 1,
      productName: "Turtleneck Sweater",
      descriptionn: "xxxxxxx",
      price: 39.99,
      imageUrl:
          "https://images.unsplash.com/photo-1562572159-4efc207f5aff?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGNsb3RoaW5nJTIwbW9kZWwlMjBwb3NlfGVufDB8fDB8fHww",
      // imageUrl: "assets/images/TurtleNeck.svg",
      // imageUrl: "https://img.freepik.com/free-vector/graphic-designer-workplace_23-2148117172.jpg?size=626&ext=jpg&ga=GA1.1.851752253.1698389242&semt=ais",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4),
  ProducDatatModel(
      id: 2,
      productName: "Long Sleeve Dress",
      descriptionn: "xxxxxxx",
      price: 45.00,
      //  imageUrl: "https://firebasestorage.googleapis.com/v0/b/fluxestore-b6cb3.appspot.com/o/LongSleeve.svg?alt=media&token=78afa31e-730e-4a83-9f32-2b3ed8ce335f",
      imageUrl:
          "https://images.unsplash.com/photo-1579101098056-6bf296535b8e?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzB8fGZmYXNoaW9uJTIwbW9kZWwlMjBwb3NlfGVufDB8fDB8fHww",
      // imageUrl: "assets/images/LongSleeve.svg",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4),
];

final List<ProducDatatModel> recommendedList = [
   ProducDatatModel(
      id: 2,
      productName: "White fashion hoodie",
      descriptionn: "xxxxxxx",
      price: 29.00,
      //  imageUrl: "https://firebasestorage.googleapis.com/v0/b/fluxestore-b6cb3.appspot.com/o/LongSleeve.svg?alt=media&token=78afa31e-730e-4a83-9f32-2b3ed8ce335f",
      imageUrl:
          "https://images.unsplash.com/photo-1599839614778-a0ee8a16f2a9?auto=format&fit=crop&w=1080&h=915",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4),

      ProducDatatModel(
      id: 2,
      productName: "Cotton T-shirts",
      descriptionn: "xxxxxxx",
      price: 30.00,
      //  imageUrl: "https://firebasestorage.googleapis.com/v0/b/fluxestore-b6cb3.appspot.com/o/LongSleeve.svg?alt=media&token=78afa31e-730e-4a83-9f32-2b3ed8ce335f",
      imageUrl:
          "https://rmnint.com/wp-content/uploads/2022/07/product-01-a.jpg",
      // imageUrl: "assets/images/LongSleeve.svg",
      sizes: ["S", "M", "L", "XL"],
      colors: [Colors.orangeAccent,Colors.black,Colors.pink],
      ratings: 4),
];

