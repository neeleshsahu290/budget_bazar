import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/provider/base_notifier.dart';
import 'package:jds_new/repository/base_repository.dart';
import 'package:jds_new/screens/search/model/search_data.dart';

class SearchScreenNotifier extends BaseNotifier {
  AsyncValue<List<SearchData>> _itemsList = const AsyncValue.loading();
  AsyncValue<List<SearchData>> get searchItemsList => _itemsList;

  final Repository _repository = Repository();

  getSearchData({isRefreshing = false, required var keyword}) async {
    if (isRefreshing) {
      _itemsList = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.searchProducts(
      keyword: keyword,
    );
    if (response['status'] == success) {
      _itemsList = AsyncValue.data(response['data']);
    } else {
      _itemsList = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }
}
