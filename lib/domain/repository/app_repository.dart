import 'package:image_picker/image_picker.dart';

import '../entity/product_entity.dart';

abstract class AppRepository {
  Future<String> selectImage();
  List<XFile> showallImage();
  String clearAll();
  Future<String> uploadProduct(ProductEntity productEntity);
}
