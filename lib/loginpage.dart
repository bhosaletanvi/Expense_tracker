import 'package:expense_wise/page2.dart';
import 'package:expense_wise/registerPage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Map user;
   Loginpage({super.key,required this.user});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey=GlobalKey<FormState>();
          bool userFound=false;

  List<Map>users=[];
  TextEditingController namecontroller=TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();

  void logintopage(){
    for (var i = 0; i < users.length; i++) {
        if(users[i]["name"]==namecontroller.text && users[i]["password"]==passwordcontroller.text){
          setState(() {
           userFound=true;
           Navigator.push(context, MaterialPageRoute(builder: (_)=>Page2()));
          });
          break;
        }
    }
    if(!userFound){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>registerpage()));
    }
    return;

  }
  void addNewuser(){
    setState(() {
      users.add(widget.user);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                ),
                TextFormField(
                  controller: passwordcontroller,
                ),
                ElevatedButton(onPressed: logintopage, child: Text("login ")),
                

  const SizedBox(height: 10),

  OutlinedButton.icon(
    onPressed: () {
      addNewuser();
      // Open registration page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>  registerpage(),
        ),
      );
    },
    icon: const Icon(Icons.person_add),
    label: const Text("Register"),
  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}