import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/data/cart_items.dart';
import 'package:fluxestore/models/CartItemsModel.dart';
// ignore: unused_import
import 'package:fluxestore/models/productModel.dart';
import 'package:meta/meta.dart';

part 'cart_page_event.dart';
part 'cart_page_state.dart';

class CartPageBloc extends Bloc<CartPageEvent, CartPageState> {
  CartPageBloc() : super(CartPageInitialState()) {
    on<CartPageInitialEvent>(cartPageInitialEvent);
    on<RemoveAnItemFromCartEvent>(removeAnItemFromCartEvent);
  }

  FutureOr<void> cartPageInitialEvent(
      CartPageInitialEvent event, Emitter<CartPageState> emit) {
       
 
      emit(CartSuccessState(cartSuccessData: cartItems));
  }

  FutureOr<void> removeAnItemFromCartEvent(
      RemoveAnItemFromCartEvent event, Emitter<CartPageState> emit) {
    cartItems.remove(event.product);

    emit(CartSuccessState(cartSuccessData: cartItems));
  }
}
