import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:fluxestore/repository/SearchRepo/search.repository.dart';
import 'package:meta/meta.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(SearchPageInitial()) {
    on<SearchPageInitialEvent>(_searchPageInitialEvent);
    on<SearchPageOnSearchEvent>(_searchPageOnSearchEvent);
  }

  FutureOr<void> _searchPageInitialEvent(
      SearchPageInitialEvent event, Emitter<SearchPageState> emit) {
    emit(SearchPageShowCaseState());
  }

  FutureOr<void> _searchPageOnSearchEvent(
      SearchPageOnSearchEvent event, Emitter<SearchPageState> emit) async {
    emit(SearchLoadingState());
    var results = await SearchRepository().searchProducts(event.query);
    if (results.isNotEmpty) {
      emit(SearchLoadedSucessstate(responseItems: results));
    } else {
      await Future.delayed(const Duration(seconds: 5));
      emit(SearchPageNoResponseState());
    }
  }
}
