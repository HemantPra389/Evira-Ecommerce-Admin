import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:evira_ecommerce_admin/core/asset_constants.dart' as asset;

import '../bloc/cubit/main_cubit.dart';
import '../widgets/back_appbar.dart';

class AllImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<XFile> imageList = BlocProvider.of<MainCubit>(context).showAllImages();
    return Scaffold(
      appBar: BackAppbar("All Images"),
      backgroundColor: asset.blacks2,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.only(top: 8),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
                crossAxisSpacing: 8),
            itemCount: imageList.length,
            itemBuilder: (context, index) {
              return Image.file(
                File(imageList[index].path),
                fit: BoxFit.cover,
              );
            }),
      ),
    );
  }
}
