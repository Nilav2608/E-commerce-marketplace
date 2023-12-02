part of 'cart_page_bloc.dart';

@immutable
sealed class CartPageEvent {}

class CartPageInitialEvent extends CartPageEvent {}

class RemoveAnItemFromCartEvent extends CartPageEvent {
  final ProducDatatModel product;

  RemoveAnItemFromCartEvent({required this.product});
}
