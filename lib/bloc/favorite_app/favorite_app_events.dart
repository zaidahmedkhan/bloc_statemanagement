import 'package:equatable/equatable.dart';

abstract class FavoriteAppEvents extends Equatable {
  const FavoriteAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavoritesList extends FavoriteAppEvents {}

class FavoriteItem extends FavoriteAppEvents {}
