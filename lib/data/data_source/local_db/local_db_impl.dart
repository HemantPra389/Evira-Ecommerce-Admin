import 'package:image_picker/image_picker.dart';

import 'local_db.dart';

class LocalDBImpl implements LocalDB {
  List<XFile> imageFileList = [];
  @override
  Future<String> selectImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final List<XFile>? selectedImages =
          await imagePicker.pickMultiImage(imageQuality: 50);
      if (selectedImages!.isNotEmpty) {
        imageFileList.addAll(selectedImages);
      }
      print(imageFileList.length);
      return "Success";
    } catch (e) {
      print(e.toString());
    }
    return "";
  }

  @override
  List<XFile> showallImage() {
    return imageFileList;
  }

  @override
  String clearAll() {
    try {
      imageFileList.clear();
    } catch (e) {
      return "Error occured";
    }
    return "Success";
  }
}
