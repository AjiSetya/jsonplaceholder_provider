import 'package:flutter/foundation.dart';
import 'package:jsonplaceholder_provider/core/enums/viewstate.dart';
import 'package:jsonplaceholder_provider/core/services/authentication_service.dart';
import 'package:jsonplaceholder_provider/core/viewmodels/base_model.dart';
import 'package:jsonplaceholder_provider/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  String errorMessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);
    if(userId == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success =  await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}