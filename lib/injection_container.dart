import 'package:evira_ecommerce_admin/domain/usecase/upload_products_usecase.dart';
import 'package:get_it/get_it.dart';

import 'data/data_source/local_db/local_db.dart';
import 'data/data_source/local_db/local_db_impl.dart';
import 'data/data_source/network_db/network_db.dart';
import 'data/data_source/network_db/network_db_impl.dart';
import 'data/repository/app_repository_impl.dart';
import 'domain/repository/app_repository.dart';
import 'domain/usecase/clear_all_usecase.dart';
import 'domain/usecase/select_image_usecase.dart';
import 'domain/usecase/showall_image_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //usecase
  locator.registerLazySingleton<SelectImageUseCase>(
      () => SelectImageUseCase(appRepository: locator()));
  locator.registerLazySingleton<ShowAllImageUseCase>(
      () => ShowAllImageUseCase(appRepository: locator()));
  locator.registerLazySingleton<UploadProductsUsecase>(
      () => UploadProductsUsecase(appRepository: locator()));
  locator.registerLazySingleton<ClearAllUseCase>(
      () => ClearAllUseCase(appRepository: locator()));

  //repository
  locator.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(localDB: locator(), networkDB: locator()));

  //DB
  locator.registerLazySingleton<LocalDB>(() => LocalDBImpl());
  locator.registerLazySingleton<NetworkDB>(() => NetworkDBImpl());
}
