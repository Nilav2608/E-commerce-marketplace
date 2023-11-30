import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_out_page_event.dart';
part 'check_out_page_state.dart';

class CheckOutPageBloc extends Bloc<CheckOutPageEvent, CheckOutPageState> {
  CheckOutPageBloc() : super(CheckOutPageBlocInitialState()) {
    on<CheckOutInitialEvent>(checkOutInitialEvent);
  }

  Future<FutureOr<void>> checkOutInitialEvent(
      CheckOutInitialEvent event, Emitter<CheckOutPageState> emit) async {
    emit(PageLoadingState());
    await Future.delayed(const Duration(seconds: 3000));
    emit(CheckOutPageBlocInitialState());
  }
}
