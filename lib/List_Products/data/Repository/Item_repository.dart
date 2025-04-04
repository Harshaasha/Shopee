import '../Item_Model/ModelClass.dart';
import '../Service/api_service.dart';

class ItemRepository {
  final ApiService _apiService = ApiService();

  Future<List<Products>> getItems() async {
    return await _apiService.fetchItems();
  }
}
