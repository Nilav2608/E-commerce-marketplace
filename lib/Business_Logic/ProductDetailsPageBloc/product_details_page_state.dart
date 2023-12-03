part of 'product_details_page_bloc.dart';

@immutable
sealed class ProductDetailsPageState {}

final class ProductDetailsPageInitialState extends ProductDetailsPageState {}

abstract class ProductDetailsPageActionState extends ProductDetailsPageState {}


class ProductDetailsPageSuccessState extends ProductDetailsPageState{}

class AddToCartActionState extends ProductDetailsPageActionState {
  final List<CartItemsModel> cartItems;

  AddToCartActionState({required this.cartItems});
}
