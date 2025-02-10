/*
class CategoryController extends GetxController {
  final _categoryRepository = CategoryRepository();

  // Expose the category list directly
  final RxList<Category> categoryList = <Category>[].obs;

  void _setCategoryList(List<Category>? list) {
    if (list != null) {
      categoryList.assignAll(list);
    } else {
      categoryList.clear();
    }
  }

  // Fetch category list from repository
  Future<void> callCategoryList() async {
    try {
      final catList = await _categoryRepository.getCategoryList();
      _setCategoryList(catList);
    } catch (e) {
      if (e is AppException) {
        debugPrint("AppException: $e");
      } else {
        debugPrint("Error: $e");
      }
    }
  }

  void clearCategoryList() {
    categoryList.clear();
    deleteAllCategories();
  }

  void deleteAllCategories() async {
    final int deleted = await _categoryRepository.deleteCategories();
    if (deleted > 0) {
      _setCategoryList([]);
    }
  }

}*/


import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/categories/Category.dart';
import '../network/exceptions/app_exceptions.dart';
import '../repository/category_repository.dart';

class CategoryController extends GetxController {
  final _categoryRepository = CategoryRepository();
  final RxList<Category> categoryList = <Category>[].obs;
  final RxBool isLoading = false.obs; // New variable to track loading state

  @override
  void onInit() {
    super.onInit();
    callCategoryList(); // Fetch categories when the controller is initialized
  }

  Future<void> callCategoryList() async {
    isLoading.value = true; // Start loading
    try {
      final catList = await _categoryRepository.getCategoryList();
      categoryList.assignAll(catList);
    } catch (e) {
      if (e is AppException) {
        debugPrint("AppException: $e");
      } else {
        debugPrint("Exception: $e");
      }
    } finally {
      isLoading.value = false; // Stop loading
    }
  }

  Future<void> deleteAllCategories() async {
    isLoading.value = true; // Start loading when deleting
    final deleted = await _categoryRepository.deleteCategories();
    if (deleted > 0) {
      categoryList.clear();
    }
    isLoading.value = false; // Stop loading
  }
}
