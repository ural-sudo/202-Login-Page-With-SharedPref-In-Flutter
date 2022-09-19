import 'package:flutter/material.dart';
import 'package:login/Screens/homepage.dart';
import 'package:login/cache/shared_pref_manager.dart';
import 'package:login/theme/theme_light.dart';

import 'Screens/Auth/login.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  
  MyApp({Key? key,}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedManager manager = SharedManager();

  
  bool sonuc = false;
  Future<void> getUserInfo() async {
    final username = await manager.getShared("username");
    final password = await manager.getShared("password");

    if (username != null && password != null){
      setState(() {
        sonuc= true;
      });
    }
  } 

  @override
  Widget build(BuildContext context) {
   
      getUserInfo();
    
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme:LightTheme().theme,
      home: sonuc ? HomePage() : LoginPage(),
    );
  }
}
