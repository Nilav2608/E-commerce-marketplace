part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageEvent {}

class CheckOutInitialEvent extends CheckOutPageEvent{
  
}


class CheckOutPagePaymentEvent extends CheckOutInitialEvent{}

class CheckOutPagePlaceOrderEvent extends CheckOutInitialEvent{}
