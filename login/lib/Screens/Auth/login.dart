

import 'package:flutter/material.dart';
import 'package:login/Screens/homepage.dart';
import 'package:login/cache/shared_pref_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String headline = "WELCOME";
  final String subTitle = "Enter your information below";
  final String imagePath =  "assets/images/background.png";
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController tfusername = TextEditingController();
  TextEditingController tfpassword = TextEditingController();

  
   final SharedManager manager = SharedManager();

  
  Future<void> cahceInfo() async {
    manager.saveShared("username", tfusername.text);
    manager.saveShared("password", tfpassword.text);
  }
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          
          SizedBox(
            height: size.height,
            child: Image.asset(imagePath,fit: BoxFit.fill,)
          ),
          WelcomeTexts(size: size, headline: headline, subTitle: subTitle),
          Padding(
            padding: EdgeInsets.only(top:size.height*0.40,right: size.width*0.05,left: size.width*0.05),
            child: Form(
              key: key,
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormFieldContainer(size: size,formInfo: "username",controller: tfusername,),
                    Padding(
                      padding:  EdgeInsets.only(top: size.height*0.03),
                      child: TextFormFieldContainer(
                        controller:tfpassword ,
                        obscureText: true,
                        size: size,formInfo: "Password",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height*0.02),
                      child: Align(
                        alignment:Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: LoginPageColors.white
                          ),
                          onPressed: () async{
                            key.currentState?.validate();
                            cahceInfo();
                            if(entryControl.control(tfusername.text, tfpassword.text)){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())); 
                            }
                          },
                          child: Icon(Icons.arrow_right_alt_rounded,color:Theme.of(context).iconTheme.color)
                        )
                      ),
                    )
                  ],
                ),
              ), 
            ),
          ),
        ],
      ),
    );
  }
}

class entryControl {
  static bool control(String username ,String password){

    if(username.isNotEmpty && password.isNotEmpty ){
      return true;
    }else{
      return false;
    }
  }
}

class TextFormFieldContainer extends StatelessWidget {
   TextFormFieldContainer({
    Key? key,
    required this.size,
    required this.formInfo,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);
  final TextEditingController controller;
  final Size size;
  final String formInfo;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(bottom:size.height*0.01),
          child: Text(formInfo,style: Theme.of(context).textTheme.subtitle2,),
        ),
        Container(
          decoration: BoxDecoration(
            color: LoginPageColors.opacityBlack,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.2,color: LoginPageColors.opacityBlack)
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:size.width*0.05 ),
            child: TextFormField(
              controller:controller,
              obscuringCharacter: "*",
              obscureText: obscureText,
              validator: (value) {
                bool isEmpty = FormValidator.isEmpty(value);
                if(isEmpty == true){
                  return "Cant be null";
                }
              },
              decoration:InputDecoration(
                border: InputBorder.none
              )
            )
          )
        )
      ],
    );
  }
}


class FormValidator {
  
  static bool isEmpty( String? value){
    if(value?.isEmpty == false){
      return false;
    }else{
      return true;
    }
  }
}

class LoginPageColors{
  static final Color opacityBlack = Colors.black.withOpacity(0.2);
  static final Color white = Colors.white;
}


class WelcomeTexts extends StatelessWidget {
  const WelcomeTexts({
    Key? key,
    required this.size,
    required this.headline,
    required this.subTitle,
  }) : super(key: key);

  final Size size;
  final String headline;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top: size.height*0.2),
      child: Center(
        child: Column(
          children: [
            Text(headline,style: Theme.of(context).textTheme.headline4,),
            Padding(
              padding:EdgeInsets.only(top: size.height*0.02),
              child: Text(subTitle,style: Theme.of(context).textTheme.subtitle1,),
            ),
          ]
        ),
      ),
    );
  }
}