import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageInitial> {
  LandingPageBloc() : super(LandingPageInitial(tabIndex: 0)) {
    on<LandingPageTabChangeEvent>(landingPageTabChangeEvent);
  }

  FutureOr<void> landingPageTabChangeEvent(
      LandingPageTabChangeEvent event, Emitter<LandingPageState> emit) {
    emit(TabChangeActionState(tabIndex: event.tabIndex));
  }
}
