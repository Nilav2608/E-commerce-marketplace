part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageState {}

 class LandingPageInitial extends LandingPageState {
  final int tabIndex;

  LandingPageInitial({required this.tabIndex});
}


final class TabChangeActionState extends LandingPageInitial{
   TabChangeActionState({required super.tabIndex});

  
}