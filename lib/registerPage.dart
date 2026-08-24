import 'package:expense_wise/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();

  Future<void> createAccount() async {
  if (_formKey.currentState!.validate()) {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Account created successfully"),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const Loginpage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Registration failed"),
        ),
      );
    }
  }
}
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

    body: Center(
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
                    color: Colors.teal.withOpacity(0.25),
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
              "Create your account",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),
    
            const SizedBox(height: 35),
    
            // ================= REGISTER CARD =================
    
            Card(
              elevation: 10,
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
                        "Create Account ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
    
                      const SizedBox(height: 5),
    
                      Text(
                        "Enter your details to get started",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
    
                      const SizedBox(height: 25),
    
                      // ================= Email ID =================
    
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
                          hintText: "Create your Email ID",
    
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
                          hintText: "Create your password",
    
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
    
                      // ================= REGISTER BUTTON =================
    
                      SizedBox(
                        width: double.infinity,
                        height: 52,
    
                        child: ElevatedButton.icon(
                         onPressed: createAccount,
    
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
    
                            elevation: 4,
    
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
    
                          icon: const Icon(
                            Icons.person_add_alt_1,
                          ),
    
                          label: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
    
                      const SizedBox(height: 20),
    
                      // ================= LOGIN =================
    
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const Loginpage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Already have an account? Login",
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
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
  );
}
}