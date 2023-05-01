

import 'package:flutter/material.dart';


class LoginController extends ChangeNotifier {


  Future<bool> singin(BuildContext context, {required String user, required String pass}) async {
    if(user.toLowerCase() == 'gabriel@email.com' && pass == '123456'){
      return true;
    }
    throw 'Invalid email or password';
  }
}