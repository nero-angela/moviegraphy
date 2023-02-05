import 'package:prography/core/base/base_view_model.dart';

class MovieDetailPageModel extends BaseViewModel {
  bool _isAppBarCollapsed = false;

  bool get isAppBarCollapsed => _isAppBarCollapsed;

  set isAppBarCollapsed(bool isAppBarCollapsed) {
    if (_isAppBarCollapsed != isAppBarCollapsed) {
      _isAppBarCollapsed = isAppBarCollapsed;

      notifyListeners();
    }
  }
}
