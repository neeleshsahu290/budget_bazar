import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/categories/model/category_data.dart';

class CategoryScreenNotifier extends BaseNotifier {
  AsyncValue<CategoryData> _categoryData = const AsyncValue.loading();
  AsyncValue<CategoryData> get categoryData => _categoryData;

  final Repository _repository = Repository();

  getCategoryData(
      {isRefreshing = false,
      required var productCatId,
      required var productMainCatId}) async {
    if (isRefreshing) {
      _categoryData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getCategoryData(
        productCatId: productCatId, productMainCatId: productMainCatId);
    if (response['status'] == success) {
      var ls = response['data'] as List<CategoryData>;
      if (ls.isNotEmpty) {
        _categoryData = AsyncValue.data(ls.first);
      } else {
        _categoryData = AsyncValue.error("no data found", StackTrace.current);
      }
    } else {
      _categoryData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }
}
