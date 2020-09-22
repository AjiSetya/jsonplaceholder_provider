import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import 'package:jsonplaceholder_provider/core/services/authentication_service.dart';
import 'package:jsonplaceholder_provider/locator.dart';
import 'package:jsonplaceholder_provider/ui/router.dart';
import 'package:provider/provider.dart';

import 'core/models/user.dart';

void main() {
  Stetho.initialize();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
