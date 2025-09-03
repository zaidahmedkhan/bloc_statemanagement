part of 'cart_bloc.dart';

@immutable
// abstract class CartState {}
// abstract class CartActionState extends CartState {}
// class CartInitial extends CartState {}
// class CartSuccessState extends CartState {
//   final List<ProductDataModel> cartItems;
//   CartSuccessState({required this.cartItems});
// }
// class RemoveFromCartState extends CartState {
//   final List<ProductDataModel> removedItems;
//   RemoveFromCartState({required this.removedItems});
// }
// final class CartState {
//   const CartState({
//     this.status = true,
//     this.todos = const [],
//   });
// final TodoStatus status;
// final List<Todos> todos;
//   final Exception? exception;
//   CartState.cop
// }
class CartState extends Equatable {
  const CartState({this.loading = false, this.cartItems = const []});

  final bool loading;
  final List<ProductDataModel> cartItems;

  CartState copyWith({bool? loading, List<ProductDataModel>? cartItems}) {
    return CartState(
      loading: loading ?? this.loading,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object?> get props => [loading, cartItems];
}
