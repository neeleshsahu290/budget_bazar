import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/checkout/model/user_details_model.dart';
import 'package:jds_new/util/common_utils.dart';

class CheckoutNotifier extends BaseNotifier {
  AsyncValue<UserDetailsModel> _userData = const AsyncValue.loading();
  AsyncValue<UserDetailsModel> get userData => _userData;

  int currentIndex = 0;

  bool isAddreq = false;

  final Repository _repository = Repository();

  getUserDetails({
    isRefreshing = false,
  }) async {
    if (isRefreshing) {
      _userData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getUserDetails();
    if (response['status'] == success) {
      var ls = response['data'] as List<UserDetailsModel>;
      if (ls.isNotEmpty) {
        _userData = AsyncValue.data(ls.first);
      } else {
        _userData = AsyncValue.error("no data found", StackTrace.current);
      }
    } else {
      _userData = AsyncValue.error(response['error'], StackTrace.current);
    }
    isAddreq = false;
    notifyListeners();
  }

  updateAddressReq(isreq) {
    isAddreq =isreq ;
    notifyListeners();
  }

  Future<bool> checkoutOrder() async {
    final response = await _repository.checkoutOrder();
    if (response['status'] == success) {
      return true;
    } else {
      showSnackBar(message: response['error']);
    }
    return false;
  }

  deleteAddress(customerShippingAddressId) async {
    final response = await _repository.removeAddress(
        customerShippingAddressId: customerShippingAddressId);
    if (response['status'] == success) {
    await  getUserDetails();
      //  return true;
    } else {
      showSnackBar(message: response['error']);
    }
    //return false;
  }
}
