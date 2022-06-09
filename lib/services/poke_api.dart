import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/pokemon_model.dart';

class PokeApi {
  static const String _uri =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> createPokeList = [];

    try {
      var result = await Dio().get(_uri);

      if (result.statusCode == 200) {
        dynamic resultJsonData = jsonDecode(result.data);

        createPokeList = (resultJsonData["pokemon"] as List)
            .map((e) => PokemonModel.fromJson(e))
            .toList();
      }

      return createPokeList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
