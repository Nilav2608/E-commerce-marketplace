import '../../models/banners_data_model.dart';
import '../../models/product_data_model.dart';

abstract class IproductsRepository {
  Future<List<ProductDataModel>> getAllProducts();
  Future<List<BannersDataModel>> getAllBanners();
  Future<List<ProductDataModel>>  getRecommendations();
}
