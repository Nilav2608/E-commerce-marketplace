part of 'home_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomeInitial extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedSuccessState extends HomePageState {
  final List<ProductDataModel> loadedProductsList;

  HomePageLoadedSuccessState({required this.loadedProductsList});
}
