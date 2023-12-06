import '../models/CartItemsModel.dart';

List<CartItemsModel> cartItems = [];

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
