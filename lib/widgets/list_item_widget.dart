import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

import 'package:flutter_pokedex/pages/detail_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_widget.dart';

class PokeListItemWidget extends StatelessWidget {
  const PokeListItemWidget({required this.pokemon, Key? key}) : super(key: key);

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(pokemon: pokemon),
            ));
      }),
      child: Card(
        elevation: 4,
        color: UIHelper.getItemColor(pokemon.type ?? []),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  pokemon.name ?? "N/A",
                  style: Constants.getPokeNameTextStyle(),
                ),
                Chip(label: Text(pokemon.type![0])),
              ],
            ),
            ImageWidget(pokemon: pokemon)
          ]),
        ),
      ),
    );
  }
}
