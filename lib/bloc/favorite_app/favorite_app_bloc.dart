import 'package:bloc_demo/bloc/favorite_app/favorite_app_events.dart';
import 'package:bloc_demo/bloc/favorite_app/favorite_app_states.dart';
import 'package:bloc_demo/model/favorite_items_model.dart';
import 'package:bloc_demo/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvents, FavoriteAppStates> {
  List<FavoriteItemsModel> favoriteList = [];
  List<FavoriteItemsModel> tempFavoriteList = [];

  FavoriteRepository favoriteRepository;
  FavoriteAppBloc(this.favoriteRepository) : super(const FavoriteAppStates()) {
    on<FetchFavoritesList>(fetchList);
    on<FavoriteItem>(addFavoriteItem);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(deleteItem);
  }

  void fetchList(
    FetchFavoritesList event,
    Emitter<FavoriteAppStates> emit,
  ) async {
    favoriteList = await favoriteRepository.fetchItems();

    emit(state.copyWith(listStatus: ListStatus.loading));

    try {
      favoriteList = await favoriteRepository.fetchItems();
      emit(
        state.copyWith(
          favoriteItemList: List.from(favoriteList),
          listStatus: ListStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(listStatus: ListStatus.failure));
    }
  }

  void addFavoriteItem(FavoriteItem event, Emitter<FavoriteAppStates> emit) {
    final index = favoriteList.indexWhere(
      (element) => element.id == event.item.id,
    );

    if (event.item.isFavorite) {
      if (tempFavoriteList.contains(favoriteList[index])) {
        tempFavoriteList.remove(favoriteList[index]);
        tempFavoriteList.add(event.item);
      }
    } else {
      if (tempFavoriteList.contains(favoriteList[index])) {
        tempFavoriteList.remove(favoriteList[index]);
        tempFavoriteList.add(event.item);
      }
    }

    favoriteList[index] = event.item;
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        tempFavoriteItemList: List.from(tempFavoriteList),
      ),
    );
  }

  void selectItem(SelectItem event, Emitter<FavoriteAppStates> emit) {
    tempFavoriteList.add(event.item);
    emit(state.copyWith(tempFavoriteItemList: List.from(tempFavoriteList)));
  }

  void unSelectItem(UnSelectItem event, Emitter<FavoriteAppStates> emit) {
    tempFavoriteList.remove(event.item);
    emit(state.copyWith(tempFavoriteItemList: List.from(tempFavoriteList)));
  }

  void deleteItem(DeleteItem event, Emitter<FavoriteAppStates> emit) {
    for (int i = 0; i < tempFavoriteList.length; i++) {
      favoriteList.remove(tempFavoriteList[i]);
    }
    tempFavoriteList.clear();
    emit(
      state.copyWith(
        favoriteItemList: List.from(favoriteList),
        tempFavoriteItemList: List.from(tempFavoriteList),
      ),
    );
  }
}
