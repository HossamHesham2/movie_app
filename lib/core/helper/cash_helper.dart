import 'package:hive/hive.dart';
import 'package:movie_app/Features/auth/data/models/user_model.dart';

class CashHelper {
  static const String userKey = 'usersBox';
  static const String userModel = 'currentUser';

  static Future<Box<UserModel>> _openBox() async {
    if (!Hive.isBoxOpen(userKey)) {
      return await Hive.openBox(userKey);
    }
    return Hive.box<UserModel>(userKey);
  }

  static Future<void> saveUser(UserModel userModel) async {
    var box = await _openBox();
    await box.put(userKey, userModel);
  }

  static Future<UserModel?> getUser() async {
    var box = await _openBox();
    return box.get(userKey);
  }

  static Future<void> delete() async {
    var box = await _openBox();
    box.delete(userKey);
  }

  static Future<void> clearAll() async {
    var box = await _openBox();
    await box.clear();
  }
}
