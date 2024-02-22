part of 'landing_page_bloc.dart';

@immutable
sealed class LandingPageState {}

class LandingPageInitial extends LandingPageState {
  final int tabIndex;
  final String appBarName;

  LandingPageInitial( {required this.appBarName,required this.tabIndex});
}

// class LandingPageLoadedState extends LandingPageState {
//   final String appBarName;
//   final int tabIndex;
//   final dynamic userData; // Adjust the type according to your network response

//   LandingPageLoadedState({
//     required this.appBarName,
//     required this.tabIndex,
//     required this.userData,
//   });

//   @override
//   List<Object?> get props => [appBarName, tabIndex, userData];
// }


 class TabChangeActionState extends LandingPageInitial {
  TabChangeActionState( {required super.appBarName,required super.tabIndex});
}
