import 'dart:typed_data';

import 'package:budget_app/models/budeget_models.dart';
import 'package:budget_app/views/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Read_Data extends StatefulWidget {
  const Read_Data({super.key});

  @override
  State<Read_Data> createState() => _Read_DataState();
}

class _Read_DataState extends State<Read_Data> {
  late Future<List<BudgetModel>?> getAllData;

  @override
  void initState() {
    getAllData = DB_Helper.db_helper.fetchAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data "),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (val) {
                  setState(
                    () {
                      getAllData =
                          DB_Helper.db_helper.FatchSearchData(data: val);
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: getAllData,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  List<BudgetModel>? data = snapshot.data;
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("Data is not available"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text("${data[i].category_name}"),
                          subtitle: Text("${data[i].id}"),
                          leading: CircleAvatar(
                            child: Image.memory(
                                data[i].category_image as Uint8List),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Get.snackbar("App...", "success");
                              setState(
                                () {
                                  DB_Helper.db_helper
                                      .DeleteData(id: data[i].id!);
                                },
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        );
                      },
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
