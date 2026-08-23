import 'package:expense_wise/DayList.dart';
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

final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    placeController = TextEditingController();
    costController = TextEditingController();
  }

  void addcost() {
    setState(() {
      Map<String, dynamic> temp = {};

      temp["place"] = placeController.text;
      temp["price"] = costController.text;

      cost.add(temp);

      costController.clear();
      placeController.clear();

      sum = 0;

      for (Map data in cost) {
        sum += int.parse(data["price"]);
      }
    });
  }

  void removecost(int index) {
    setState(() {
      cost.remove(cost[index]);

      sum = 0;

      for (Map data in cost) {
        sum += int.parse(data["price"]);
      }
    });
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
  void addtoday() {
    setState(() {
      Map<String, dynamic> dayinfo = {};
      dayinfo["date"]=selectedDate;
      dayinfo["total"] = sum;
      dayinfo["all_tasks"] = List<Map<String, dynamic>>.from(cost);

      days.add(dayinfo);

      sum = 0;
      cost = [];
    });
  }

  int selectedindex = 0;
    List<Widget> get widgets => [
        // ================= ADD EXPENSE PAGE =================
    Center(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [

        /// App Logo
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.teal,
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.white,
            size: 45,
          ),
        ),

        const SizedBox(height: 10),

        const Text(
          "SpendWise",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),

        const Text(
          "Track Every Rupee",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

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
                      onPressed:(){
                        if(_formKey.currentState!.validate()){
                          addcost();
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

                Text(
                  "₹ $sum",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        Expanded(
          child: cost.isEmpty
              ? Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    
                        Icon(
                          Icons.receipt_long,
                          size: 90,
                          color: Colors.grey.shade400,
                        ),
                    
                        const SizedBox(height: 10),
                    
                        Text(
                          "No Expenses Yet",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: cost.length,
                  itemBuilder: (context, index) {

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: ListTile(

                        leading: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: const Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                        ),

                        title: Text(
                          cost[index]["place"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        subtitle: Text(
                          "₹ ${cost[index]["price"]}",
                        ),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                          ),
                          onPressed: () => removecost(index),
                        ),
                      ),
                    );
                  },
                ),
        ),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: (){
               selectDate();
               addtoday();
            },
            icon: const Icon(Icons.save),
            label: Text(
              selectedDate == null
              ? "save Today"
              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            ),
          ),
        ),
      ],
    ),
  ),
),
       days.isEmpty
    ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.calendar_month_rounded,
              size: 90,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 15),

            const Text(
              "No Days Added",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Save your first day's expenses",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
    : Padding(
        padding: const EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: days.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 6,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(

                contentPadding: const EdgeInsets.all(15),

                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.teal,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                title: Text(
                  days[index]["date"] != null
                      ? "${days[index]["date"].day}/${days[index]["date"].month}/${days[index]["date"].year}"
                      : "Unknown date",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 8),

                    Row(
                      children: [

                        const Icon(
                          Icons.currency_rupee,
                          color: Colors.green,
                          size: 18,
                        ),

                        Text(
                          "${days[index]["total"]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    Row(
                      children: [

                        const Icon(
                          Icons.receipt_long,
                          color: Colors.orange,
                          size: 18,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          "${days[index]["all_tasks"].length} Expenses",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                trailing: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Colors.teal,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Daylist(
                            dayinfo: days[index],
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: widgets[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History",
          ),
        ],
      ),
    );
  }
}