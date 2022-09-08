import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsService(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'home',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'product': (context) => ProductScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.teal,
          centerTitle: true,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          elevation: 1,
        ),
      ),
    );
  }
}
