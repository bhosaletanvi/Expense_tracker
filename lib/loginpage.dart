// import 'package:expense_wise/page2.dart';
// import 'package:expense_wise/registerPage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class Loginpage extends StatefulWidget {
//   const Loginpage({super.key});

//   @override
//   State<Loginpage> createState() => _LoginpageState();
// }

// class _LoginpageState extends State<Loginpage> {

//   final _formKey = GlobalKey<FormState>();

//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
// Future<void> loginUser() async {
//   if (_formKey.currentState!.validate()) {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailcontroller.text.trim(),
//         password: passwordcontroller.text.trim(),
//       );
//               print("loging");
//       Navigator.push(context, MaterialPageRoute(builder: (_)=>Page2()));

      
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             e.message ?? "Invalid information. Please try again.",
//           ),
//         ),
//       );
//     }
//   }
// }
 
//   // void addNewEmail(){
//   //   setState(() {
//   //     Emails.add(widget.Email);
//   //   });
//   // }
//  @override
// void dispose() {
//   emailcontroller.dispose();
//   passwordcontroller.dispose();
//   super.dispose();
// }
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.grey.shade100,

//     body: SafeArea(
//       child: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),

//           child: Column(
//             children: [

//               // ================= LOGO =================

//               Container(
//                 height: 100,
//                 width: 100,
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.teal,
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ],
//                 ),
//                 child: const Icon(
//                   Icons.account_balance_wallet_rounded,
//                   color: Colors.white,
//                   size: 50,
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Text(
//                 "ExpenseWise",
//                 style: TextStyle(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal,
//                 ),
//               ),

//               const SizedBox(height: 6),

//               Text(
//                 "Manage your expenses easily",
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.grey.shade600,
//                 ),
//               ),

//               const SizedBox(height: 35),

//               // ================= LOGIN CARD =================

//               Card(
//                 elevation: 8,
//                 shadowColor: Colors.teal.withOpacity(0.15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),

//                 child: Padding(
//                   padding: const EdgeInsets.all(24),

//                   child: Form(
//                     key: _formKey,

//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,

//                       children: [

//                         const Text(
//                           "Welcome Back ",
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),

//                         const SizedBox(height: 5),

//                         Text(
//                           "Login to continue",
//                           style: TextStyle(
//                             color: Colors.grey.shade600,
//                           ),
//                         ),

//                         const SizedBox(height: 25),

//                         // ================= EmailNAME =================

//                         TextFormField(
//                           controller: emailcontroller,

//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return "Please enter your email";
//     }

//     if (!value.contains("@")) {
//       return "Please enter a valid email";
//     }

//     return null;
//   },
//                           decoration: InputDecoration(
//                             labelText: "Email ID",
//                             hintText: "Enter your Email ID",

//                             prefixIcon: const Icon(
//                               Icons.person_outline,
//                               color: Colors.teal,
//                             ),

//                             filled: true,
//                             fillColor: Colors.grey.shade100,

//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: BorderSide.none,
//                             ),

//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.teal,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 18),

//                         // ================= PASSWORD =================

//                         TextFormField(
//                            controller: passwordcontroller,

//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return "Please enter your password";
//     }

//     if (value.length < 6) {
//       return "Password must be at least 6 characters";
//     }

//     return null;
//   },

//   obscureText: true,

//                           decoration: InputDecoration(
//                             labelText: "Password",
//                             hintText: "Enter your password",

//                             prefixIcon: const Icon(
//                               Icons.lock_outline,
//                               color: Colors.teal,
//                             ),

//                             filled: true,
//                             fillColor: Colors.grey.shade100,

//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: BorderSide.none,
//                             ),

//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15),
//                               borderSide: const BorderSide(
//                                 color: Colors.teal,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
                        
//                         const SizedBox(height: 25),

//                         // ================= LOGIN BUTTON =================

//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,

//                           child: ElevatedButton.icon(
//                           onPressed: loginUser,
                           
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.teal,
//                               foregroundColor: Colors.white,

//                               elevation: 4,

//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),

//                             icon: const Icon(
//                               Icons.login,
//                             ),

//                             label: const Text(
//                               "Login",
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),

//                         const SizedBox(height: 20),

//                         // ================= DIVIDER =================

//                         Row(
//                           children: [

//                             Expanded(
//                               child: Divider(
//                                 color: Colors.grey.shade300,
//                               ),
//                             ),

//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                               ),

//                               child: Text(
//                                 "OR",
//                                 style: TextStyle(
//                                   color: Colors.grey.shade500,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),

//                             Expanded(
//                               child: Divider(
//                                 color: Colors.grey.shade300,
//                               ),
//                             ),
//                           ],
//                         ),

//                         const SizedBox(height: 20),

//                         // ================= REGISTER =================

//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,

//                           child: OutlinedButton.icon(
//                            onPressed: () {
//   Navigator.push(
//     context,
//     MaterialPageRoute(
//       builder: (_) => const registerpage(),
//     ),
//   );
// },

//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Colors.teal,

//                               side: const BorderSide(
//                                 color: Colors.teal,
//                                 width: 1.5,
//                               ),

//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                             ),

//                             icon: const Icon(
//                               Icons.person_add_alt_1,
//                             ),

//                             label: const Text(
//                               "Create New Account",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 25),

//               // ================= FOOTER =================

//               Text(
//                 "Spend smart. Track better. 💰",
//                 style: TextStyle(
//                   color: Colors.grey.shade500,
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
// }
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
  bool _obscurePassword = true;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  // ============================================================
  // YOUR ORIGINAL LOGIN LOGIC - UNCHANGED
  // ============================================================

  Future<void> loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );

        print("loging");

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => Page2(),
        //   ),
        // );
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

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
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

      // ============================================================
      // STABLE APP BAR
      // ============================================================

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

              const ExpenseWiseLoginLogo(
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
                Icons.wb_sunny_rounded,
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
          // BACKGROUND CIRCLES
          // ----------------------------------------------------------

          Positioned(
            top: -100,
            left: -100,

            child: Container(
              height: 245,
              width: 245,

              decoration: BoxDecoration(
                color: rose.withOpacity(0.60),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 125,
            right: -105,

            child: Container(
              height: 230,
              width: 230,

              decoration: BoxDecoration(
                color: butter.withOpacity(0.34),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            bottom: -110,
            left: -70,

            child: Container(
              height: 230,
              width: 230,

              decoration: BoxDecoration(
                color: apricot.withOpacity(0.17),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ----------------------------------------------------------
          // FLOATING DECORATIONS
          // ----------------------------------------------------------

          Positioned(
            top: 75,
            right: 45,

            child: Transform.rotate(
              angle: 0.2,

              child: const Icon(
                Icons.auto_awesome_rounded,
                color: apricot,
                size: 20,
              ),
            ),
          ),

          Positioned(
            top: 280,
            left: 38,

            child: Container(
              height: 7,
              width: 7,

              decoration: const BoxDecoration(
                color: butter,
                shape: BoxShape.circle,
              ),
            ),
          ),

          // ----------------------------------------------------------
          // SCROLLABLE AREA
          // ----------------------------------------------------------

          SafeArea(
            top: false,

            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.fromLTRB(
                22,
                14,
                22,
                30,
              ),

              child: Column(
                children: [

                  // ==================================================
                  // LOGO
                  // ==================================================

                  const ExpenseWiseLoginLogo(
                    size: 112,
                  ),

                  const SizedBox(height: 13),

                  // ==================================================
                  // HERO TEXT
                  // ==================================================

                  const Text(
                    "Good to see you.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: plum,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "Let's get back to your money.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: apricot,
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Your spending story is waiting for you.",
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: plum.withOpacity(0.48),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 27),

                  // ==================================================
                  // LOGIN CARD
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
                          // CARD HEADER
                          // =================================================

                          Row(
                            children: [

                              Container(
                                height: 46,
                                width: 46,

                                decoration: BoxDecoration(
                                  color: softPurple,
                                  borderRadius:
                                      BorderRadius.circular(15),
                                ),

                                child: const Icon(
                                  Icons.waving_hand_rounded,
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
                                      "Welcome back!",
                                      style: TextStyle(
                                        color: plum,
                                        fontSize: 21,
                                        fontWeight:
                                            FontWeight.w900,
                                      ),
                                    ),

                                    SizedBox(height: 3),

                                    Text(
                                      "Enter your details below.",
                                      style: TextStyle(
                                        color:
                                            Color(0xFF947F8E),
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.favorite_rounded,
                                color: apricot,
                                size: 19,
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

                              const Text(
                                "KEEP IT SECRET ✦",
                                style: TextStyle(
                                  color: Color(0xFFAA7C96),
                                  fontSize: 8,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          TextFormField(
  controller: passwordcontroller,

  obscureText: _obscurePassword,

  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please enter password";
    }
    return null;
  },

  style: const TextStyle(
    color: Color(0xFF35152F),
    fontWeight: FontWeight.w600,
  ),

  decoration: InputDecoration(
    hintText: "Enter your password",

    prefixIcon: Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFD978),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.lock_rounded,
        color: Color(0xFF35152F),
        size: 20,
      ),
    ),

    // 👁 Eye button
    suffixIcon: IconButton(
      onPressed: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },

      icon: Icon(
        _obscurePassword
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,

        color: const Color(0xFF35152F),
      ),

      tooltip: _obscurePassword
          ? "Show password"
          : "Hide password",
    ),

    filled: true,
    fillColor: const Color(0xFFFFF8EE),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: BorderSide.none,
    ),
  ),
),
                          const SizedBox(height: 24),

                          // =================================================
                          // LOGIN BUTTON
                          // =================================================

                          SizedBox(
                            width: double.infinity,
                            height: 59,

                            child: ElevatedButton(
                              onPressed: loginUser,

                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkPlum,
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
                                    "Let's go",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight:
                                          FontWeight.w800,
                                    ),
                                  ),

                                  const SizedBox(width: 13),

                                  Container(
                                    height: 32,
                                    width: 32,

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

                          const SizedBox(height: 20),

                          // =================================================
                          // DIVIDER
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
                                  horizontal: 11,
                                ),

                                child: Text(
                                  "NEW AROUND HERE?",
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

                          // =================================================
                          // REGISTER BUTTON
                          // =================================================

                          SizedBox(
                            width: double.infinity,
                            height: 48,

                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const registerpage(),
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

                                  Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: plum,
                                    size: 17,
                                  ),

                                  SizedBox(width: 8),

                                  Text(
                                    "Create a new account",
                                    style: TextStyle(
                                      color: plum,
                                      fontSize: 12.5,
                                      fontWeight:
                                          FontWeight.w800,
                                    ),
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
                        Icons.favorite_rounded,
                        color: apricot,
                        size: 12,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        "Your wallet is in good hands.",
                        style: TextStyle(
                          color: plum.withOpacity(0.42),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 6),

                      const Icon(
                        Icons.auto_awesome_rounded,
                        color: butter,
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
// EXPENSEWISE LOGIN LOGO
// ======================================================================

class ExpenseWiseLoginLogo extends StatelessWidget {
  final double size;
  final bool compact;

  const ExpenseWiseLoginLogo({
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
          // SOFT BACKGROUND
          // ============================================================

          Container(
            height: size * 0.88,
            width: size * 0.88,

            decoration: BoxDecoration(
              color: rose.withOpacity(0.60),
              shape: BoxShape.circle,
            ),
          ),

          // ============================================================
          // MONEY POUCH
          // ============================================================

          Transform.rotate(
            angle: -0.06,

            child: Container(
              height: size * 0.61,
              width: size * 0.70,

              decoration: BoxDecoration(
                color: plum,

                borderRadius: BorderRadius.only(
                  topLeft:
                      Radius.circular(size * 0.23),

                  topRight:
                      Radius.circular(size * 0.23),

                  bottomLeft:
                      Radius.circular(size * 0.28),

                  bottomRight:
                      Radius.circular(size * 0.15),
                ),

                boxShadow: [
                  BoxShadow(
                    color: plum.withOpacity(0.23),
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
                  // POUCH HANDLE
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
                            BorderRadius.circular(size),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ============================================================
          // SPARKLE
          // ============================================================

          Positioned(
            top: size * 0.015,
            right: size * 0.06,

            child: Transform.rotate(
              angle: 0.18,

              child: Icon(
                Icons.auto_awesome_rounded,
                color: apricot,
                size: size * 0.21,
              ),
            ),
          ),

          // ============================================================
          // LITTLE DOT
          // ============================================================

          Positioned(
            bottom: size * 0.09,
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
              bottom: size * 0.035,
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
