import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/shopping_cart/model/cart_data.dart';

class CartNotifier extends BaseNotifier {
  AsyncValue<CartData> _cartData = const AsyncValue.loading();
  AsyncValue<CartData> get cartData => _cartData;

  final Repository _repository = Repository();

  getCartData({
    isRefreshing = false,
  }) async {
    if (isRefreshing) {
      _cartData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getCartData();
    if (response['status'] == success) {
      var ls = response['data'] as List<CartData>;
      if (ls.isNotEmpty) {
        _cartData = AsyncValue.data(ls.first);
      } else {
        _cartData = const AsyncValue.data(CartData(cartItemData: []));
      }
    } else {
      _cartData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }

  addProductToCart({required var quant, required int index}) async {
    _cartData.value?.cartItemData?[index].qty = quant;
    notifyListeners();

    var item = _cartData.value?.cartItemData?[index];
    final response = await _repository.addProductToCart(
        productUnitTypeId: item?.productsUnitTypeId,
        quantity: quant,
        productId: item?.productsId);
    if (response['status'] == success) {
    } else {}
    notifyListeners();
  }

  removeProductToCart({required var quant, required int index}) async {
    var item = _cartData.value?.cartItemData?[index];
    final response = await _repository.removeProductToCart(
        productUnitTypeId: item?.productsUnitTypeId,
        quantity: quant,
        productId: item?.productsCartId);
    if (response['status'] == success) {
      await getCartData();
    } else {}
    notifyListeners();
  }
}
