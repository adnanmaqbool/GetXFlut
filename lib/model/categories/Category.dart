/*class Category {
  String? id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category({this.id, this.categoryName, this.countryId, this.recipeCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    categoryName = json['CategoryName'];
    countryId = json['CountryId'];
    recipeCount = json['RecipeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['CategoryName'] = this.categoryName;
    data['CountryId'] = this.countryId;
    data['RecipeCount'] = this.recipeCount;
    return data;
  }
}*/
/*class Category {
  Category({
      this.id,
      this.categoryName, 
      this.countryId, 
      this.recipeCount,});

  String? id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category.fromJson(dynamic json) {
    id = json[0]['Id'] ;
    categoryName = json[0]['CategoryName'];
    countryId = json[0]['CountryId'];
    recipeCount = json[0]['RecipeCount'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // map['Id'] = id;
    map['CategoryName'] = categoryName;
    map['CountryId'] = countryId;
    map['RecipeCount'] = recipeCount;
    return map;
  }

}*/

class Category {
  int?  id;
  String? categoryName;
  String? countryId;
  String? recipeCount;

  Category({this.id, this.categoryName, this.countryId, this.recipeCount});

  Category.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['Id'].toString()) ?? 0; // Ensure that 'Id' is an integer
    categoryName = json['CategoryName'];
    countryId = json['CountryId'];
    recipeCount = json['RecipeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['CategoryName'] = categoryName;
    data['CountryId'] = countryId;
    data['RecipeCount'] = recipeCount;
    return data;
  }
}


