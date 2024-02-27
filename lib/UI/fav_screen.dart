import 'package:blocpract/favourite_screen/bloc/favourite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite screen'),
      ),
      body: BlocBuilder<FavouriteBloc, FavouriteState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Center(child: Text('Something went wrong'));
            case ListStatus.success:
              return ListView.builder(
                itemCount: state.favItemsList.length,
                itemBuilder: (context, index) {
                  final item = state.favItemsList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.value),
                    ),
                  );
                },
              );
            default:
              return const Center(child: Text('Try again'));
          }
        },
      ),
    );
  }
}
