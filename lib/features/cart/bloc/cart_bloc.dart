import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/features/home/models/home_product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

// mixin CartBloc on Bloc<CartEvent, CartState> {
//   void initCartEvent() async {
//     on<AddCardItemEvent>(event, emit) {
//       // on<CartInitialEvent>(cartInitialEvent);
//       emit(state.copyWith(cartItems: [...state.cartItems, event.cartItems]));
//     }
//   }

// void addItemToCart(List<ProductDataModel> items) {
//   add(AddCardItemEvent(cartItems: cartItems));
// }
// }

// class CartBloc extends Bloc<CartEvent, CartState> {
//   CartBloc() : super(CartState()) {
//     on<AddCardItemEvent>(event, emit) {
//       // on<CartInitialEvent>(cartInitialEvent);
//       emit(state.copyWith(cartItems: [...state.cartItems, event.cartItems]));
//     }
//   }
// void addItemToCart(List<ProductDataModel> items) {
//   add(AddCardItemEvent(cartItems: cartItems));
// }
// }

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<AddCardItemEvent>((event, emit) {
      emit(state.copyWith(cartItems: [...state.cartItems, event.cartItem]));
    });
    // on<SelectCategory>(_mapSelectCategoryEventToState);
  }

  // void _mapGetCategoriesEventToState(
  //   GetCategories event,
  //   Emitter<CategoryState> emit,
  // ) async {
  //   emit(state.copyWith(status: CategoryStatus.loading));
  //   try {
  //     final genres = await gameRepository.getGenres();
  //     emit(state.copyWith(status: CategoryStatus.success, categories: genres));
  //   } catch (error, stacktrace) {
  //     print(stacktrace);
  //     emit(state.copyWith(status: CategoryStatus.error));
  //   }
  // }

  void addItemToCart(ProductDataModel item) {
    add(AddCardItemEvent(cartItem: item));
  }

  // void _mapSelectCategoryEventToState(
  //   SelectCategory event,
  //   Emitter<CategoryState> emit,
  // ) async {
  //   emit(
  //     state.copyWith(
  //       status: CategoryStatus.selected,
  //       idSelected: event.idSelected,
  //     ),
  //   );
  // }
}

//   FutureOr<void> cartInitialEvent(
//     CartInitialEvent event,
//     Emitter<CartState> emit,
//   ) {
//     emit(CartSuccessState(cartItems: cartItems));
//   }
// }
