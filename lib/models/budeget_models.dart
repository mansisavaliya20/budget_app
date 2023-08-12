class BudgetModel {
  int? id;
  String category_name;
  String category_image;

  BudgetModel(
      {this.id, required this.category_name, required this.category_image});

  factory BudgetModel.fromSQL({required Map data}) {
    return BudgetModel(
      id: data["id"],
      category_name: data["category_name"],
      category_image: data["category_image"],
    );
  }
}
