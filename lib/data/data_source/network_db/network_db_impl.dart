import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evira_ecommerce_admin/data/data_source/network_db/network_db.dart';
import 'package:evira_ecommerce_admin/domain/entity/product_entity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

class NetworkDBImpl extends NetworkDB {
  double generateRating() {
    final random = Random();
    double min = 2.0;
    double max = 5.0;

    // Generate a random double between 0.0 and 1.0
    double randomDouble = random.nextDouble();

    // Scale the random double to fit the range [2.0, 5.0]
    double result = min + randomDouble * (max - min);

    // Format the result to have only one digit after the decimal point
    return double.parse(result.toStringAsFixed(1));
  }

  int getSold() {
    final random = Random();
    int min = 500;
    int max = 5000;

    // Generate a random integer between 0 and (max - min)
    int randomInt = random.nextInt(max - min + 1);

    // Add the minimum value to the random integer to fit the range [500, 5000]
    int result = min + randomInt;

    return result;
  }

  @override
  Future<String> uploadProduct(ProductEntity productEntity) async {
    var uuid = Uuid();
    List<String> imageList;
    try {
      imageList = await uploadFiles(productEntity.imagesUrl,
              productEntity.category, productEntity.title)
          .whenComplete(() => print("Khush ho bhai"));
    } on FirebaseException catch (e) {
      return e.message.toString();
    }
    try {
      await FirebaseFirestore.instance.collection('products').add({
        'id': uuid.v1(),
        'title': productEntity.title,
        'description': productEntity.description,
        'category': productEntity.category.toLowerCase(),
        'price': productEntity.price,
        'imageUrls': imageList,
        'rating': generateRating(),
        'sold': getSold(),
        'quantity': productEntity.quantity,
        'createdAt': DateTime.now()
      });
    } on FirebaseException catch (e) {
      return e.message.toString();
    }

    return "Success";
  }

  Future<void> deleteAllEntries() async {
    try {
      // Get a reference to the Firestore collection you want to delete from
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('products');

      // Fetch all documents in the collection
      QuerySnapshot querySnapshot = await collectionReference.get();

      // Create a batch to perform the delete operation
      WriteBatch writeBatch = FirebaseFirestore.instance.batch();

      // Iterate through each document and add the delete operation to the batch
      querySnapshot.docs.forEach((document) {
        writeBatch.delete(document.reference);
      });

      // Commit the batch
      await writeBatch.commit();

      print('All entries deleted successfully!');
    } catch (e) {
      print('Error deleting entries: $e');
    }
  }

  Future<List<String>> uploadFiles(
      List<XFile> _images, String category, String productTitle) async {
    var imageUrls = await Future.wait(_images.map(
        (_image) => uploadFile(File(_image.path), category, productTitle)));
    return imageUrls;
  }

  Future<String> uploadFile(
      File _image, String category, String productTitle) async {
    final ref = FirebaseStorage.instance.ref().child(
        'category/$category/$productTitle/${DateTime.now().toString()}.jpeg');
    await ref.putFile(_image).whenComplete(() => null);

    return await ref.getDownloadURL();
  }
}
