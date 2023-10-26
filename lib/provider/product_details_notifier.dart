import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/product_details/model/product_data.dart';

class ProductDetailsNotifier extends BaseNotifier {
  AsyncValue<ProductData> _productData = const AsyncValue.loading();
  AsyncValue<ProductData> get productData => _productData;

  int currentIndex = 0;
  bool isAdded = false;

  final Repository _repository = Repository();

  getProductData({isRefreshing = false, required productId}) async {
    if (isRefreshing) {
      _productData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getProductData(productId: productId);
    if (response['status'] == success) {
      var ls = response['data'] as List<ProductData>;
      if (ls.isNotEmpty) {
        _productData = AsyncValue.data(ls.first);
      } else {
        _productData = AsyncValue.error("no data found", StackTrace.current);
      }
    } else {
      _productData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }

  addProductToCart({required var quant}) async {
    final response = await _repository.addProductToCart(
        productUnitTypeId: _productData
            .value?.productsUnitTypeList?[currentIndex].productsUnitTypeId,
        quantity: quant,
        productId: _productData.value?.productsId);
    if (response['status'] == success) {
      isAdded = true;
    } else {
      //  _productData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }

  changeQuantSelect(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
