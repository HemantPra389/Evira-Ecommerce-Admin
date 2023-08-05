import 'package:image_picker/image_picker.dart';

import '../repository/app_repository.dart';

class ShowAllImageUseCase {
  final AppRepository appRepository;
  ShowAllImageUseCase({required this.appRepository});
  List<XFile> showallImage() {
    return appRepository.showallImage();
  }
}
