// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_wise/loginpage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class Page2 extends StatefulWidget {
//   const Page2({super.key});

//   @override
//   State<Page2> createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
 

//   int sum = 0;

//   TextEditingController placeController=TextEditingController();
//   TextEditingController costController=TextEditingController();
//   User? users = FirebaseAuth.instance.currentUser;


// final _formKey = GlobalKey<FormState>();
//   @override
//   void initState() {
//     super.initState();
//     placeController = TextEditingController();
//     costController = TextEditingController();
//   }

//  Future<void> addcost() async {
//   Map<String, dynamic> newTask = {
//     "place": placeController.text,
//     "price": num.tryParse(costController.text) ?? 0,
//   };


//   // Find dayinfo for this user and selected date
//   final userInfo = await FirebaseFirestore.instance
//       .collection("dayinfo")
//       .where("user_id", isEqualTo: users!.uid)
//       .where("date", isEqualTo: selectedDate)
//       .get();

//   // If no document exists, CREATE one
//   if (userInfo.docs.isEmpty) {
//     await FirebaseFirestore.instance.collection("dayinfo").add({
//       "user_id": users!.uid,
//       "date": selectedDate,
//       "total": num.tryParse(costController.text) ?? 0,
//       "all_tasks": [newTask],
//     });

//     print("New dayinfo created");
//     return;
//   }

//   // Existing document
//   final doc = userInfo.docs.first;

//   Map<String, dynamic> data = doc.data();

//   // Get old total
//   num oldTotal = data["total"] ?? 0;

//   // Get existing tasks
//   List<Map<String, dynamic>> allTasks = [];

//   if (data["all_tasks"] != null) {
//     allTasks = List<Map<String, dynamic>>.from(
//       (data["all_tasks"] as List).map(
//         (task) => Map<String, dynamic>.from(task),
//       ),
//     );
//   }

//   // Add new task
//   allTasks.add(newTask);

//   // Add new price to total
//   num newTotal =
//       oldTotal + (num.tryParse(costController.text) ?? 0);

//   // Update existing document
//   await FirebaseFirestore.instance
//       .collection("dayinfo")
//       .doc(doc.id)
//       .update({
//         "total": newTotal,
//         "all_tasks": allTasks,
//       });

//   print("Updated successfully");
//   costController.clear();
//   placeController.clear();
// }
   
// DateTime? selectedDate;

// Future<void> selectDate() async {
//   DateTime? date = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(),
//     firstDate: DateTime(2020),
//     lastDate: DateTime(2030),
//   );

//   if (date != null) {
//     setState(() {
//       selectedDate = date;
//     });
//   }
// }

// Future<void> deletetask(int index) async {
//   final userInfo = await FirebaseFirestore.instance
//       .collection("dayinfo")
//       .where(
//         "user_id",
//         isEqualTo: users!.uid,
//       )
//       .where(
//         "date",
//         isEqualTo: selectedDate,
//       )
//       .get();

//   if (userInfo.docs.isEmpty) {
//     print("No day found");
//     return;
//   }

//   // Get the document
//   final doc = userInfo.docs.first;

//   // Get document data
//   final data = doc.data();

//   // Get all tasks
//   final List all_tasks = List.from(data["all_tasks"] ?? []);

//   print("BEFORE DELETE = $all_tasks");

//   // Delete task at particular index
//   all_tasks.removeAt(index);

//   print("AFTER DELETE = $all_tasks");

//   // Calculate total again
//   num sum = 0;

//   for (final element in all_tasks) {
//     sum += (element["price"] as num);
//   }

//   print("NEW TOTAL = $sum");

//   // Update Firestore
//   await doc.reference.update({
//     "all_tasks": all_tasks,
//     "total": sum,
//   });

//   print("Task deleted successfully");
// }
//    Future<void> logout() async{
//     print("logout pressed");
//     await FirebaseAuth.instance.signOut();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//   child: Padding(
//     padding: const EdgeInsets.all(16),
//     child: Column(
//       children: [

//         /// App Logo
       
//         Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   children: [

//     // ================= LOGO + APP NAME =================
//     Row(
//       children: [

//         // Logo
//         Container(
//           height: 65,
//           width: 65,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [
//                 Colors.teal,
//                 Colors.green,
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.teal.withOpacity(0.25),
//                 blurRadius: 12,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: const Icon(
//             Icons.account_balance_wallet_rounded,
//             color: Colors.white,
//             size: 34,
//           ),
//         ),

//         const SizedBox(width: 14),

//         // App Name + Tagline
//         const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Text(
//               "SpendWise",
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.teal,
//                 letterSpacing: 0.5,
//               ),
//             ),

//             SizedBox(height: 3),

//             Text(
//               "Track Every Rupee",
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 13,
//               ),
//             ),
//           ],
//         ),
//       ],
//     ),

//     // ================= ACTION BUTTONS =================
//     Row(
//       children: [

//         // Profile Button
//        Container(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 14,
//     vertical: 8,
//   ),
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(18),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.15),
//         blurRadius: 12,
//         offset: const Offset(0, 4),
//       ),
//     ],
//   ),
//   child: Row(
//     mainAxisSize: MainAxisSize.min,
//     children: [

//       // Profile Icon
//       Container(
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           color: Colors.teal.shade50,
//           shape: BoxShape.circle,
//         ),
//         child: const Icon(
//           Icons.person_rounded,
//           color: Colors.teal,
//           size: 26,
//         ),
//       ),

//       const SizedBox(width: 10),

//       // User Information
      
//       Text(
//         users!.email!.split('@').first ?? 'No email',
//         style: const TextStyle(
//           fontSize: 14,
//           fontWeight: FontWeight.w600,
//           color: Colors.black87,
//         ),
//       ),
//     ],
//   ),
// ),

//         const SizedBox(width: 10),

//         // Logout Button
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(
//             color: Colors.red,
//             // shape: BoxShape.circle,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: IconButton(
//             onPressed: logout,
//             icon: const Icon(
//               Icons.logout_rounded,
//               color: Colors.white,
//             ),
//             tooltip: "Logout",
//           ),
//         ),
//       ],
//     ),
//   ],
// ),

//         const SizedBox(height: 10),

       
//         const SizedBox(height: 20),

//         /// Input Card
//         Card(
//           elevation: 8,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(18),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [

//       SizedBox(
//   width: double.infinity,
//   height: 52,
//   child: ElevatedButton.icon(
//     onPressed: () async {
//       await selectDate();
//     },

//     style: ElevatedButton.styleFrom(
//       backgroundColor: Colors.teal,
//       foregroundColor: Colors.white,
//       elevation: 5,
//       shadowColor: Colors.teal.withOpacity(0.3),

//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//     ),

//     icon: const Icon(
//       Icons.calendar_month_rounded,
//     ),

//     label: Text(
//       selectedDate == null
//           ? "Select Date"
//           : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
//       style: const TextStyle(
//         fontSize: 16,
//         fontWeight: FontWeight.w600,
//       ),
//     ),
//   ),
// ),
//                   SizedBox(height: 20,),
//                   TextFormField(
//                     controller: placeController,
//                     validator: (value) {
//                       if(value==null || value.isEmpty){
//                         return "please enter place";
//                       }
//                       return null;
//                     },
//                     decoration: InputDecoration(
//                       hintText: "Where did you spend?",
//                       labelText: "Place",
//                       prefixIcon: const Icon(Icons.place),
//                       filled: true,
//                       fillColor: Colors.grey.shade100,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
              
//                   const SizedBox(height: 15),
              
//                   TextFormField(
//                     controller: costController,
//                     validator: (value) {
//                       if (value==null || value.isEmpty) {
//                         return "please enter cost";
//                       }
//                       return null;
//                     },
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "Enter Amount",
//                       labelText: "Amount",
//                       prefixIcon: const Icon(Icons.currency_rupee),
//                       filled: true,
//                       fillColor: Colors.grey.shade100,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
              
//                   const SizedBox(height: 20),
              
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                       ),
//                       onPressed: () async {
//   if (_formKey.currentState!.validate()) {

//     if (selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please select a date first"),
//         ),
//       );
//       return;
//     }

//     await addcost();
//   }
// } ,
//                       icon: const Icon(Icons.add),
//                       label: const Text(
//                         "Add Expense",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),

//         const SizedBox(height: 20),

//         /// Total Card
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [
//                 Colors.teal,
//                 Colors.green,
//               ],
//             ),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               vertical: 22,
//             ),
//             child: Column(
//               children: [

//                 const Text(
//                   "Today's Expense",
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 15,
//                   ),
//                 ),

//                 const SizedBox(height: 8),
//                StreamBuilder<QuerySnapshot>(
//   stream: selectedDate == null
//       ? null
//       : FirebaseFirestore.instance
//           .collection("dayinfo")
//           .where("user_id", isEqualTo: users!.uid)
//           .where(
//             "date",
//             isEqualTo: Timestamp.fromDate(selectedDate!),
//           )
//           .snapshots(),

//   builder: (context, snapshot) {

//     // No date selected
//     if (selectedDate == null) {
//       return const Text(
//         "₹ 0",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//         ),
//       );
//     }

//     // Loading
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const CircularProgressIndicator(
//         color: Colors.white,
//       );
//     }

//     // Error
//     if (snapshot.hasError) {
//       print("ERROR: ${snapshot.error}");

//       return const Text(
//         "₹ 0",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//         ),
//       );
//     }

//     // No document found
//     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//       print("No expense found for this date");

//       return const Text(
//         "₹ 0",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//         ),
//       );
//     }

//     // Get first matching document
//     final doc = snapshot.data!.docs.first;

//     final data = doc.data() as Map<String, dynamic>;

//     // Print total
//     print("TOTAL = ${data["total"]}");

//     return Text(
//       "₹ ${data["total"]}",
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 28,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   },
// ),
               
//               ],
//             ),
//           ),
//         ),

//         const SizedBox(height: 20),

//        Expanded(
//   child: StreamBuilder<QuerySnapshot>(
//     stream: selectedDate == null
//         ? null
//         : FirebaseFirestore.instance
//             .collection("dayinfo")
//             .where(
//               "user_id",
//               isEqualTo: users!.uid,
//             )
//             .where(
//               "date",
//               isEqualTo: Timestamp.fromDate(selectedDate!),
//             )
//             .snapshots(),

//     builder: (context, snapshot) {

//       // Date not selected
//       if (selectedDate == null) {
//         return const Center(
//           child: Text("Please select a date"),
//         );
//       }

//       // Loading
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       // Error
//       if (snapshot.hasError) {
//         print(snapshot.error);

//         return const Center(
//           child: Text("Unable to load expenses"),
//         );
//       }

//       // No document
//       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//         return const Center(
//           child: Text("No expenses for this day"),
//         );
//       }

//       // Get Firestore document
//       final doc = snapshot.data!.docs.first;

//       final data = doc.data() as Map<String, dynamic>;

//       // all_tasks is already a List
//       final List all_tasks = data["all_tasks"] ?? [];

//       print("ALL TASKS = $all_tasks");

//       return ListView.builder(
//         itemCount: all_tasks.length,

//         itemBuilder: (context, index) {

//           final one_task = all_tasks[index];

//           return Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             padding: const EdgeInsets.all(15),
//             child: ListTile(
//               title: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 Text(
//                   one_task["place"] ?? "",
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 5),

//                 Text(
//                   "₹ ${one_task["price"]}",
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//               ),
//               trailing: IconButton(onPressed: (){
//                 deletetask(index);
//               }, icon: Icon(Icons.delete_outline_rounded)),
//             ),
            
//           );
//         },
//       );
//     },
//   ),
// ),

       
//       ],
//     ),
//   ),
// ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_wise/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {

  int sum = 0;

  TextEditingController placeController = TextEditingController();
  TextEditingController costController = TextEditingController();

  User? users = FirebaseAuth.instance.currentUser;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    placeController = TextEditingController();
    costController = TextEditingController();
  }

  // ============================================================
  // YOUR ORIGINAL LOGIC - UNCHANGED
  // ============================================================

  Future<void> addcost() async {

    Map<String, dynamic> newTask = {
      "place": placeController.text,
      "price": num.tryParse(costController.text) ?? 0,
    };

    final userInfo = await FirebaseFirestore.instance
        .collection("dayinfo")
        .where("user_id", isEqualTo: users!.uid)
        .where("date", isEqualTo: selectedDate)
        .get();

    if (userInfo.docs.isEmpty) {

      await FirebaseFirestore.instance.collection("dayinfo").add({
        "user_id": users!.uid,
        "date": selectedDate,
        "total": num.tryParse(costController.text) ?? 0,
        "all_tasks": [newTask],
      });

      print("New dayinfo created");
      return;
    }

    final doc = userInfo.docs.first;

    Map<String, dynamic> data = doc.data();

    num oldTotal = data["total"] ?? 0;

    List<Map<String, dynamic>> allTasks = [];

    if (data["all_tasks"] != null) {
      allTasks = List<Map<String, dynamic>>.from(
        (data["all_tasks"] as List).map(
          (task) => Map<String, dynamic>.from(task),
        ),
      );
    }

    allTasks.add(newTask);

    num newTotal =
        oldTotal + (num.tryParse(costController.text) ?? 0);

    await FirebaseFirestore.instance
        .collection("dayinfo")
        .doc(doc.id)
        .update({
      "total": newTotal,
      "all_tasks": allTasks,
    });
    costController.clear();
    placeController.clear();
    print("Updated successfully");

    
  }

  DateTime? selectedDate;

  Future<void> selectDate() async {

    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> deletetask(int index) async {

    final userInfo = await FirebaseFirestore.instance
        .collection("dayinfo")
        .where(
          "user_id",
          isEqualTo: users!.uid,
        )
        .where(
          "date",
          isEqualTo: selectedDate,
        )
        .get();

    if (userInfo.docs.isEmpty) {
      print("No day found");
      return;
    }

    final doc = userInfo.docs.first;

    final data = doc.data();

    final List all_tasks = List.from(data["all_tasks"] ?? []);

    print("BEFORE DELETE = $all_tasks");

    all_tasks.removeAt(index);

    print("AFTER DELETE = $all_tasks");

    num sum = 0;

    for (final element in all_tasks) {
      sum += (element["price"] as num);
    }

    print("NEW TOTAL = $sum");

    await doc.reference.update({
      "all_tasks": all_tasks,
      "total": sum,
    });

    print("Task deleted successfully");
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
        print("logout pressed");

  }

  // ============================================================
  // UI
  // ============================================================

  @override
  Widget build(BuildContext context) {

    const Color plum = Color(0xFF35152F);
    const Color darkPlum = Color(0xFF281025);
    const Color peach = Color(0xFFF39A6B);
    const Color butter = Color(0xFFFFD978);
    const Color cream = Color(0xFFFFF8EE);
    const Color rose = Color(0xFFF4D8D3);
    const Color softPurple = Color(0xFFE9DCE8);

    return Scaffold(
      backgroundColor: cream,

      body: SafeArea(
        child: Stack(
          children: [

            // ==================================================
            // BACKGROUND DECORATIONS
            // ==================================================

            Positioned(
              top: -100,
              right: -80,
              child: Container(
                height: 260,
                width: 260,
                decoration: BoxDecoration(
                  color: rose.withOpacity(0.55),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              top: 330,
              left: -120,
              child: Container(
                height: 230,
                width: 230,
                decoration: BoxDecoration(
                  color: softPurple.withOpacity(0.55),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // ==================================================
            // MAIN CONTENT
            // ==================================================

            Column(
              children: [

                // ==================================================
                // FIXED HEADER
                // ==================================================

                Container(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    14,
                    20,
                    14,
                  ),
                  decoration: BoxDecoration(
                    color: cream,
                    boxShadow: [
                      BoxShadow(
                        color: plum.withOpacity(0.06),
                        blurRadius: 18,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // LOGO
                      Container(
                        height: 58,
                        width: 58,

                        decoration: BoxDecoration(
                          color: plum,
                          borderRadius:
                              BorderRadius.circular(19),

                          boxShadow: [
                            BoxShadow(
                              color: plum.withOpacity(0.25),
                              blurRadius: 14,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),

                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            // wallet
                            Container(
                              height: 27,
                              width: 34,

                              decoration: BoxDecoration(
                                color: peach,
                                borderRadius:
                                    BorderRadius.circular(9),
                              ),
                            ),

                            // wallet flap
                            Positioned(
                              top: 15,
                              child: Container(
                                height: 8,
                                width: 30,

                                decoration: BoxDecoration(
                                  color: butter,
                                  borderRadius:
                                      BorderRadius.circular(5),
                                ),
                              ),
                            ),

                            // rupee coin
                            Positioned(
                              right: 9,
                              top: 10,

                              child: Container(
                                height: 18,
                                width: 18,

                                decoration: const BoxDecoration(
                                  color: cream,
                                  shape: BoxShape.circle,
                                ),

                                child: const Center(
                                  child: Text(
                                    "₹",
                                    style: TextStyle(
                                      color: plum,
                                      fontSize: 11,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 13),

                      // APP NAME
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            const Text(
                              "ExpenseWise",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: plum,
                                letterSpacing: -0.5,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              "little steps, smarter spending",
                              style: TextStyle(
                                fontSize: 15.5,
                                color: plum.withOpacity(0.55),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      PopupMenuButton<String>(
  onSelected: (value) async {
    if (value == "logout") {
      await logout();
    }
  },

  offset: const Offset(0, 55),

  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),

  color: Colors.white,

  elevation: 10,

  itemBuilder: (context) => [

    // USER NAME
    PopupMenuItem<String>(
      enabled: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Profile circle
          Container(
            height: 48,
            width: 48,

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFD978),
                  Color(0xFFF39A6B),
                ],
              ),
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.person_rounded,
              color: Color(0xFF35152F),
              size: 26,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "Make it count. 🪙",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            users?.email?.split('@').first ?? "User",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              color: Color(0xFF35152F),
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 8),
        ],
      ),
    ),

    // DIVIDER
    const PopupMenuDivider(),

    // LOGOUT
    const PopupMenuItem<String>(
      value: "logout",

      child: Row(
        children: [

          Icon(
            Icons.logout_rounded,
            color: Color(0xFF35152F),
            size: 21,
          ),

          SizedBox(width: 12),

          Text(
            "Logout",
            style: TextStyle(
              color: Color(0xFF35152F),
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  ],

  // PROFILE BUTTON
  child: Container(
    height: 43,
    width: 43,

    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          Color(0xFFFFD978),
          Color(0xFFF39A6B),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      shape: BoxShape.circle,

      border: Border.all(
        color: Colors.white,
        width: 3,
      ),

      boxShadow: [
        BoxShadow(
          color: const Color(0xFF35152F).withOpacity(0.12),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),

    child: const Icon(
      Icons.person_rounded,
      color: Color(0xFF35152F),
      size: 23,
    ),
  ),
),

                      
                    ],
                  ),
                ),

                // ==================================================
                // SCROLLABLE BODY
                // ==================================================

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      20,
                      20,
                      30,
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // ==================================================
                        // GREETING
                        // ==================================================

                        Text(
                          "Hello, ${users?.email?.split('@').first ?? 'there'} ✨",
                          style: const TextStyle(
                            color: plum,
                            fontSize: 27,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.8,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Let's see where your money went today.",
                          style: TextStyle(
                            color: plum.withOpacity(0.58),
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // DATE SELECTOR
                        // ==================================================

                        GestureDetector(
                          onTap: () async {
                            await selectDate();
                          },

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 17,
                              vertical: 14,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(19),

                              border: Border.all(
                                color: rose,
                                width: 1.3,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: plum.withOpacity(0.07),
                                  blurRadius: 15,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [

                                Container(
                                  height: 43,
                                  width: 43,

                                  decoration: BoxDecoration(
                                    color: rose,
                                    borderRadius:
                                        BorderRadius.circular(14),
                                  ),

                                  child: const Icon(
                                    Icons.calendar_month_rounded,
                                    color: plum,
                                    size: 22,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Text(
                                        "EXPENSE DATE",
                                        style: TextStyle(
                                          color:
                                              plum.withOpacity(0.45),
                                          fontSize: 9,
                                          fontWeight:
                                              FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),

                                      const SizedBox(height: 3),

                                      Text(
                                        selectedDate == null
                                            ? "Choose a day"
                                            : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",

                                        style: const TextStyle(
                                          color: plum,
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding:
                                      const EdgeInsets.all(7),

                                  decoration: BoxDecoration(
                                    color: plum,
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),

                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ==================================================
                        // TOTAL EXPENSE HERO CARD
                        // ==================================================

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(22),

                          decoration: BoxDecoration(
                            color: plum,
                            borderRadius:
                                BorderRadius.circular(28),

                            boxShadow: [
                              BoxShadow(
                                color: plum.withOpacity(0.25),
                                blurRadius: 22,
                                offset: const Offset(0, 11),
                              ),
                            ],
                          ),

                          child: Stack(
                            children: [

                              // decorative circle
                              Positioned(
                                right: -25,
                                top: -35,

                                child: Container(
                                  height: 130,
                                  width: 130,

                                  decoration: BoxDecoration(
                                    color: peach.withOpacity(0.18),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),

                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [

                                  Row(
                                    children: [

                                      Container(
                                        padding:
                                            const EdgeInsets.all(9),

                                        decoration: BoxDecoration(
                                          color: Colors.white
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(
                                                  12),
                                        ),

                                        child: const Icon(
                                          Icons
                                              .account_balance_wallet_rounded,
                                          color: butter,
                                          size: 20,
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      const Text(
                                        "TODAY'S SPENDING",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11,
                                          fontWeight:
                                              FontWeight.bold,
                                          letterSpacing: 1.3,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 15),

                                  StreamBuilder<QuerySnapshot>(
                                    stream: selectedDate == null
                                        ? null
                                        : FirebaseFirestore
                                            .instance
                                            .collection("dayinfo")
                                            .where(
                                              "user_id",
                                              isEqualTo:
                                                  users!.uid,
                                            )
                                            .where(
                                              "date",
                                              isEqualTo:
                                                  Timestamp.fromDate(
                                                selectedDate!,
                                              ),
                                            )
                                            .snapshots(),

                                    builder:
                                        (context, snapshot) {

                                      if (selectedDate == null) {
                                        return const Text(
                                          "₹ 0",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 39,
                                            fontWeight:
                                                FontWeight.w900,
                                          ),
                                        );
                                      }

                                      if (snapshot
                                              .connectionState ==
                                          ConnectionState.waiting) {
                                        return const SizedBox(
                                          height: 40,
                                          width: 40,
                                          child:
                                              CircularProgressIndicator(
                                            color: butter,
                                            strokeWidth: 3,
                                          ),
                                        );
                                      }

                                      if (snapshot.hasError) {
                                        print(
                                            "ERROR: ${snapshot.error}");

                                        return const Text(
                                          "₹ 0",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 39,
                                            fontWeight:
                                                FontWeight.w900,
                                          ),
                                        );
                                      }

                                      if (!snapshot.hasData ||
                                          snapshot
                                              .data!.docs.isEmpty) {
                                        return const Text(
                                          "₹ 0",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 39,
                                            fontWeight:
                                                FontWeight.w900,
                                          ),
                                        );
                                      }

                                      final doc =
                                          snapshot.data!.docs.first;

                                      final data = doc.data()
                                          as Map<String, dynamic>;

                                      print(
                                          "TOTAL = ${data["total"]}");

                                      return Text(
                                        "₹ ${data["total"]}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 39,
                                          fontWeight:
                                              FontWeight.w900,
                                        ),
                                      );
                                    },
                                  ),

                                  const SizedBox(height: 5),

                                  Text(
                                    selectedDate == null
                                        ? "Select a date to see your spending"
                                        : "Everything you spent on this day",
                                    style: TextStyle(
                                      color:
                                          Colors.white.withOpacity(
                                              0.58),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ==================================================
                        // ADD EXPENSE TITLE
                        // ==================================================

                        Row(
                          children: [

                            const Expanded(
                              child: Text(
                                "Add something",
                                style: TextStyle(
                                  color: plum,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),

                              decoration: BoxDecoration(
                                color: butter,
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),

                              child: const Text(
                                "NEW",
                                style: TextStyle(
                                  color: plum,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // EXPENSE INPUT CARD
                        // ==================================================

                        Container(
                          padding: const EdgeInsets.all(17),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(25),

                            boxShadow: [
                              BoxShadow(
                                color: plum.withOpacity(0.07),
                                blurRadius: 18,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),

                          child: Form(
                            key: _formKey,

                            child: Column(
                              children: [

                                // PLACE
                                TextFormField(
                                  controller: placeController,

                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return "please enter place";
                                    }

                                    return null;
                                  },

                                  style: const TextStyle(
                                    color: plum,
                                    fontWeight: FontWeight.w600,
                                  ),

                                  decoration:
                                      InputDecoration(
                                    hintText:
                                        "Where did you spend?",
                                    hintStyle: TextStyle(
                                      color: plum.withOpacity(0.35),
                                      fontSize: 13,
                                    ),

                                    prefixIcon: Container(
                                      margin:
                                          const EdgeInsets.all(8),

                                      decoration: BoxDecoration(
                                        color: rose,
                                        borderRadius:
                                            BorderRadius.circular(
                                                12),
                                      ),

                                      child: const Icon(
                                        Icons.location_on_rounded,
                                        color: plum,
                                        size: 20,
                                      ),
                                    ),

                                    filled: true,
                                    fillColor: cream,

                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(17),
                                      borderSide:
                                          BorderSide.none,
                                    ),

                                    errorBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(17),
                                      borderSide:
                                          const BorderSide(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 12),

                                // AMOUNT
                                TextFormField(
                                  controller: costController,

                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty) {
                                      return "please enter cost";
                                    }

                                    return null;
                                  },

                                  keyboardType:
                                      TextInputType.number,

                                  style: const TextStyle(
                                    color: plum,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  decoration:
                                      InputDecoration(
                                    hintText: "How much?",
                                    hintStyle: TextStyle(
                                      color: plum.withOpacity(0.35),
                                      fontSize: 13,
                                    ),

                                    prefixIcon: Container(
                                      margin:
                                          const EdgeInsets.all(8),

                                      decoration: BoxDecoration(
                                        color: butter,
                                        borderRadius:
                                            BorderRadius.circular(
                                                12),
                                      ),

                                      child: const Icon(
                                        Icons.currency_rupee_rounded,
                                        color: plum,
                                        size: 20,
                                      ),
                                    ),

                                    filled: true,
                                    fillColor: cream,

                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(17),
                                      borderSide:
                                          BorderSide.none,
                                    ),

                                    errorBorder:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(17),
                                      borderSide:
                                          const BorderSide(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                // ADD BUTTON
                                SizedBox(
                                  width: double.infinity,
                                  height: 55,

                                  child: ElevatedButton(
                                    onPressed: () async {

                                      if (_formKey.currentState!
                                          .validate()) {

                                        if (selectedDate == null) {

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Please select a date first",
                                              ),
                                            ),
                                          );

                                          return;
                                        }

                                        await addcost();
                                      }
                                    },

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: peach,
                                      foregroundColor: plum,
                                      elevation: 0,

                                      shape:
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                                17),
                                      ),
                                    ),

                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,

                                      children: [

                                        Icon(
                                          Icons.add_rounded,
                                          size: 22,
                                        ),

                                        SizedBox(width: 8),

                                        Text(
                                          "Add Expense",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w900,
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

                        const SizedBox(height: 27),

                        // ==================================================
                        // TRANSACTIONS HEADER
                        // ==================================================

                        Row(
                          children: [

                            const Expanded(
                              child: Text(
                                "Your spending",
                                style: TextStyle(
                                  color: plum,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),

                            if (selectedDate != null)
                              Text(
                                "Today's list",
                                style: TextStyle(
                                  color: plum.withOpacity(0.45),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        // ==================================================
                        // EXPENSE LIST
                        // ==================================================

                        StreamBuilder<QuerySnapshot>(
                          stream: selectedDate == null
                              ? null
                              : FirebaseFirestore.instance
                                  .collection("dayinfo")
                                  .where(
                                    "user_id",
                                    isEqualTo: users!.uid,
                                  )
                                  .where(
                                    "date",
                                    isEqualTo:
                                        Timestamp.fromDate(
                                      selectedDate!,
                                    ),
                                  )
                                  .snapshots(),

                          builder: (context, snapshot) {

                            if (selectedDate == null) {
                              return _emptyState(
                                icon:
                                    Icons.calendar_month_rounded,
                                title: "Pick a date first",
                                subtitle:
                                    "Your expenses will appear here",
                              );
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Padding(
                                padding:
                                    EdgeInsets.all(30),
                                child: Center(
                                  child:
                                      CircularProgressIndicator(
                                    color: plum,
                                  ),
                                ),
                              );
                            }

                            if (snapshot.hasError) {

                              print(snapshot.error);

                              return _emptyState(
                                icon: Icons.cloud_off_rounded,
                                title: "Oops!",
                                subtitle:
                                    "Unable to load expenses",
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {

                              return _emptyState(
                                icon:
                                    Icons
                                        .sentiment_satisfied_alt_rounded,
                                title:
                                    "No expenses yet",
                                subtitle:
                                    "A quiet spending day 🌱",
                              );
                            }

                            final doc =
                                snapshot.data!.docs.first;

                            final data =
                                doc.data()
                                    as Map<String, dynamic>;

                            final List all_tasks =
                                data["all_tasks"] ?? [];

                            print(
                                "ALL TASKS = $all_tasks");

                            return ListView.builder(
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(),

                              itemCount:
                                  all_tasks.length,

                              itemBuilder:
                                  (context, index) {

                                final one_task =
                                    all_tasks[index];

                                return _expenseTile(
                                  place:
                                      one_task["place"] ?? "",
                                  price:
                                      one_task["price"],
                                  index: index,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // EMPTY STATE
  // ============================================================

  Widget _emptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {

    const Color plum = Color(0xFF35152F);
    const Color cream = Color(0xFFFFF8EE);
    const Color rose = Color(0xFFF4D8D3);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Column(
        children: [

          Container(
            height: 58,
            width: 58,

            decoration: const BoxDecoration(
              color: rose,
              shape: BoxShape.circle,
            ),

            child: Icon(
              icon,
              color: plum,
              size: 27,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              color: plum,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: TextStyle(
              color: plum.withOpacity(0.48),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EXPENSE TILE
  // ============================================================

  Widget _expenseTile({
    required String place,
    required dynamic price,
    required int index,
  }) {

    const Color plum = Color(0xFF35152F);
    const Color peach = Color(0xFFF39A6B);
    const Color butter = Color(0xFFFFD978);
    const Color cream = Color(0xFFFFF8EE);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),

        boxShadow: [
          BoxShadow(
            color: plum.withOpacity(0.055),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Row(
        children: [

          // NUMBER / ICON
          Container(
            height: 48,
            width: 48,

            decoration: BoxDecoration(
              color: index.isEven ? butter : cream,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Icon(
              index.isEven
                  ? Icons.shopping_bag_rounded
                  : Icons.receipt_long_rounded,
              color: plum,
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          // PLACE
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  place,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: plum,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "Expense #${index + 1}",
                  style: TextStyle(
                    color: plum.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // PRICE
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,

            children: [

              Text(
                "₹ $price",
                style: const TextStyle(
                  color: plum,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 3),

              GestureDetector(
                onTap: () {
                  deletetask(index);
                },

                child: Container(
                  padding: const EdgeInsets.all(5),

                  decoration: BoxDecoration(
                    color: peach.withOpacity(0.13),
                    borderRadius:
                        BorderRadius.circular(8),
                  ),

                  child: const Icon(
                    Icons.delete_outline_rounded,
                    color: plum,
                    size: 17,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}