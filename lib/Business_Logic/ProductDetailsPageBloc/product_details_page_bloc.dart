import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_details_page_event.dart';
part 'product_details_page_state.dart';

class ProductDetailsPageBloc extends Bloc<ProductDetailsPageEvent, ProductDetailsPageState> {
  ProductDetailsPageBloc() : super(ProductDetailsPageInitial()) {
    on<ProductDetailsPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
