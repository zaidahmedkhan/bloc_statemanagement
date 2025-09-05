import 'package:bloc_demo/model/favorite_items_model.dart';

class FavoriteRepository {
  Future<List<FavoriteItemsModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(generateList(10));
  }

  List<FavoriteItemsModel> generateList(int length) {
    return List.generate(length, (index) {
      return FavoriteItemsModel(id: index.toString(), value: "Item $index");
    });
  }
}
