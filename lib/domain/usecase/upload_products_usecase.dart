import 'package:evira_ecommerce_admin/domain/entity/product_entity.dart';
import 'package:evira_ecommerce_admin/domain/repository/app_repository.dart';

class UploadProductsUsecase {
  final AppRepository appRepository;
  UploadProductsUsecase({required this.appRepository});
  Future<String> uploadProduct(ProductEntity productEntity) {
    return appRepository.uploadProduct(productEntity);
  }
}
