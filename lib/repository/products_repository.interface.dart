import '../models/product_data_model.dart';

abstract class IproductsRepository {
  Future<List<ProductDataModel>> getAllProducts();
}
