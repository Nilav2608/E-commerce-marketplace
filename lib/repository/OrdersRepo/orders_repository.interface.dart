

import 'package:fluxestore/models/my_orders_data_model.dart';

abstract class IOrdersrepository{
   Future<Map<String, dynamic>> newOrder(MyOrdersDataModel orderedItem);
}