
import '../database/MyDataBase.dart';
import '../const/app_const.dart';
import '../model/categories/Category.dart';
import '../network/base_api_services.dart';
import '../network/network_api_services.dart';

class CategoryRepository {
  final BaseApiServices _apiService = NetworkApiServices();
  final MyDatabase _database = MyDatabase();

  /// Retrieves the category list from the local database or API
  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = await _database.getCategoryList();

    if (categoryList.isEmpty) {
      try {
        final dynamic response = await _apiService.getApiResponse(AppConst.appUrl);
        categoryList = (response as List).map((json) => Category.fromJson(json)).toList();

        // Insert into the local database
        await _database.insertList(categoryList, AppConst.categoryTableName);
      } catch (e) {
        throw Exception("Failed to fetch categories: ${e.toString()}");
      }
    }
    return categoryList;
  }

  /// Deletes all categories from the database
  Future<int> deleteCategories() async {
    try {
      return await _database.deleteRecord(AppConst.categoryTableName);
    } catch (e) {
      throw Exception("Failed to delete categories: ${e.toString()}");
    }
  }
}

