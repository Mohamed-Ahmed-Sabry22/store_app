import 'package:_9_store_app/helper/api.dart';
import 'package:_9_store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products',
      token: '',
    );
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
