import 'package:bloc_demo/bloc/favorite_app/favorite_app_bloc.dart';
import 'package:bloc_demo/bloc/favorite_app/favorite_app_events.dart';
import 'package:bloc_demo/bloc/favorite_app/favorite_app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAppScreen extends StatefulWidget {
  const FavoriteAppScreen({super.key});

  @override
  State<FavoriteAppScreen> createState() => _FavoriteAppScreenState();
}

class _FavoriteAppScreenState extends State<FavoriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteAppBloc>().add(FetchFavoritesList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Favorite App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FavoriteAppBloc, FavoriteAppStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Center(child: const CircularProgressIndicator(color: Colors.white,));
              case ListStatus.failure:
                return const Text('Something went wrong');
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favoriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favoriteItemList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.value),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline)),
                        
                        ),);
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
