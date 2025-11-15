import 'package:_9_store_app/helper/api.dart';
import 'package:_9_store_app/models/product_model.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required String title,
    required String desc,
    required String price,
    required String image,
    required String category,
    required int id,
  }) async {
    print('product id : $id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
      token: '',
    );
    return ProductModel.fromJson(data);
  }
}
