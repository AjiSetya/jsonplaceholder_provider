import 'package:get_it/get_it.dart';
import 'package:jsonplaceholder_provider/core/viewmodels/login_model.dart';

import 'core/services/api.dart';
import 'core/services/authentication_service.dart';
import 'core/services/posts_service.dart';
import 'core/viewmodels/comments_model.dart';
import 'core/viewmodels/home_model.dart';
import 'core/viewmodels/like_button_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PostsService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => LikeButtonModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}