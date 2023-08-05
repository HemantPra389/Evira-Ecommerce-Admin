import 'package:evira_ecommerce_admin/data/data_source/network_db/network_db.dart';
import 'package:evira_ecommerce_admin/domain/entity/product_entity.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repository/app_repository.dart';
import '../data_source/local_db/local_db.dart';

class AppRepositoryImpl implements AppRepository {
  final LocalDB localDB;
  final NetworkDB networkDB;
  
  AppRepositoryImpl({required this.localDB, required this.networkDB});

  @override
  Future<String> selectImage() async {
    return await localDB.selectImage();
  }

  @override
  List<XFile> showallImage() {
    return localDB.showallImage();
  }

  @override
  String clearAll() {
    return localDB.clearAll();
  }

  @override
  Future<String> uploadProduct(ProductEntity productEntity) {
    return networkDB.uploadProduct(productEntity);
  }
}
