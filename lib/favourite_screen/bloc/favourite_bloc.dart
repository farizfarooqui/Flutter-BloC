import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocpract/respository/fav_item_model.dart';
import 'package:blocpract/respository/favourite_respository.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRespository favouriteRespository;
  List<FavItemsModel> favList = [];
  FavouriteBloc(this.favouriteRespository) : super(const FavouriteState()) {
    on<FetchFavListEvent>(fetchFavListEvent);
    on<FavItemEvent>(favItemEvent);
  }

  FutureOr<void> fetchFavListEvent(
      FetchFavListEvent event, Emitter<FavouriteState> emit) async {
    favList = await favouriteRespository.fetchItem();
    emit(state.cpoyWith(
        favItemsList: List.from(favList), listStatus: ListStatus.success));
  }

  FutureOr<void> favItemEvent(FavItemEvent event, Emitter<FavouriteState> emit) {
    
  }
}
