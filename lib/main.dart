import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readexcel/home_screen.dart';
import 'package:readexcel/users.dart';




void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('usersBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
