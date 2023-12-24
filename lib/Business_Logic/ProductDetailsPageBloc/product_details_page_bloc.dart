import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:fluxestore/data/cart_items.dart';
import 'package:meta/meta.dart';

import '../../models/cart_items_model.dart';

part 'product_details_page_event.dart';
part 'product_details_page_state.dart';

class ProductDetailsPageBloc
    extends Bloc<ProductDetailsPageEvent, ProductDetailsPageState> {
  ProductDetailsPageBloc() : super(ProductDetailsPageInitialState()) {
    on<ProductDetailsPageInitialEvent>(productDetailsPageInitialEvent);
    on<AddToCartEvent>(addToCartEvent);
  }

  FutureOr<void> addToCartEvent(
      AddToCartEvent event, Emitter<ProductDetailsPageState> emit) {
    
    cartItems.add(event.productData);
    emit(AddToCartActionState(
      subTotal: subTotal(cartItems),
      cartItems: cartItems));
  }

  FutureOr<void> productDetailsPageInitialEvent(
      ProductDetailsPageInitialEvent event,
      Emitter<ProductDetailsPageState> emit) {
    emit(ProductDetailsPageSuccessState());
  }
}
