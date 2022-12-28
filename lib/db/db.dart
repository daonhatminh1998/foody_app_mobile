import 'package:foody_app/db/product_model_DAO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static const DB_NAME = 'cart_management';
  static const DB_VERSION = 1;

  Future<Database> open() async {
    final db = openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: DB_VERSION, onCreate: ((db, version) async {
      await db.execute(ProductModelDAO.createTable());
    }));
    return db;
  }
}
