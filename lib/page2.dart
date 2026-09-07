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
  List<Map<String, dynamic>> cost = [];
  List days = [];

  int sum = 0;

  TextEditingController placeController=TextEditingController();
  TextEditingController costController=TextEditingController();
  User? users = FirebaseAuth.instance.currentUser;


final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    placeController = TextEditingController();
    costController = TextEditingController();
  }

 Future<void> addcost() async {
  Map<String, dynamic> newTask = {
    "place": placeController.text,
    "price": num.tryParse(costController.text) ?? 0,
  };


  // Find dayinfo for this user and selected date
  final userInfo = await FirebaseFirestore.instance
      .collection("dayinfo")
      .where("user_id", isEqualTo: users!.uid)
      .where("date", isEqualTo: selectedDate)
      .get();

  // If no document exists, CREATE one
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

  // Existing document
  final doc = userInfo.docs.first;

  Map<String, dynamic> data = doc.data();

  // Get old total
  num oldTotal = data["total"] ?? 0;

  // Get existing tasks
  List<Map<String, dynamic>> allTasks = [];

  if (data["all_tasks"] != null) {
    allTasks = List<Map<String, dynamic>>.from(
      (data["all_tasks"] as List).map(
        (task) => Map<String, dynamic>.from(task),
      ),
    );
  }

  // Add new task
  allTasks.add(newTask);

  // Add new price to total
  num newTotal =
      oldTotal + (num.tryParse(costController.text) ?? 0);

  // Update existing document
  await FirebaseFirestore.instance
      .collection("dayinfo")
      .doc(doc.id)
      .update({
        "total": newTotal,
        "all_tasks": allTasks,
      });

  print("Updated successfully");
  costController.clear();
  placeController.clear();
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

  // Get the document
  final doc = userInfo.docs.first;

  // Get document data
  final data = doc.data();

  // Get all tasks
  final List all_tasks = List.from(data["all_tasks"] ?? []);

  print("BEFORE DELETE = $all_tasks");

  // Delete task at particular index
  all_tasks.removeAt(index);

  print("AFTER DELETE = $all_tasks");

  // Calculate total again
  num sum = 0;

  for (final element in all_tasks) {
    sum += (element["price"] as num);
  }

  print("NEW TOTAL = $sum");

  // Update Firestore
  await doc.reference.update({
    "all_tasks": all_tasks,
    "total": sum,
  });

  print("Task deleted successfully");
}
   Future<void> logout() async{
    print("logout pressed");
    await FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [

        /// App Logo
       
        Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

    // ================= LOGO + APP NAME =================
    Row(
      children: [

        // Logo
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.teal,
                Colors.green,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.teal.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.white,
            size: 34,
          ),
        ),

        const SizedBox(width: 14),

        // App Name + Tagline
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "SpendWise",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
                letterSpacing: 0.5,
              ),
            ),

            SizedBox(height: 3),

            Text(
              "Track Every Rupee",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    ),

    // ================= ACTION BUTTONS =================
    Row(
      children: [

        // Profile Button
       Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 8,
  ),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [

      // Profile Icon
      Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.person_rounded,
          color: Colors.teal,
          size: 26,
        ),
      ),

      const SizedBox(width: 10),

      // User Information
      
      Text(
        users!.email!.split('@').first ?? 'No email',
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    ],
  ),
),

        const SizedBox(width: 10),

        // Logout Button
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            onPressed: logout,
            icon: const Icon(
              Icons.logout_rounded,
              color: Colors.white,
            ),
            tooltip: "Logout",
          ),
        ),
      ],
    ),
  ],
),

        const SizedBox(height: 10),

       
        const SizedBox(height: 20),

        /// Input Card
        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: _formKey,
              child: Column(
                children: [

      SizedBox(
  width: double.infinity,
  height: 52,
  child: ElevatedButton.icon(
    onPressed: () async {
      await selectDate();
    },

    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.teal.withOpacity(0.3),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),

    icon: const Icon(
      Icons.calendar_month_rounded,
    ),

    label: Text(
      selectedDate == null
          ? "Select Date"
          : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: placeController,
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "please enter place";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Where did you spend?",
                      labelText: "Place",
                      prefixIcon: const Icon(Icons.place),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 15),
              
                  TextFormField(
                    controller: costController,
                    validator: (value) {
                      if (value==null || value.isEmpty) {
                        return "please enter cost";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter Amount",
                      labelText: "Amount",
                      prefixIcon: const Icon(Icons.currency_rupee),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
              
                  const SizedBox(height: 20),
              
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () async {
  if (_formKey.currentState!.validate()) {

    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a date first"),
        ),
      );
      return;
    }

    await addcost();
  }
} ,
                      icon: const Icon(Icons.add),
                      label: const Text(
                        "Add Expense",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// Total Card
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.teal,
                Colors.green,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 22,
            ),
            child: Column(
              children: [

                const Text(
                  "Today's Expense",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 8),
               StreamBuilder<QuerySnapshot>(
  stream: selectedDate == null
      ? null
      : FirebaseFirestore.instance
          .collection("dayinfo")
          .where("user_id", isEqualTo: users!.uid)
          .where(
            "date",
            isEqualTo: Timestamp.fromDate(selectedDate!),
          )
          .snapshots(),

  builder: (context, snapshot) {

    // No date selected
    if (selectedDate == null) {
      return const Text(
        "₹ 0",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // Loading
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator(
        color: Colors.white,
      );
    }

    // Error
    if (snapshot.hasError) {
      print("ERROR: ${snapshot.error}");

      return const Text(
        "₹ 0",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // No document found
    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      print("No expense found for this date");

      return const Text(
        "₹ 0",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // Get first matching document
    final doc = snapshot.data!.docs.first;

    final data = doc.data() as Map<String, dynamic>;

    // Print total
    print("TOTAL = ${data["total"]}");

    return Text(
      "₹ ${data["total"]}",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  },
),
               
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

       Expanded(
  child: StreamBuilder<QuerySnapshot>(
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
              isEqualTo: Timestamp.fromDate(selectedDate!),
            )
            .snapshots(),

    builder: (context, snapshot) {

      // Date not selected
      if (selectedDate == null) {
        return const Center(
          child: Text("Please select a date"),
        );
      }

      // Loading
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // Error
      if (snapshot.hasError) {
        print(snapshot.error);

        return const Center(
          child: Text("Unable to load expenses"),
        );
      }

      // No document
      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        return const Center(
          child: Text("No expenses for this day"),
        );
      }

      // Get Firestore document
      final doc = snapshot.data!.docs.first;

      final data = doc.data() as Map<String, dynamic>;

      // all_tasks is already a List
      final List all_tasks = data["all_tasks"] ?? [];

      print("ALL TASKS = $all_tasks");

      return ListView.builder(
        itemCount: all_tasks.length,

        itemBuilder: (context, index) {

          final one_task = all_tasks[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(15),
            child: ListTile(
              title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  one_task["place"] ?? "",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "₹ ${one_task["price"]}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ],
              ),
              trailing: IconButton(onPressed: (){
                deletetask(index);
              }, icon: Icon(Icons.delete_outline_rounded)),
            ),
            
          );
        },
      );
    },
  ),
),

       
      ],
    ),
  ),
),
    );
  }
}