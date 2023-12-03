part of 'product_details_page_bloc.dart';

@immutable
sealed class ProductDetailsPageEvent {}

class ProductDetailsPageInitialEvent extends ProductDetailsPageEvent {}

class AddToCartEvent extends ProductDetailsPageEvent {
  final CartItemsModel productData;

  AddToCartEvent({required this.productData});
}
