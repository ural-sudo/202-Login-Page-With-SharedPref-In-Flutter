import 'package:flutter/material.dart';
import 'package:login/Screens/Auth/login.dart';
import 'package:login/cache/shared_pref_manager.dart';
import 'package:login/main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  
  const HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SharedManager manager = SharedManager();

  String username = "";

  Future<void> getInfo() async {
    final result = await  manager.getShared("username");
    if(result != null){
      setState(() {
        username = result;
      });
    }
  }
  Future<void> removeInfos() async {
    manager.removeShared("username");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("Your username below",style: TextStyle(color: Colors.black,fontSize: 30),),
          ),
          Text(username,style: TextStyle(color: Colors.purple,fontSize: 40),),
          ElevatedButton(onPressed: (){
              removeInfos();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
          }, child: Text("Log Out"))
        ],
      ),
    );
  }
}