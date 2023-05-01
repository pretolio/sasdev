

import 'package:flutter/material.dart';

import 'enums/routes.dart';
import 'presentation/views/home/home.dart';
import 'presentation/views/login/login.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch (RouteName.stringToRoute(settings.name)) {
      case RouteName.Login :
        return MaterialPageRoute(
            builder: (_) => const LoginView()
        );
      case RouteName.Home :
        return MaterialPageRoute(
            builder: (_) => const HomeView()
        );

      default:
        return _erroRota();
    }
  }


  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            appBar: AppBar(title:const Text("Tela não encontrada!"),),
            body: const Center(
              child: Text("Tela não encontrada!"),
            ),
          );
        }
    );
  }
}