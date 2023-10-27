part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageEvent {}

class LandingPageTabChangeEvent extends LandingPageEvent {
  final int tabIndex;

  LandingPageTabChangeEvent({required this.tabIndex});
}
