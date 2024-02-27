import 'package:equatable/equatable.dart';

class FavItemsModel extends Equatable {
  const FavItemsModel(
      {required this.id,
      required this.value,
      this.isdeleting = false,
      this.isFavorite = false});

  final String id;
  final String value;
  final bool isdeleting;
  final bool isFavorite;

  FavItemsModel copyWith(
      {String? id, String? value, bool? isdeleting, bool? isFavorite}) {
    return FavItemsModel(
        id: id ?? this.id,
        value: value ?? this.value,
        isdeleting: isdeleting ?? this.isdeleting,
        isFavorite: isFavorite ?? this.isFavorite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, value, isdeleting, isFavorite];
}
