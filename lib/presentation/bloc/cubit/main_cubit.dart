import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evira_ecommerce_admin/domain/entity/product_entity.dart';
import 'package:evira_ecommerce_admin/domain/usecase/upload_products_usecase.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/usecase/clear_all_usecase.dart';
import '../../../domain/usecase/select_image_usecase.dart';
import '../../../domain/usecase/showall_image_usecase.dart';
import '../../../injection_container.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final List<XFile>? imageList = [];
  MainCubit() : super(MainInitial());
  Future<void> selectImage() async {
    emit(LoadingState());
    var selectionstatus =
        await locator.call<SelectImageUseCase>().selectImage();
    if (selectionstatus.toString() == "Success") {
      emit(ImageSelectedState());
    } else {
      emit(ImageSelectionFailure(error: selectionstatus.toString()));
    }
  }

  List<XFile> showAllImages() {
    var itemList = locator.call<ShowAllImageUseCase>().showallImage();
    return itemList;
  }

  Future<void> uploadProduct(ProductEntity productEntity) async {
    emit(UploadLoadingState());
    var status =
        await locator.call<UploadProductsUsecase>().uploadProduct(productEntity);
    if (status.toString() == "Success") {
      emit(UploadSuccessState());
    } else {
      emit(UploadFailureState(error: status.toString()));
    }
  }

  void clearAll() {
    emit(ClearLoadingState());
    var status = locator.call<ClearAllUseCase>().clearAll();
    if (status.toString() == "Success") {
      emit(ClearSuccessState());
    } else {
      emit(ClearFailureState(error: status.toString()));
    }
  }
}
