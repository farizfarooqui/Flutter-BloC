import 'package:blocpract/respository/fav_item_model.dart';

class FavouriteRespository {
  Future<List<FavItemsModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.of(_generateList(100));
  }

  List<FavItemsModel> _generateList(int lenght) {
    return List.generate(
        lenght,
        (index) =>
            FavItemsModel(id: index.toString(), value: 'index ${index + 1}'));
  }
}
