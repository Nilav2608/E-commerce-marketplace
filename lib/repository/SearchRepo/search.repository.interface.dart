import 'package:fluxestore/models/product_data_model.dart';

abstract class ISearchRepository {
  Future<List<ProductDataModel>> searchProducts(String query);
}
