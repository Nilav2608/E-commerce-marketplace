part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageEvent {}

class CheckOutInitialEvent extends CheckOutPageEvent {
  // final MyOrdersDataModel dataModel;

  // CheckOutInitialEvent(
  //   {required MyOrdersDataModel dataModel}
  //   // {
  //   // required this.dataModel
  //   // }
  //   );
}

class CheckOutPagePaymentEvent extends CheckOutInitialEvent {
  final double subTotal;
    final DeliveryAddress addressData;
  CheckOutPagePaymentEvent({required this.addressData,required this.subTotal});
}

class CheckOutPagePlaceOrderEvent extends CheckOutInitialEvent {
  final MyOrdersDataModel dataModel;
   final DeliveryAddress addressData;

  CheckOutPagePlaceOrderEvent(  {required this.addressData,required this.dataModel, });
}

class NavigateBackToHomePageEvent extends CheckOutInitialEvent {}
