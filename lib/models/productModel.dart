class ProducDatatModel {
  int? id;
  String? productName;
  String? imageUrl;
  String? price;
  String? descriptionn;
  int? ratings;
  List<String>? sizes;

  ProducDatatModel(
      {this.id,
      this.productName,
      this.imageUrl,
      this.price,
      this.descriptionn,
      this.ratings,
      this.sizes});

  ProducDatatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    descriptionn = json['descriptionn'];
    ratings = json['ratings'];
    sizes = json['sizes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['imageUrl'] = imageUrl;
    data['price'] = price;
    data['descriptionn'] = descriptionn;
    data['ratings'] = ratings;
    data['sizes'] = sizes;
    return data;
  }

}
