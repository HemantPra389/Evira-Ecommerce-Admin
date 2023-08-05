part of 'main_cubit.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitial extends MainState {}
class ImageSelectedState extends MainState {}

class LoadingState extends MainState {}

class ImageSelectionFailure extends MainState {
  String error;
  ImageSelectionFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class ShowAllImageState extends MainState {
  List<XFile>? imageList;
  ShowAllImageState({required this.imageList});
  @override
  List<Object> get props => [imageList!];
}

class ClearSuccessState extends MainState {}
class ClearLoadingState extends MainState{}
class ClearFailureState extends MainState{
  String error;
  ClearFailureState({required this.error});
  @override
  List<Object> get props => [error];
}
class UploadSuccessState extends MainState {}

class UploadLoadingState extends MainState {}

class UploadFailureState extends MainState {
  String error;
  UploadFailureState({required this.error});
  @override
  List<Object> get props => [error];
}