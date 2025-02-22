import 'package:flutter/cupertino.dart';
import 'package:loginflutter/homepage.dart';

void main(){
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
        brightness: Brightness.dark
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  String error = "";
  bool rememberMe = false;

  bool isLogin(String username, String password) {
    if(username == "admin" && password == "123"){
      setState(() {
        _username.text = "";
        _password.text = "";
        error = "";
      });
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: Padding(
      padding: const EdgeInsets.all(13.0),
      child:SafeArea(child: Column(
        children: [
          SizedBox(height: 150,),
          Row(
            children: [
              Text('Threads', style: TextStyle(color: CupertinoColors.systemBlue, fontWeight: FontWeight.bold, fontSize: 30),),
            ],
          ),
          SizedBox(height: 20,),
          CupertinoTextField(
            controller: _username,
            placeholder: "Username",
            padding: EdgeInsets.all(13.0),
            prefix: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(CupertinoIcons.person, color: CupertinoColors.systemGrey),
            ),
          ),
          SizedBox(height: 5,),
          CupertinoTextField(
            controller: _password,
            placeholder: "Password",
            padding: EdgeInsets.all(10.0),
            obscureText: hidePassword,
            prefix: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(CupertinoIcons.lock, color: CupertinoColors.systemGrey),
            ),
            suffix: CupertinoButton(child: Icon(hidePassword? CupertinoIcons.eye:  CupertinoIcons.eye_slash, size: 20,), onPressed:() {
              setState(() {
                hidePassword = !hidePassword;
              });
            }),
          ),
          SizedBox(height: 20,),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: CupertinoColors.systemBlue,
                borderRadius: BorderRadius.circular(8)
            ),
            child: CupertinoButton(child: Text('Login', style: TextStyle(color: CupertinoColors.white),), onPressed:(){
              isLogin(_username.text, _password.text) ?

              Navigator.push(context,CupertinoPageRoute(builder: (context)=> HomeScreen()))
                  : setState(() {
                _password.text = "";
                error = "Incorrect Username or Password";
              });;
            }),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text("Forgot Password?", style: TextStyle(color: CupertinoColors.systemBlue)),
                onPressed: () {
                  // Handle forgot password action
                },
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text("$error", style: TextStyle(color: CupertinoColors.destructiveRed),),

          SizedBox(height: 10,),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.systemBlue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: CupertinoButton(child: Text('Create a new account', style: TextStyle(color: CupertinoColors.white),), onPressed:(){})
          ),
        ],

      )),

    ));
  }
}
