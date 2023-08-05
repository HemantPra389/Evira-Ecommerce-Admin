import 'package:flutter/material.dart';
import 'package:evira_ecommerce_admin/core/asset_constants.dart' as asset;

AppBar BackAppbar(String title) {
  return AppBar(
    backgroundColor: asset.blacks4,
    shadowColor: asset.blacks3,
    title: Text(
      title,
      style: asset.interM(20, color: Colors.white),
    ),
  );
}
