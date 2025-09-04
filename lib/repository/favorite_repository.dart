import 'package:bloc_demo/model/favorite_items_model.dart';

Future<List<FavoriteItemsModel>> fetchItems() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(generateList(10));
}


List<FavoriteItemsModel> generateList(int length){
    return List.generate(length, (index){
        return FavoriteItemsModel(id: length.toString(), value: "Item $length");
    });

}