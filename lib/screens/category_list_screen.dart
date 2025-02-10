import 'package:flut_getx/components/app_bar_custom.dart';
import 'package:flut_getx/components/title_text.dart';
import 'package:flut_getx/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/loading_indicator.dart';
import '../controller/CategoryController.dart';
import '../provider/theme_provider.dart';
import '../res/routes/route_name.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({super.key});

  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: 'home_screen'.tr,
        isBackIcon: true,
        backIcon: Icons.settings,
        onBack: () {
          Get.toNamed(RouteName.Setting);
        },
      ),
      body: Obx(() {
        if (categoryController.isLoading.value) {
          return Center(
              child: LoadingIndicator(size: 80.0, color: ThemeProvider.textColor)); // Show loader
        }

        if (categoryController.categoryList.isEmpty) {
          return Center(
            child: TitleText(title: 'no_categories_found'.tr),
          );
        }

        return GestureDetector(
          onLongPress: () {
            // Call the method to delete all categories
            categoryController.deleteAllCategories();
            AppUtils.showSnackBar('All Categories Deleted', "");
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: categoryController.categoryList.length,
            itemBuilder: (context, index) {
              final category = categoryController.categoryList[index];
              return Card(
                color: ThemeProvider.appColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    category.categoryName!,
                    style: TextStyle(fontSize: 16, color: ThemeProvider.textColor),
                  ),
                  subtitle: Text(
                    "${"rec_count".tr}: ${category.recipeCount}",
                    style: TextStyle(
                        fontSize: 14,
                        color: ThemeProvider.textColor.withOpacity(0.7)),
                  ),
                  onTap: () {
                    AppUtils.showSnackBar(
                        category.categoryName!, category.recipeCount!);
                  },
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          categoryController.callCategoryList(); // Refresh categories
        },
        child: Obx(() => categoryController.isLoading.value
            ? LoadingIndicator(
          size: 80.0,
          color: ThemeProvider.textColor,
        ) // Show loader inside button
            : const Icon(Icons.refresh)),
      ),
    );
  }
}
