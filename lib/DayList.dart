import 'package:flutter/material.dart';

class Daylist extends StatefulWidget {
  final Map<String, dynamic> dayinfo;
  final int index;

  const Daylist({
    super.key,
    required this.dayinfo,
    required this.index,
  });

  @override
  State<Daylist> createState() => _DaylistState();
}

class _DaylistState extends State<Daylist> {
  @override
  Widget build(BuildContext context) {
    final List tasks = widget.dayinfo["all_tasks"];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "Day ${widget.index + 1}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 20),

          /// Total Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [

                    const Icon(
                      Icons.account_balance_wallet,
                      color: Colors.white,
                      size: 45,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "SpendWise",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      "Total Expense",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "₹${widget.dayinfo["total"]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(left: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Expenses",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: tasks.length,
              itemBuilder: (context, index) {

                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(

                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.teal,
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                      ),
                    ),

                    title: Text(
                      tasks[index]["place"],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    subtitle: const Text(
                      "Expense",
                    ),

                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "₹${tasks[index]["price"]}",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}