import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluxestore/models/delivery_address_model.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/repository/OrdersRepo/orders_repository.dart';

part 'check_out_page_event.dart';
part 'check_out_page_state.dart';

class CheckOutPageBloc extends Bloc<CheckOutPageEvent, CheckOutPageState> {
  CheckOutPageBloc() : super(CheckOutPageBlocInitialState()) {
    on<CheckOutInitialEvent>(checkOutInitialEvent);
    on<CheckOutPagePaymentEvent>(checkOutPaymentEvent);
    on<CheckOutPagePlaceOrderEvent>(checkOutPagePlaceOrderEvent);
    on<NavigateBackToHomePageEvent>(navigateBackToHomePageEvent);
  }

  Future<FutureOr<void>> checkOutInitialEvent(
      CheckOutInitialEvent event, Emitter<CheckOutPageState> emit) async {
    emit(PageLoadingState());
    // await Future.delayed(const Duration(seconds: 3));
    emit(CheckOutPageBlocInitialState());
  }

  Future<FutureOr<void>> checkOutPaymentEvent(
      CheckOutPagePaymentEvent event, Emitter<CheckOutPageState> emit) async {
    emit(PageLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(PaymentPageActionState(
        subTotal: event.subTotal, address: event.addressData));
  }

  FutureOr<void> checkOutPagePlaceOrderEvent(CheckOutPagePlaceOrderEvent event,
      Emitter<CheckOutPageState> emit) async {
    emit(PageLoadingState());

    event.dataModel.deliveryAddress = event.addressData;
    event.dataModel.paymentMethod = event.paymentMode;

    var results = await OrdersRepository().newOrder(event.dataModel);
    if (results['status']) {
      emit(PaymentCompletedState());
    }
  }

  FutureOr<void> navigateBackToHomePageEvent(NavigateBackToHomePageEvent event,
      Emitter<CheckOutPageState> emit) async {
    emit(PageLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    emit(NavigateTohomePageActionState());
  }
}
