import 'package:image_picker/image_picker.dart';

abstract class LocalDB {
  Future<String> selectImage();
  List<XFile> showallImage();
  String clearAll();
}
