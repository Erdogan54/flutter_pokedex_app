import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';

import '../constants/constants.dart';
import '../models/pokemon_model.dart';

class ImageWidget extends StatelessWidget {
  final PokemonModel pokemon;
  const ImageWidget({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
              height: UIHelper.getPokeItemSize(),
              width: UIHelper.getPokeItemSize(),
              child: Image.asset(
                Constants.imgAssetPokeItem,
                fit: BoxFit.contain,
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag:pokemon.id! ,
            child: CachedNetworkImage(
              imageUrl: pokemon.img!,
              errorWidget: (context, string, dynamic) => Image.asset(
                Constants.imgAssetPokeItem,
                fit: BoxFit.contain,
              ),
              height: UIHelper.getPokeItemSize(),
              width: UIHelper.getPokeItemSize(),
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  const CircularProgressIndicator(color: Colors.white),
            ),
          ),
        )
    
        /* Align(
          alignment: Alignment.bottomRight,
          child: Image.network(
            pokeImageUrl,
            height: UIHelper.getPokeItemSize(),
            width: UIHelper.getPokeItemSize(),
            fit: BoxFit.contain,
          ), */
      ],
    );
  }
}
