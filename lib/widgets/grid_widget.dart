import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'list_item_widget.dart';

class PokeGridViewWidget extends StatefulWidget {
  const PokeGridViewWidget({required this.pokeList, Key? key})
      : super(key: key);

  final List pokeList;

  @override
  State<PokeGridViewWidget> createState() => _PokeGridViewWidgetState();
}

class _PokeGridViewWidgetState extends State<PokeGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: UIHelper.getGridDelegeCount()),
      itemCount: widget.pokeList.length,
      itemBuilder: (context, index) {
        var pokemon = widget.pokeList[index];
        return PokeListItemWidget(
          pokemon: pokemon,
        );
      },
    );
  }
}
