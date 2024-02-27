part of 'favourite_bloc.dart';

enum ListStatus { loading, success, failure }

class FavouriteState extends Equatable {
  final List<FavItemsModel> favItemsList;
  final ListStatus listStatus;
  const FavouriteState(
      {this.favItemsList = const [], this.listStatus = ListStatus.loading});

  FavouriteState cpoyWith(
      {List<FavItemsModel>? favItemsList, ListStatus? listStatus}) {
    return FavouriteState(
        favItemsList: favItemsList ?? this.favItemsList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favItemsList, listStatus];
}

final class FavouriteInitial extends FavouriteState {}
