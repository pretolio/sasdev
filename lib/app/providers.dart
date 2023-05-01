

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'presentation/controllers/home_controller.dart';
import 'presentation/controllers/login_controller.dart';


class Providers {

  static List<SingleChildWidget> listDefault(){
    return [
      ChangeNotifierProvider(
          create: (_)=>  LoginController()
      ),
      ChangeNotifierProvider(
          create: (_)=>  HomeController()
      ),
    ];
  }

}