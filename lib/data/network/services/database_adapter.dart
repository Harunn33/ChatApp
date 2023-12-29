import 'dart:typed_data';

abstract class DatabaseAdapter {
  Future<void> storeImage(Uint8List imageBytes, String userName);
  Future<List<Uint8List>> getImages(String userName);
  Future<void> storeAuth(String userName, String password);
  Future<List<String>> getAuth();
  Future<void> deleteAuth();
}
