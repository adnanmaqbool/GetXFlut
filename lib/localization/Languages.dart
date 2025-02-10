
import 'package:get/get.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'splash_text': 'Welcome to Flutter Demo',
      'app_name': 'Application Name',
      'settings_text': 'Setting Screen',
      'language_text': 'Choose Language',
      'language_text_selected': 'Your current language is',
      'theme_text_selected': 'Your current theme is',
      'theme_text': 'Choose Theme',
      'home_screen': 'Categories List',
      'api': 'Load Category',
      'no_categories_found': 'No categories found',
      'rec_count': 'Recipes Count',
    },
    'ur_PK': {
      'splash_text': 'خوش آمدید فلٹر ڈیمو میں',
      'app_name': 'ایپلیکیشن کا نام',
      'settings_text': 'سیٹنگ اسکرین',
      'language_text': 'زبان منتخب کریں',
      'language_text_selected': 'آپ کی موجودہ زبان ہے',
      'theme_text_selected': 'آپ کا موجودہ تھیم ہے',
      'theme_text': 'تھیم منتخب کریں',
      'home_screen': 'زمرے کی فہرست',
      'api': 'Load Category',
      'no_categories_found': 'کوئی زمرے نہیں ملا',
      'rec_count': 'ریسپیز کاؤنٹ',

    },
  };

}