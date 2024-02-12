import 'package:fluxestore/models/user_data_model.dart';

abstract class IUserRepository {
  Future<Map<String, dynamic>>  getUserDetails(String userId);
}
