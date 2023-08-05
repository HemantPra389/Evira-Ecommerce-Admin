import 'package:image_picker/image_picker.dart';

class ProductEntity {
  String title;
  String description;
  String category;
  double price;
  List<XFile> imagesUrl;
  int quantity;

  ProductEntity({
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.imagesUrl,
    required this.quantity,
  });
}
