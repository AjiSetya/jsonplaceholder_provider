import 'package:flutter/material.dart';
import 'package:jsonplaceholder_provider/core/enums/viewstate.dart';
import 'package:jsonplaceholder_provider/core/viewmodels/login_model.dart';
import 'package:jsonplaceholder_provider/locator.dart';
import 'package:jsonplaceholder_provider/ui/shared/app_colors.dart';
import 'package:jsonplaceholder_provider/ui/views/base_view.dart';
import 'package:jsonplaceholder_provider/ui/widgets/login_header.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
                validationMessage: model.errorMessage,
                controller: controller),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        Navigator.pushNamed(context, '/');
                      }
                    })
          ],
        ),
      ),
    );
  }
}
