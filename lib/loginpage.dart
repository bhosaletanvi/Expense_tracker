import 'package:expense_wise/page2.dart';
import 'package:expense_wise/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
Future<void> loginUser() async {
  if (_formKey.currentState!.validate()) {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Page2(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.message ?? "Invalid information. Please try again.",
          ),
        ),
      );
    }
  }
}
 
  // void addNewEmail(){
  //   setState(() {
  //     Emails.add(widget.Email);
  //   });
  // }
 @override
void dispose() {
  emailcontroller.dispose();
  passwordcontroller.dispose();
  super.dispose();
}
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

                        // ================= EmailNAME =================

                        TextFormField(
                          controller: emailcontroller,

  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }

    if (!value.contains("@")) {
      return "Please enter a valid email";
    }

    return null;
  },
                          decoration: InputDecoration(
                            labelText: "Email ID",
                            hintText: "Enter your Email ID",

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
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    if (value.length < 6) {
      return "Password must be at least 6 characters";
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
                          onPressed: loginUser,
                           
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
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const registerpage(),
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