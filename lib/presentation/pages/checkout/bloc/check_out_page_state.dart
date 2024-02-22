part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageState {}

abstract class CheckOutPageActionState extends CheckOutPageState {}

class InitialState extends CheckOutPageState{}

class CheckOutPageBlocInitialState extends CheckOutPageState {}

class PageLoadingState extends CheckOutPageActionState {}

class PageLoadedSuccessState extends CheckOutPageState {}

class PaymentPageActionState extends CheckOutPageState {
  final double subTotal;
  final DeliveryAddress address;

  PaymentPageActionState({required this.address,required this.subTotal});
}

class PlaceOrderActionSate extends CheckOutPageState {}

class PaymentCompletedState extends CheckOutPageState {}

class NavigateTohomePageActionState extends CheckOutPageState {}
