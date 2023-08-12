import 'package:budget_app/models/spending_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/budeget_models.dart';

class DB_Helper {
  DB_Helper._();

  static final DB_Helper db_helper = DB_Helper._();
  static Database? db;

  Future initdB() async {
    String dbpath = await getDatabasesPath();
    String path = await join(dbpath, "budget.db");
    print("------------");
    print("Created.....");
    print("------------");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS budget(id INTEGER PRIMARY KEY AUTOINCRIMENT,category_name TEXT,category_image BLOB)");
      },
    );
  }

  Future<int?> addCategory({required BudgetModel dbModel}) async {
    await initdB();
    String query =
        "INSERT INTO budget(category_name,category_image) VALUES(?,?):";
    List arg = [dbModel.category_name, dbModel.category_image];
    int? res = await db?.rawInsert(query, arg);
    return res;
  }

  Future<List<BudgetModel>> fetchAllData() async {
    await initdB();
    String query = "SELECT * FROM budget;";
    List<Map<String, dynamic>>? responce = await db?.rawQuery(query);

    List<BudgetModel> allData =
        responce!.map((e) => BudgetModel.fromSQL(data: e)).toList();
    return allData;
  }

  Future<int?> DeleteData({required int id}) async {
    await initdB();
    String Query = "DELETE FROM budget WHERE id = ?";
    List args = [id];

    int? res = await db?.rawDelete(Query, args);
    return res;
  }

  Future<List<BudgetModel>?> FatchSearchData({String data = ""}) async {
    await initdB();
    String Query = "SELECT * FEOM budget WHERE category_name LIKE '%$data%';";

    List<Map<String, dynamic>>? res = await db?.rawQuery(Query);

    List<BudgetModel>? SearchData =
        await res?.map((e) => BudgetModel.fromSQL(data: e)).toList();

    return SearchData;
  }

  Future<int?> addSpending({required Spending_Model data}) async {
    await initdB();
    String query =
        "INSERT INTO spending(spending_name,spending_amount,spending_mode,spending_type,spending_date,spending_time)VALUES(?,?,?,?,?,?):";
    List arg = [
      data.spending_name,
      data.spending_amount,
      data.spending_mode,
      data.spending_type,
      data.date,
      data.time
    ];
    int? res = await db?.rawInsert(query, arg);
    return res;
  }

  Future<List<Spending_Model>> fatchSpending() async {
    await initdB();
    String Query = "SELECT * FROM spending";
    List<Map<String, dynamic>>? response = await db?.rawQuery(Query);

    List<Spending_Model> allData =
        response!.map((e) => Spending_Model.fromMap(data: e)).toList();
    return allData;
  }
}
