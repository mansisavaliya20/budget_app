import 'package:budget_app/views/helper_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/budeget_models.dart';
import 'globals.dart';

class Add_Category extends StatefulWidget {
  const Add_Category({super.key});

  @override
  State<Add_Category> createState() => _Add_CategoryState();
}

class _Add_CategoryState extends State<Add_Category> {
  TextEditingController categoryNameController = TextEditingController();
  String categoryName = " ";
  ByteData? imgbytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Budget App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Uint8List categoryimg =
              Uint8List.fromList(imgbytes!.buffer.asInt8List());

          BudgetModel dbModel = BudgetModel(
              category_name: categoryNameController.text,
              category_image: categoryName);

          int? res = await DB_Helper.db_helper.addCategory(dbModel: dbModel);

          if (res! >= 1) {
            Get.snackbar("Budget App", "Successfully added at $res");
          } else {
            Get.snackbar("Budget App", "Failed");
          }
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    controller: categoryNameController,
                    decoration: InputDecoration(
                        hintText: "Enter Name............",
                        label: Text("Category Name"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
              )),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemCount: Globals.allImages.length,
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () async {
                    imgbytes = await rootBundle.load(Globals.allImages[i]);
                  },
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Globals.allImages[i],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
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
