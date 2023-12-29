import 'dart:typed_data';

import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:hive/hive.dart';

class HiveService extends DatabaseAdapter {
  @override
  Future<List<Uint8List>> getImages(String? userName) async {
    var box = await Hive.openBox('imageBox');

    List<dynamic> result = box.get(userName) ?? [];
    return result.cast<Uint8List>();
  }

  @override
  Future<void> storeImage(Uint8List imageBytes, String userName) async {
    List<Uint8List> images = [];

    var box = await Hive.openBox('imageBox');

    List<dynamic>? allImages = box.get(userName);

    if (allImages != null) {
      images.addAll(allImages.cast<Uint8List>());
    }
    images.add(imageBytes);
    box.put(userName, images);
  }

  @override
  Future<List<String>> getAuth() async {
    var box = await Hive.openBox('authBox');
    final String userName = box.get('username') ?? '';
    final String password = box.get('password') ?? '';
    List<String> auth = [userName, password];
    return auth;
  }

  @override
  Future<void> storeAuth(String userName, String password) async {
    final String userName0 = userName;
    final String password0 = password;
    var box = await Hive.openBox('authBox');
    box.put('username', userName0);
    box.put('password', password0);
  }

  @override
  Future<void> deleteAuth() async {
    await Hive.deleteBoxFromDisk('authBox');
  }
}
