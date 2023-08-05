import '../repository/app_repository.dart';

class ClearAllUseCase {
  final AppRepository appRepository;
  ClearAllUseCase({required this.appRepository});
  String clearAll() {
    return appRepository.clearAll();
  }
}
