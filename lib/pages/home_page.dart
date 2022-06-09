// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_const

import 'package:flutter/material.dart';
import '../services/future_building.dart';
import '../widgets/app_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
           const PokeAppTitle(),
           const Expanded(
            child: const PokeFutureBuilder(),
          ),
        ],
      ),
    );
  }
}
