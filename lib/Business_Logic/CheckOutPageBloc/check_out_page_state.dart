part of 'check_out_page_bloc.dart';

@immutable
sealed class CheckOutPageState {}

abstract class CheckOutPageActionState extends CheckOutPageState{}

final class CheckOutPageBlocInitialState extends CheckOutPageState {}



class PageLoadingState extends CheckOutPageState{}


class PaymentPageActionState extends CheckOutPageActionState{}

class PlaceOrderActionSate extends CheckOutPageActionState{}

class ContinueShoppingActionState extends CheckOutPageActionState{}



