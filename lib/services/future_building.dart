import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/home_page.dart';
import 'package:flutter_pokedex/widgets/grid_widget.dart';
import '../constants/constants.dart';
import '../models/pokemon_model.dart';
import 'poke_api.dart';

class PokeFutureBuilder extends StatefulWidget {
  const PokeFutureBuilder({Key? key}) : super(key: key);

  @override
  State<PokeFutureBuilder> createState() => _PokeFutureBuilderState();
}

class _PokeFutureBuilderState extends State<PokeFutureBuilder> {
  List<PokemonModel> _pokeList = [];
  late dynamic _initData;

  @override
  void initState() {
    super.initState();
    _initData = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return _getData();
  }

  FutureBuilder<List<PokemonModel>> _getData() {
    return FutureBuilder<List<PokemonModel>>(
      future: _initData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _pokeList = snapshot.data!;

          return PokeGridViewWidget(
            pokeList: _pokeList,
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                       const HomePage();
                      });
                    },
                    child: const Text("Tekrar Dene"))
              ],
            ),
          );
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 30),
              Text(
                "Veriler yükleniyor...",
                style: Constants.getPokeNameTextStyle(),
              )
            ],
          ));
        }
      },
    );
  }
}
