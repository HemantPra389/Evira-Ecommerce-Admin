import '../../../domain/entity/product_entity.dart';

abstract class NetworkDB{
  Future<String> uploadProduct(ProductEntity productEntity);
}