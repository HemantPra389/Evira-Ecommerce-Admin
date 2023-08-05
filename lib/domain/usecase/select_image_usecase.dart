import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/app_repository.dart';

class SelectImageUseCase {
  final AppRepository appRepository;
  SelectImageUseCase({required this.appRepository});

  Future<String> selectImage() async {
    return await appRepository.selectImage();
  }
}
