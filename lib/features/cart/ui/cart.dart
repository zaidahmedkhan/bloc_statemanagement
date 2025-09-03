import 'package:bloc_demo/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_demo/features/cart/ui/cart_tile_widget.dart';
import 'package:bloc_demo/features/home/bloc/home_bloc.dart';
import 'package:bloc_demo/features/home/models/home_product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  final HomeBloc homeBloc = HomeBloc();

  // @override
  // void initState() {
  //   cartBloc.add(CartInitialEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Items")),
      body: BlocSelector<CartBloc, CartState, List<ProductDataModel>>(
        selector: (state) => state.cartItems,
        builder: (ctx, items) {
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return CartTileWidget(
                cartBloc: cartBloc,
                homeBloc: homeBloc,
                productDataModel: items[index],
              );
            },
          );
        },
      ),
      // body: BlocConsumer<CartBloc, CartState>(
      //   bloc: cartBloc,
      //   listenWhen: (previous, current) => current is CartActionState,
      //   buildWhen: (previous, current) => current is! CartActionState,
      //   listener: (context, state) {},
      //   builder: (context, state) {
      //     switch (state.runtimeType) {
      //       case CartSuccessState:
      //         final successState = state as CartSuccessState;

      //         if (successState.cartItems.isEmpty) {
      //           return Center(child: Text("Nothing in Cart!"));
      //         }

      //         return ListView.builder(
      //           itemCount: successState.cartItems.length,
      //           itemBuilder: (context, index) {
      //             return CartTileWidget(
      //               cartBloc: cartBloc,
      //               productDataModel: successState.cartItems[index],
      //               homeBloc: homeBloc,
      //             );
      //           },
      //         );

      //       default:
      //     }
      //     return Container();
      //   },
      // ),
    );
  }
}
