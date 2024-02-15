part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageState {}

abstract class CheckOutPageActionState extends CheckOutPageState {}

// final class InitialState extends CheckOutPageState{}

final class CheckOutPageBlocInitialState extends CheckOutPageState {}

class PageLoadingState extends CheckOutPageState {}

class PageLoadedSuccessState extends CheckOutPageState {}

class PaymentPageActionState extends CheckOutPageState {
  final double subTotal;
  final DeliveryAddress address;

  PaymentPageActionState({required this.address,required this.subTotal});
}

class PlaceOrderActionSate extends CheckOutPageState {}

class PaymentCompletedState extends CheckOutPageState {}

class NavigateTohomePageActionState extends CheckOutPageState {}
