import 'dart:ui';

import 'package:flutter/material.dart';

class Spending_Components extends StatefulWidget {
  const Spending_Components({super.key});

  @override
  State<Spending_Components> createState() => _Spending_ComponentsState();
}

class _Spending_ComponentsState extends State<Spending_Components> {
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime = TimeOfDay.now();
  TextEditingController spending_name_controller = TextEditingController();
  TextEditingController spending_amount_controller = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? spending_name;
  String? spending_amount;
  String? spending_mode;
  String? spending_type;
  DateTime? date;
  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Text("add"),
        icon: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: Text("Add Spending Components"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: spending_name_controller,
                      onSaved: (val) {
                        spending_name = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Expense";
                        } else {}
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Expense Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: spending_name_controller,
                      onSaved: (val) {
                        spending_name = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Expense Amount";
                        } else {}
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Expense Amount",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(2002),
                              lastDate: DateTime(2025),
                            );
                            setState(() {
                              date = dateTime;
                            });
                          },
                          icon: Icon(Icons.watch),
                        ),
                        IconButton(
                          onPressed: () async {
                            DateTime? dateTime = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(2002),
                              lastDate: DateTime(2025),
                            );
                            setState(() {
                              date = dateTime;
                            });
                          },
                          icon: Icon(Icons.watch),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
