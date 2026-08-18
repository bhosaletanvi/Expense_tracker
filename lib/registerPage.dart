import 'package:expense_wise/loginpage.dart';
import 'package:flutter/material.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formKey = GlobalKey<FormState>();
      Map user={};

  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  void addUsers(){
    user["name"]=namecontroller.text;
    user["password"]=passwordcontroller.text;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child:Column(
          children: [
            TextFormField(
              controller: namecontroller,
            ),
            TextFormField(
              controller: passwordcontroller,
            ),
            ElevatedButton(onPressed: (){
                addUsers();
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Loginpage(user: user)));
            }
            , child: Text("register")),
          ],
        ),
        
        ),
      ),
    );
  }
}