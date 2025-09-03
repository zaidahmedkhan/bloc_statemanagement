part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class AddCardItemEvent extends CartEvent {
  final ProductDataModel cartItem;

  AddCardItemEvent({required this.cartItem});
}


