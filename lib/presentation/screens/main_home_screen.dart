import 'package:evira_ecommerce_admin/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:evira_ecommerce_admin/core/asset_constants.dart' as asset;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/cubit/main_cubit.dart';
import 'all_image_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String dropdownvalue = "Clothes";
  final TextEditingController priceController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  List<String> category = [
    "Clothes",
    "Shoes",
    "Bags",
    "Electronics",
    "Watch",
    "Jewellery",
    "Kitchen",
    "Toys"
  ];
  void clearFields() {
    setState(() {
      priceController.text = "";
      titleController.text = "";
      descriptionController.text = "";
      quantityController.text = "";
      dropdownvalue = "Clothes";
    });
  }

  @override
  void dispose() {
    priceController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<XFile> imageList = BlocProvider.of<MainCubit>(context).showAllImages();
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: asset.blacks2,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: AppBar(
            backgroundColor: asset.blacks4,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Evi",
                  style: asset.interM(
                    28,
                    color: asset.purple,
                  ),
                ),
                const Text("ra ",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                    )),
                Text(
                  "Eco",
                  style: asset.interM(
                    28,
                    color: asset.purple,
                  ),
                ),
                const Text("mmerce",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Comfortaa',
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Images",
                style: asset.interM(18, color: asset.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<MainCubit>(context).selectImage();
                    },
                    child: BlocBuilder<MainCubit, MainState>(
                      builder: (context, state) {
                        return Container(
                          height: mediaquery.height * .15,
                          width: mediaquery.height * .15,
                          decoration: BoxDecoration(
                              color: (state is ImageSelectedState)
                                  ? Colors.green.shade700
                                  : asset.blacks4,
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            (state is ImageSelectedState)
                                ? Icons.check_rounded
                                : Icons.add_a_photo_rounded,
                            color: (state is ImageSelectedState)
                                ? asset.white
                                : asset.purple,
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => MainCubit(),
                        child: AllImageScreen(),
                      ),
                    )),
                    child: Text(
                      "View all",
                      style: asset.interM(18, color: asset.grey),
                    ),
                  ),
                ],
              ),
              Heading(title: "Select Category"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: asset.blacks4,
                    borderRadius: BorderRadius.circular(12)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropdownvalue,
                    style: asset.interM(18, color: asset.white),
                    isExpanded: true,
                    dropdownColor: asset.blacks3,
                    items: category.map((String items) {
                      return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: asset.interM(18, color: asset.white),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownvalue = value.toString();
                      });
                    },
                  ),
                ),
              ),
              Heading(title: "Title"),
              TextFieldDetail(
                title: "Product title",
                controller: titleController,
              ),
              Heading(title: "Description"),
              Container(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 300.0,
                      ),
                      child: TextFieldDetail(
                        title: "Product Description",
                        controller: descriptionController,
                      ))),
              Heading(title: "Price"),
              TextField(
                keyboardType: TextInputType.number,
                controller: priceController,
                style: asset.interM(18, color: asset.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: asset.grey,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: asset.grey,
                        )),
                    hintText: "Product Price",
                    hintStyle:
                        asset.interM(16, color: asset.grey.withOpacity(.7)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: asset.grey,
                    ))),
              ),
              Heading(title: "Quantity"),
              TextField(
                keyboardType: TextInputType.number,
                controller: quantityController,
                style: asset.interM(18, color: asset.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: asset.grey,
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: asset.grey,
                        )),
                    hintText: "Product Quantity",
                    hintStyle:
                        asset.interM(16, color: asset.grey.withOpacity(.7)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: asset.grey,
                    ))),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<MainCubit>(context).clearAll();
                        clearFields();
                      },
                      child: Text(
                        "Clear All",
                        style: asset.interM(24, color: Colors.white),
                      ),
                    ),
                    BlocConsumer<MainCubit, MainState>(
                      listener: (context, state) {
                        if (state is ClearLoadingState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                "Cleared",
                                style: asset.interM(16, color: asset.white),
                              )));
                        } else if (state is ClearFailureState) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Theme.of(context).errorColor,
                              duration: const Duration(milliseconds: 500),
                              content: Text(
                                state.error,
                                style: asset.interM(16, color: asset.white),
                              )));
                        }
                      },
                      builder: (context, state) {
                        if (state is ClearSuccessState) {
                          return Row(
                            children: const [
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.check_circle_rounded,
                                color: Colors.green,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<MainCubit>(context).uploadProduct(ProductEntity(
              title: titleController.text,
              description: descriptionController.text,
              category: dropdownvalue,
              price: double.parse(priceController.text),
              imagesUrl: imageList,
              quantity: int.parse(quantityController.text),
            ));
          },
          style: ElevatedButton.styleFrom(
              primary: asset.purple,
              padding: const EdgeInsets.all(16),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: BlocConsumer<MainCubit, MainState>(
            listener: (context, state) {
              if (state is UploadSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "Uploaded",
                      style: asset.interM(16, color: asset.white),
                    )));
              }
              if (state is UploadFailureState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Theme.of(context).errorColor,
                    content: Text(
                      state.error,
                      style: asset.interM(16, color: asset.white),
                    )));
              }
            },
            builder: (context, state) {
              if (state is UploadLoadingState) {
                return const CircularProgressIndicator(
                  color: asset.white,
                );
              } else {
                return Text(
                  "Upload",
                  style: asset.interM(18, color: Colors.white),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class TextFieldDetail extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const TextFieldDetail(
      {super.key, required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      style: asset.interM(18, color: asset.white),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: asset.grey,
          )),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: asset.grey,
              )),
          hintText: title,
          hintStyle: asset.interM(16, color: asset.grey.withOpacity(.7)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: asset.grey,
          ))),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  const Heading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: asset.interM(18, color: asset.white),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
