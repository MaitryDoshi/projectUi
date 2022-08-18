import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import '../model/init_commissioning.dart';

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'test.db';
  static const String Table_user = 'user';

  static const String model = 'model';
  static const String equnumber = 'equnumber';
  static const String hours = 'hours';
  static const String kmreading = 'kmreading';
  static const String equstatus = 'equstatus';
  static const String dod = 'dod';
  static const String sysAffect = 'sysAffect';
  static const String remarks = 'remarks';
  //static const String images = 'images';
  static const String address = 'address';
  static const String pincode = 'pincode';
  static const String city = 'city';
  static const String state = 'state';
  static const String nearbyStation = 'nearbyStation';
  static const String name = 'name';
  static const String phone = 'phone';

  Future<Database?> get db async{
    if(_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE $Table_user("
        " $model TEXT, "
        " $equnumber TEXT, "
        " $hours TEXT, "
        " $kmreading TEXT, "
        " $equstatus TEXT, "
        " $dod TEXT, "
        " $sysAffect TEXT, "
        " $remarks TEXT, "
        //" $images TEXT, "
        " $address TEXT, "
        " $pincode TEXT, "
        " $city TEXT, "
        " $state TEXT, "
        " $nearbyStation TEXT, "
        " $name TEXT, "
        " $phone TEXT, "
        " PRIMARY KEY ($model)"
        ")");
  }

  Future<int> saveData(InitCommissioning initCommissioning) async{
    var Db = await db;
    var res = await Db!.insert(Table_user, initCommissioning.toMap());
    return res;
  }

  Future<InitCommissioning?> getData(String model, String equno, String hrmeter, String kmreading, String equstatus, String dod, String sysAffect, String remarks, String address, String pincode, String city, String state, String nearbyStation, String name, String phone) async{
    var Db = await db;
    var res = await Db!.rawQuery("SELECT * FROM $Table_user WHERE "
        "model = '$model' "
    );
    if (res.length > 0) {
      return InitCommissioning.fromMap(res.first);
    }
    return null;
  }

  Future<int> updateData(InitCommissioning userData) async{
    var Db = await db;
    var res = await Db!.update(Table_user, userData.toMap(),
      where: '$model = ?', whereArgs: [userData.model]);
    return res;
  }

  Future<int> deleteData(String model) async{
    var Db = await db;
    var res = await Db!.delete(Table_user, where: '$model = ?', whereArgs: [model]);
    return res;
  }
}

