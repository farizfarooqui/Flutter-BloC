part of 'favourite_bloc.dart';

abstract class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavListEvent extends FavouriteEvent {}

class FavItemEvent extends FavouriteEvent {
  final FavItemsModel favitem;

  const FavItemEvent({required this.favitem});
}
