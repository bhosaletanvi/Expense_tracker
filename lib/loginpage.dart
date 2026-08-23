import 'package:expense_wise/page2.dart';
import 'package:expense_wise/registerPage.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  final Map user;
  const Loginpage({super.key,required this.user});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  bool userFound = false;
  String massage="";

  late final List<Map> users;

  @override
  void initState() {
    super.initState();
    users = [widget.user];
  }

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // void logintopage(){
  //         print(users);

  //   for (var i = 0; i < users.length; i++) {
  //       if(users[i]["name"]==namecontroller.text && users[i]["password"]==passwordcontroller.text){
  //         setState(() {
  //          userFound=true;
  //          massage="";
  //          Navigator.push(context, MaterialPageRoute(builder: (_)=>Page2()));
  //         });
  //         break;
  //       }
  //   }
  //   if(!userFound){
  //    setState(() {
  //       massage = "Invalid information. Please try again or register.";
  //    });
  //   }
  //   return;

  // }
  void addNewuser(){
    setState(() {
      users.add(widget.user);
    });
  }
  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.grey.shade100,

    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Column(
            children: [

              // ================= LOGO =================

              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.teal,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.account_balance_wallet_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "ExpenseWise",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Manage your expenses easily",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 35),

              // ================= LOGIN CARD =================

              Card(
                elevation: 8,
                shadowColor: Colors.teal.withOpacity(0.15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Form(
                    key: _formKey,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        const Text(
                          "Welcome Back 👋",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Login to continue",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // ================= USERNAME =================

                        TextFormField(
                          controller: namecontroller,
                          validator: (value) {
                            bool name=false;
                             for (var i = 0; i < users.length; i++) {
                              if(users[i]["name"]==namecontroller.text){
                                name = true;
                                  break;
                             }
                           }
                           if(!name){
                            return "Please enter valid name";
                           }
                           return null;
                          },
                          decoration: InputDecoration(
                            labelText: "User ID",
                            hintText: "Enter your user ID",

                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: Colors.teal,
                            ),

                            filled: true,
                            fillColor: Colors.grey.shade100,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                                width: 2,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ================= PASSWORD =================

                        TextFormField(
                          controller: passwordcontroller,
                             validator: (value) {
                            bool pass=false;
                             for (var i = 0; i < users.length; i++) {
                              if(users[i]["password"]==passwordcontroller.text){
                                pass = true;
                                  break;
                             }
                           }
                           if(!pass){
                            return "Please enter valid password";
                           }
                           return null;
                          },
                          obscureText: true,

                          decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",

                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.teal,
                            ),

                            filled: true,
                            fillColor: Colors.grey.shade100,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.teal,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 25),

                        // ================= LOGIN BUTTON =================

                        SizedBox(
                          width: double.infinity,
                          height: 52,

                          child: ElevatedButton.icon(
                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Page2()),
                                
                                );
                              }
                            },
                           
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,

                              elevation: 4,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            icon: const Icon(
                              Icons.login,
                            ),

                            label: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ================= DIVIDER =================

                        Row(
                          children: [

                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade300,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),

                              child: Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // ================= REGISTER =================

                        SizedBox(
                          width: double.infinity,
                          height: 52,

                          child: OutlinedButton.icon(
                            onPressed: () {

                              addNewuser();

                              Navigator.push(
                                context,

                                MaterialPageRoute(
                                  builder: (_) => registerpage(),
                                ),
                              );
                            },

                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.teal,

                              side: const BorderSide(
                                color: Colors.teal,
                                width: 1.5,
                              ),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            icon: const Icon(
                              Icons.person_add_alt_1,
                            ),

                            label: const Text(
                              "Create New Account",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // ================= FOOTER =================

              Text(
                "Spend smart. Track better. 💰",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}