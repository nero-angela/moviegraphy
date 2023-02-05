import 'package:prography/core/helper/network_helper.dart';
import 'package:prography/src/repository/remote_movie_repository.dart';
import 'package:prography/src/service/theme_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

mixin ProviderHelper {
  static final List<SingleChildWidget> _repositoryProvider = [
    Provider(
      create: (context) => RemoteMovieRepository(dio: NetworkHelper.dio),
    ),
  ];

  static final List<SingleChildWidget> _serviceProvider = [
    ChangeNotifierProvider(create: (context) => ThemeService()),
  ];

  static final List<SingleChildWidget> providers = [
    ..._repositoryProvider,
    ..._serviceProvider,
  ];
}
