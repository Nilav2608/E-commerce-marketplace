part of 'cart_page_bloc.dart';

@immutable
sealed class CartPageEvent {}

class CartPageInitialEvent extends CartPageEvent {}

class RemoveAnItemFromCartEvent extends CartPageEvent {
  final CartItemsModel product;

  RemoveAnItemFromCartEvent({required this.product});
}
