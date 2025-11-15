import 'package:_9_store_app/helper/api.dart';

class AllCateogoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
      token: '',
    );
    return data;
  }
}
