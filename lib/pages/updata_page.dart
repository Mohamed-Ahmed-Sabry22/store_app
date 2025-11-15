import 'package:_9_store_app/models/product_model.dart';
import 'package:_9_store_app/pages/main_home_page.dart';
import 'package:_9_store_app/services/update_product.dart';
import 'package:_9_store_app/widgets/customButton.dart';
import 'package:_9_store_app/widgets/customTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UbdatePage extends StatefulWidget {
  static String id = 'updata_page';
  @override
  State<UbdatePage> createState() => _UbdatePageState();
}

class _UbdatePageState extends State<UbdatePage> {
  String? title, description, imageUrl, price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () =>
                Navigator.of(context).pushReplacementNamed(MainHomePage.id),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: const Text('Update Product'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Customtextformfeild(
                onChanged: (data) {
                  title = data;
                },
                hintText: 'Product Name',
                labelText: 'Name',
              ),
              Customtextformfeild(
                onChanged: (data) {
                  description = data;
                },
                hintText: 'Product Description',
                labelText: 'Description',
              ),
              Customtextformfeild(
                keyboardType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
                hintText: 'Product Price',
                labelText: 'Price',
              ),
              Customtextformfeild(
                onChanged: (data) {
                  imageUrl = data;
                },
                hintText: 'Product Image',
                labelText: 'Url Image',
              ),
              CustomButton(
                onPressed: () async {
                  print('🔴 Button Pressed!'); // ✅ للتأكد إن الزرار شغال
                  isLoading = true;
                  setState(() {});
                  try {
                    print('📤 Sending update request...');
                    await updateProduct(product);
                    Navigator.pop(context); // ✅ يرجع للصفحة السابقة
                    print("success");
                  } catch (e) {
                    print('❌ Error: ${e.toString()}');
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error: $e')));
                  }
                  isLoading = false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<ProductModel> updateProduct(ProductModel product) async {
    return await UpdateProductService().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      price: price == null ? product.price.toString() : price!,
      desc: description == null ? product.description : description!,
      image: imageUrl == null ? product.image : imageUrl!,
      category: product.category,
    );
  }
}
