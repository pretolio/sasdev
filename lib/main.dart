import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/config.dart';
import 'app/providers.dart';
import 'app/routes.dart';

void main() {

  runApp(
      MultiProvider(
        providers: Providers.listDefault(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sasdev Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Config.priColor,
        colorScheme: ThemeData(useMaterial3: true).colorScheme.copyWith(surfaceTint: Colors.white) ,
        appBarTheme: AppBarTheme(
          color: Colors.white, centerTitle: true, elevation: 2,
          titleTextStyle: TextStyle(color: Config.priColor, fontSize: 18, fontWeight: FontWeight.bold),
          actionsIconTheme: IconThemeData(color: Config.priColor)
        )
      ),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      initialRoute: "/",
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
