part of 'home_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomeInitial extends HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedSuccessState extends HomePageState {
  final List<ProductDataModel> loadedProductsList;
  final List<BannersDataModel> loadedBannersList;

  HomePageLoadedSuccessState({required this.loadedProductsList,required this.loadedBannersList,});
}
