import 'package:foody_app/model/product/product_model.dart';
import 'package:foody_app/ultils/db.dart';
import 'package:sqflite/sqflite.dart';

class ProductModelDAO {
  static const TABLE_NAME = 'cart';
  static const COL_ID = 'ID';
  static const COL_PROID = 'PRODUCT_ID';
  static const COL_NAME = 'PRODUCT_NAME';
  static const COL_PRICE = 'PRODUCT_PRICE';
  static const COL_INIT_PRICE = 'PRODUCT_INIT_PRICE';
  static const COL_QUANTITY = 'PRODUCT_QUANTITY';
  static const COL_IMAGE = 'PRODUCT_IMAGE';
  static const COL_TYPE = 'PRODUT_TYPE';

  static String createTable() => '''
create table if not exist $TABLE_NAME(
  $COL_ID integer primary key autoincrement not null,
  $COL_PROID text,
  $COL_NAME TEXT,
  $COL_PRICE REAL,
  $COL_QUANTITY INTEGER,
  $COL_INIT_PRICE REAL,
  $COL_TYPE TEXT.
  $COL_IMAGE TEXT,
);
''';
  Future<bool> insert(ProductModel product) async {
    final db = await DB().open();
    final result = await db.insert(
      TABLE_NAME,
      _toMap(product),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    db.close();
    return result > 0;
  }

  Future<bool> update(ProductModel product) async {
    return false;
  }

  Map<String, dynamic> _toMap(ProductModel product) {
    return {
      COL_NAME: product.productName,
      COL_IMAGE: product.image,
      COL_PROID: product.id,
      COL_QUANTITY: product.quantity,
      COL_PRICE: product.productPrice,
      COL_INIT_PRICE: product.initialPrice,
      COL_TYPE: product.unitType,
    };
  }

  ProductModel _toProductModel(Map<String, dynamic> map) {
    return ProductModel(
      id: map[COL_ID],
      image: map[COL_IMAGE],
      initialPrice: map[COL_ID],
      productId: map[COL_ID],
      productName: map[COL_ID],
      productPrice: map[COL_ID],
      quantity: map[COL_QUANTITY],
      unitType: map[COL_TYPE],
    );
  }
}
