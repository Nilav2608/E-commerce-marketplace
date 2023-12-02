part of 'product_details_page_bloc.dart';

@immutable
sealed class ProductDetailsPageEvent {}

class ProductDetailsPageInitialEvent extends ProductDetailsPageEvent {}

class AddToCartEvent extends ProductDetailsPageEvent {
  final ProducDatatModel productData;

  AddToCartEvent({required this.productData});
}
