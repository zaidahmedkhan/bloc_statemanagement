import 'package:bloc_demo/bloc/favorite_app/favorite_app_events.dart';
import 'package:bloc_demo/bloc/favorite_app/favorite_app_states.dart';
import 'package:bloc_demo/model/favorite_items_model.dart';
import 'package:bloc_demo/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAppBloc extends Bloc<FavoriteAppEvents, FavoriteAppStates> {
  List<FavoriteItemsModel> favoriteList = [];
  FavoriteRepository favoriteRepository;
  FavoriteAppBloc(this.favoriteRepository) : super(const FavoriteAppStates()) {
    on<FetchFavoritesList>(fetchList);
    on<FavoriteItem>(addFavoriteItem);
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

  void addFavoriteItem(FavoriteItem event, Emitter<FavoriteAppStates> emit) {}
}
