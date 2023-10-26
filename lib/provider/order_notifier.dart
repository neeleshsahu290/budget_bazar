import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/orders/model/order_model_data.dart';

class OrderNotifier extends BaseNotifier {
  final Repository _repository = Repository();
  AsyncValue<List<OrderModelData>> _orderList = const AsyncValue.loading();
  AsyncValue<List<OrderModelData>> get orderList => _orderList;

  getOrderList({
    isRefreshing = false,
  }) async {
    if (isRefreshing) {
      _orderList = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.userOrderList();
    if (response['status'] == success) {
      _orderList = AsyncValue.data(response['data']);
    } else {
      _orderList = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }
}
