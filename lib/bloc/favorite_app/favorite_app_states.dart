import 'package:bloc_demo/model/favorite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavoriteAppStates extends Equatable {
  final List<FavoriteItemsModel> favoriteItemList;
  final ListStatus listStatus;

  const FavoriteAppStates({
    this.favoriteItemList = const [],
    this.listStatus = ListStatus.success,
  });

  FavoriteAppStates copyWith({
    final List<FavoriteItemsModel>? favoriteItemList,
    final ListStatus? listStatus,
  }) {
    return FavoriteAppStates(
      favoriteItemList: favoriteItemList ?? this.favoriteItemList,
      listStatus: listStatus ?? this.listStatus, 
    );
  }

  @override
  List<Object?> get props => [favoriteItemList, listStatus];
}
