import 'package:netflixclone/core/notifiers/authentication.notifier.dart';
import 'package:netflixclone/core/notifiers/movie.notifier.dart';
import 'package:netflixclone/core/services/cache_data.service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [...remoteProviders];

List<SingleChildWidget> remoteProviders = [
  ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
  ChangeNotifierProvider(create: (_) => MovieNotifier()),
  ChangeNotifierProvider(create: (_) => CacheNotifier())
];
