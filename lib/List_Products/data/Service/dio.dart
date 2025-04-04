import 'package:dio/dio.dart';
import '../Item_Model/ModelClass.dart';


class ApiService {
  final Dio _dio = Dio();

  Future<List<Products>> fetchItems() async {
    try {
      final response = await _dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((item) => Products.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
