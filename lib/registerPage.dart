// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_wise/loginpage.dart';
// import 'package:expense_wise/page2.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class registerpage extends StatefulWidget {
//   const registerpage({super.key});

//   @override
//   State<registerpage> createState() => _registerpageState();
// }

// class _registerpageState extends State<registerpage> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController emailcontroller=TextEditingController();
//   TextEditingController passwordcontroller =TextEditingController();
//   Future<void> createAccount() async {
    
//   if (_formKey.currentState!.validate()) {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailcontroller.text.trim(),
//         password: passwordcontroller.text.trim(),
//       );

//       print("added to auth");
//         User? users = FirebaseAuth.instance.currentUser;

//       await FirebaseFirestore.instance.collection("users").add({
//         "user_id":users!.uid,
//         "email": emailcontroller.text.trim()
//       });
//             print("added to firebase");
//                 print("register successfully");


//           // Navigator.push(context, MaterialPageRoute(builder: (_)=>Loginpage()));

//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(e.message ?? "Registration failed"),
//         ),
//       );
//     }
//   }
// }
  
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.grey.shade100,

//     body: Center(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
    
//         child: Column(
//           children: [
    
//             // ================= LOGO =================
    
//             Container(
//               height: 100,
//               width: 100,
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.teal.withOpacity(0.25),
//                     blurRadius: 20,
//                     offset: const Offset(0, 10),
//                   ),
//                 ],
//               ),
//               child: const Icon(
//                 Icons.account_balance_wallet_rounded,
//                 color: Colors.white,
//                 size: 50,
//               ),
//             ),
    
//             const SizedBox(height: 20),
    
//             const Text(
//               "ExpenseWise",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal,
//               ),
//             ),
    
//             const SizedBox(height: 6),
    
//             Text(
//               "Create your account",
//               style: TextStyle(
//                 fontSize: 15,
//                 color: Colors.grey.shade600,
//               ),
//             ),
    
//             const SizedBox(height: 35),
    
//             // ================= REGISTER CARD =================
    
//             Card(
//               elevation: 10,
//               shadowColor: Colors.teal.withOpacity(0.15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25),
//               ),
    
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
    
//                 child: Form(
//                   key: _formKey,
    
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
    
//                     children: [
    
//                       const Text(
//                         "Create Account ",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
    
//                       const SizedBox(height: 5),
    
//                       Text(
//                         "Enter your details to get started",
//                         style: TextStyle(
//                           color: Colors.grey.shade600,
//                         ),
//                       ),
    
//                       const SizedBox(height: 25),
    
//                       // ================= Email ID =================
    
//                       TextFormField(
//                         controller: emailcontroller,
    
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//     return "Please enter your email";
//         }
    
//         if (!value.contains("@")) {
//     return "Please enter a valid email";
//         }
    
//         return null;
//       },
//                         decoration: InputDecoration(
//                           labelText: "Email ID",
//                           hintText: "Create your Email ID",
    
//                           prefixIcon: const Icon(
//                             Icons.person_outline,
//                             color: Colors.teal,
//                           ),
    
//                           filled: true,
//                           fillColor: Colors.grey.shade100,
    
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide.none,
//                           ),
    
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: const BorderSide(
//                               color: Colors.teal,
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
    
//                       const SizedBox(height: 18),
    
//                       // ================= PASSWORD =================
//     TextFormField(
//       controller: passwordcontroller,
    
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//     return "Please enter your password";
//         }
    
//         if (value.length < 6) {
//     return "Password must be at least 6 characters";
//         }
    
//         return null;
//       },
    
//       obscureText: true,
    
//                         decoration: InputDecoration(
//                           labelText: "Password",
//                           hintText: "Create your password",
    
//                           prefixIcon: const Icon(
//                             Icons.lock_outline,
//                             color: Colors.teal,
//                           ),
    
//                           filled: true,
//                           fillColor: Colors.grey.shade100,
    
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: BorderSide.none,
//                           ),
    
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15),
//                             borderSide: const BorderSide(
//                               color: Colors.teal,
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
    
//                       const SizedBox(height: 25),
    
//                       // ================= REGISTER BUTTON =================
    
//                       SizedBox(
//                         width: double.infinity,
//                         height: 52,
    
//                         child: ElevatedButton.icon(
//                          onPressed: createAccount,
    
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             foregroundColor: Colors.white,
    
//                             elevation: 4,
    
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                           ),
    
//                           icon: const Icon(
//                             Icons.person_add_alt_1,
//                           ),
    
//                           label: const Text(
//                             "Create Account",
//                             style: TextStyle(
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
    
//                       const SizedBox(height: 20),
    
//                       // ================= LOGIN =================
    
//                       Center(
//                         child: TextButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (_) => const Loginpage(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             "Already have an account? Login",
//                             style: TextStyle(
//                               color: Colors.teal,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
    
//             const SizedBox(height: 25),
    
//             Text(
//               "Spend smart. Track better. 💰",
//               style: TextStyle(
//                 color: Colors.grey.shade500,
//                 fontSize: 13,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_wise/loginpage.dart';
import 'package:expense_wise/page2.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class registerpage extends StatefulWidget {
  const registerpage({super.key});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  // ============================================================
  // YOUR ORIGINAL LOGIC - UNCHANGED
  // ============================================================

  Future<void> createAccount() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );

        print("added to auth");

        User? users = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance.collection("users").add({
          "user_id": users!.uid,
          "email": emailcontroller.text.trim()
        });

        print("added to firebase");
        print("register successfully");
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
  Widget build(BuildContext context) {
    const Color plum = Color(0xFF35152F);
    const Color darkPlum = Color(0xFF281025);
    const Color apricot = Color(0xFFF39A6B);
    const Color butter = Color(0xFFFFD978);
    const Color cream = Color(0xFFFFF8EE);
    const Color rose = Color(0xFFF4D8D3);
    const Color softPurple = Color(0xFFE9DCE8);

    return Scaffold(
      backgroundColor: cream,

      // ==========================================================
      // STABLE APP BAR
      // ==========================================================

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),

        child: AppBar(
          backgroundColor: cream,
          elevation: 0,
          scrolledUnderElevation: 0,

          automaticallyImplyLeading: false,

          titleSpacing: 20,

          title: Row(
            children: [

              // Small logo
              const ExpenseWiseLogo(
                size: 42,
                compact: true,
              ),

              const SizedBox(width: 11),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "ExpenseWise",
                    style: TextStyle(
                      color: plum,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -0.6,
                    ),
                  ),

                  SizedBox(height: 2),

                  Text(
                    "MONEY, BUT WISER.",
                    style: TextStyle(
                      color: Color(0xFFAA7C96),
                      fontSize: 7,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),

          actions: [

            Container(
              margin: const EdgeInsets.only(right: 20),
              height: 39,
              width: 39,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),

                boxShadow: [
                  BoxShadow(
                    color: plum.withOpacity(0.07),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: const Icon(
                Icons.auto_awesome_rounded,
                color: apricot,
                size: 19,
              ),
            ),
          ],
        ),
      ),

      // ============================================================
      // BODY
      // ============================================================

      body: Stack(
        children: [

          // ----------------------------------------------------------
          // BACKGROUND DECORATION
          // ----------------------------------------------------------

          Positioned(
            top: -100,
            right: -85,

            child: Container(
              height: 240,
              width: 240,

              decoration: BoxDecoration(
                color: butter.withOpacity(0.34),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 170,
            left: -130,

            child: Container(
              height: 240,
              width: 240,

              decoration: BoxDecoration(
                color: rose.withOpacity(0.52),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            right: -80,

            child: Container(
              height: 250,
              width: 250,

              decoration: BoxDecoration(
                color: apricot.withOpacity(0.16),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ----------------------------------------------------------
          // LITTLE FLOATING DOTS
          // ----------------------------------------------------------

          Positioned(
            top: 100,
            right: 42,

            child: Container(
              height: 8,
              width: 8,

              decoration: const BoxDecoration(
                color: apricot,
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 285,
            left: 45,

            child: Container(
              height: 6,
              width: 6,

              decoration: const BoxDecoration(
                color: butter,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ----------------------------------------------------------
          // SCROLLABLE CONTENT
          // ----------------------------------------------------------

          SafeArea(
            top: false,

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.fromLTRB(
                22,
                10,
                22,
                30,
              ),

              child: Column(
                children: [

                  // ==================================================
                  // HERO
                  // ==================================================

                  const ExpenseWiseLogo(
                    size: 112,
                  ),

                  const SizedBox(height: 9),

                  const Text(
                    "Your money deserves",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: plum,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),

                  const Text(
                    "a little more love.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: apricot,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Create your little corner of smarter spending.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: plum.withOpacity(0.50),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // REGISTER CARD
                  // ==================================================

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.fromLTRB(
                      20,
                      22,
                      20,
                      20,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),

                      borderRadius: BorderRadius.circular(31),

                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: plum.withOpacity(0.09),
                          blurRadius: 30,
                          offset: const Offset(0, 16),
                        ),
                      ],
                    ),

                    child: Form(
                      key: _formKey,

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          // =================================================
                          // CARD TITLE
                          // =================================================

                          Row(
                            children: [

                              Container(
                                height: 45,
                                width: 45,

                                decoration: BoxDecoration(
                                  color: softPurple,
                                  borderRadius:
                                      BorderRadius.circular(15),
                                ),

                                child: const Icon(
                                  Icons.face_rounded,
                                  color: plum,
                                  size: 23,
                                ),
                              ),

                              const SizedBox(width: 12),

                              const Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      "Let's meet!",
                                      style: TextStyle(
                                        color: plum,
                                        fontSize: 21,
                                        fontWeight:
                                            FontWeight.w900,
                                      ),
                                    ),

                                    SizedBox(height: 2),

                                    Text(
                                      "Just two tiny details to begin.",
                                      style: TextStyle(
                                        color:
                                            Color(0xFF947F8E),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // tiny decorative star
                              const Icon(
                                Icons.star_rounded,
                                color: butter,
                                size: 22,
                              ),
                            ],
                          ),

                          const SizedBox(height: 26),

                          // =================================================
                          // EMAIL
                          // =================================================

                          const Text(
                            "EMAIL",
                            style: TextStyle(
                              color: plum,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                          ),

                          const SizedBox(height: 8),

                          TextFormField(
                            controller: emailcontroller,

                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Please enter your email";
                              }

                              if (!value.contains("@")) {
                                return "Please enter a valid email";
                              }

                              return null;
                            },

                            keyboardType:
                                TextInputType.emailAddress,

                            style: const TextStyle(
                              color: plum,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),

                            decoration: InputDecoration(
                              hintText:
                                  "yourname@example.com",

                              hintStyle: TextStyle(
                                color: plum.withOpacity(0.25),
                                fontSize: 13,
                              ),

                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.all(8),

                                child: Container(
                                  decoration: BoxDecoration(
                                    color: rose,
                                    borderRadius:
                                        BorderRadius.circular(11),
                                  ),

                                  child: const Icon(
                                    Icons.alternate_email_rounded,
                                    color: plum,
                                    size: 18,
                                  ),
                                ),
                              ),

                              filled: true,

                              fillColor:
                                  const Color(0xFFFFFCF8),

                              contentPadding:
                                  const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 17,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide: BorderSide(
                                  color:
                                      plum.withOpacity(0.06),
                                ),
                              ),

                              enabledBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide: BorderSide(
                                  color:
                                      plum.withOpacity(0.06),
                                ),
                              ),

                              focusedBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: apricot,
                                  width: 2,
                                ),
                              ),

                              errorBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: Color(0xFFD86B6B),
                                ),
                              ),

                              focusedErrorBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: Color(0xFFD86B6B),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // =================================================
                          // PASSWORD
                          // =================================================

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,

                            children: [

                              const Text(
                                "PASSWORD",
                                style: TextStyle(
                                  color: plum,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.5,
                                ),
                              ),

                              Container(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),

                                decoration: BoxDecoration(
                                  color:
                                      butter.withOpacity(0.35),
                                  borderRadius:
                                      BorderRadius.circular(20),
                                ),

                                child: const Text(
                                  "6+ characters",
                                  style: TextStyle(
                                    color: plum,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          TextFormField(
                            controller: passwordcontroller,

                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty) {
                                return "Please enter your password";
                              }

                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }

                              return null;
                            },

                            obscureText: true,

                            style: const TextStyle(
                              color: plum,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),

                            decoration: InputDecoration(
                              hintText:
                                  "Create your secret key",

                              hintStyle: TextStyle(
                                color: plum.withOpacity(0.25),
                                fontSize: 13,
                              ),

                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.all(8),

                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        butter.withOpacity(0.48),
                                    borderRadius:
                                        BorderRadius.circular(11),
                                  ),

                                  child: const Icon(
                                    Icons.key_rounded,
                                    color: plum,
                                    size: 18,
                                  ),
                                ),
                              ),

                              filled: true,

                              fillColor:
                                  const Color(0xFFFFFCF8),

                              contentPadding:
                                  const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 17,
                              ),

                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide: BorderSide(
                                  color:
                                      plum.withOpacity(0.06),
                                ),
                              ),

                              enabledBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide: BorderSide(
                                  color:
                                      plum.withOpacity(0.06),
                                ),
                              ),

                              focusedBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: apricot,
                                  width: 2,
                                ),
                              ),

                              errorBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: Color(0xFFD86B6B),
                                ),
                              ),

                              focusedErrorBorder:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(18),

                                borderSide:
                                    const BorderSide(
                                  color: Color(0xFFD86B6B),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 23),

                          // =================================================
                          // CREATE ACCOUNT
                          // =================================================

                          SizedBox(
                            width: double.infinity,
                            height: 58,

                            child: ElevatedButton(
                              onPressed: createAccount,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: plum,
                                foregroundColor: Colors.white,

                                elevation: 0,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(19),
                                ),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,

                                children: [

                                  const Text(
                                    "Create my account",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w800,
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Container(
                                    height: 31,
                                    width: 31,

                                    decoration: BoxDecoration(
                                      color: butter,
                                      borderRadius:
                                          BorderRadius.circular(10),
                                    ),

                                    child: const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: plum,
                                      size: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 19),

                          // =================================================
                          // LOGIN
                          // =================================================

                          Row(
                            children: [

                              Expanded(
                                child: Divider(
                                  color:
                                      plum.withOpacity(0.09),
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                child: Text(
                                  "ALREADY HERE?",
                                  style: TextStyle(
                                    color:
                                        plum.withOpacity(0.38),
                                    fontSize: 8,
                                    fontWeight:
                                        FontWeight.w900,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Divider(
                                  color:
                                      plum.withOpacity(0.09),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 13),

                          SizedBox(
                            width: double.infinity,
                            height: 47,

                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const Loginpage(),
                                  ),
                                );
                              },

                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFFFFF0E8),

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(16),
                                ),
                              ),

                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,

                                children: [

                                  Text(
                                    "I already have an account",
                                    style: TextStyle(
                                      color: plum,
                                      fontSize: 12.5,
                                      fontWeight:
                                          FontWeight.w800,
                                    ),
                                  ),

                                  SizedBox(width: 7),

                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: plum,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ==================================================
                  // FOOTER
                  // ==================================================

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,

                    children: [

                      const Icon(
                        Icons.auto_awesome_rounded,
                        color: butter,
                        size: 13,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        "Spend smart • Track better • Live wiser",
                        style: TextStyle(
                          color: plum.withOpacity(0.42),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Icon(
                        Icons.auto_awesome_rounded,
                        color: apricot,
                        size: 13,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ======================================================================
// CUSTOM EXPENSEWISE LOGO
// ======================================================================

class ExpenseWiseLogo extends StatelessWidget {
  final double size;
  final bool compact;

  const ExpenseWiseLogo({
    super.key,
    required this.size,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    const Color plum = Color(0xFF35152F);
    const Color butter = Color(0xFFFFD978);
    const Color apricot = Color(0xFFF39A6B);
    const Color rose = Color(0xFFF4D8D3);

    return SizedBox(
      height: size,
      width: size,

      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,

        children: [

          // ============================================================
          // OUTER SOFT CIRCLE
          // ============================================================

          Container(
            height: size * 0.88,
            width: size * 0.88,

            decoration: BoxDecoration(
              color: rose.withOpacity(0.55),
              shape: BoxShape.circle,
            ),
          ),

          // ============================================================
          // MONEY POCKET
          // ============================================================

          Transform.rotate(
            angle: -0.07,

            child: Container(
              height: size * 0.61,
              width: size * 0.70,

              decoration: BoxDecoration(
                color: plum,

                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(size * 0.22),

                  topRight:
                      Radius.circular(size * 0.22),

                  bottomLeft:
                      Radius.circular(size * 0.28),

                  bottomRight:
                      Radius.circular(size * 0.15),
                ),

                boxShadow: [
                  BoxShadow(
                    color: plum.withOpacity(0.22),
                    blurRadius: size * 0.17,
                    offset: Offset(
                      0,
                      size * 0.10,
                    ),
                  ),
                ],
              ),

              child: Stack(
                alignment: Alignment.center,

                children: [

                  // ====================================================
                  // COIN
                  // ====================================================

                  Container(
                    height: size * 0.39,
                    width: size * 0.39,

                    decoration: BoxDecoration(
                      color: butter,
                      shape: BoxShape.circle,

                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: size * 0.018,
                      ),
                    ),

                    child: Center(
                      child: Text(
                        "₹",
                        style: TextStyle(
                          color: plum,
                          fontSize: size * 0.25,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),

                  // ====================================================
                  // LITTLE HANDLE
                  // ====================================================

                  Positioned(
                    top: size * 0.025,

                    child: Container(
                      height: size * 0.10,
                      width: size * 0.28,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: butter,
                          width: size * 0.035,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                          size,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // CUTE SPARK
          // ============================================================

          Positioned(
            top: size * 0.02,
            right: size * 0.06,

            child: Icon(
              Icons.auto_awesome_rounded,
              color: apricot,
              size: size * 0.21,
            ),
          ),

          // ============================================================
          // LITTLE DOT
          // ============================================================

          Positioned(
            bottom: size * 0.10,
            right: size * 0.02,

            child: Container(
              height: size * 0.10,
              width: size * 0.10,

              decoration: const BoxDecoration(
                color: butter,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ============================================================
          // LITTLE LEAF
          // ============================================================

          if (!compact)
            Positioned(
              bottom: size * 0.04,
              left: size * 0.08,

              child: Transform.rotate(
                angle: -0.55,

                child: Container(
                  height: size * 0.18,
                  width: size * 0.29,

                  decoration: BoxDecoration(
                    color: apricot,

                    borderRadius:
                        BorderRadius.only(
                      topLeft:
                          Radius.circular(size * 0.20),

                      topRight:
                          Radius.circular(size * 0.05),

                      bottomLeft:
                          Radius.circular(size * 0.04),

                      bottomRight:
                          Radius.circular(size * 0.20),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}