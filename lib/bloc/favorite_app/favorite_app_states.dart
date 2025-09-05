import 'package:bloc_demo/model/favorite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoriteAppStates extends Equatable {
  final List<FavoriteItemsModel> favoriteItemList;
  final ListStatus listStatus;
  final List<FavoriteItemsModel> tempFavoriteItemList;

  const FavoriteAppStates({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.success,
    this.tempFavoriteItemList = const [],
  });

  FavoriteAppStates copyWith({
    final List<FavoriteItemsModel>? favoriteItemList,
    final ListStatus? listStatus,
    final List<FavoriteItemsModel>? tempFavoriteItemList,
  }) {
    return FavoriteAppStates(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus,
      tempFavoriteItemList: tempFavoriteItemList ?? this.tempFavoriteItemList,
    );
  }

  @override
  List<Object?> get props => [
    favoriteItemList,
    listStatus,
    tempFavoriteItemList,
  ];
}
