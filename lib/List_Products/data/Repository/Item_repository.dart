import '../Item_Model/ModelClass.dart';
import '../Service/dio.dart';

class ItemRepository {
  final ApiService _apiService = ApiService();

  Future<List<Products>> getItems() async {
    return await _apiService.fetchItems();
  }
}
