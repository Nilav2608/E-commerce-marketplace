import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/products_repository.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomeInitial()) {
    on<HomePageInitialEvent>(homePageInitialEvent);
  }

  FutureOr<void> homePageInitialEvent(
      HomePageInitialEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState());

    var data = await ProductsRepository().getAllProducts();

    emit(HomePageLoadedSuccessState(loadedProductsList: data));
  }
}
