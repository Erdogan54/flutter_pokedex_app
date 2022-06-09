import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;

  const DetailPage({required this.pokemon, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? _portraitMode(context)
        : _landscapeMode(context);
  }

  Scaffold _portraitMode(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: UIHelper.getItemColor(pokemon.type!),
            height: 1.sh,
            width: 1.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 36,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    Text(
                      pokemon.name ?? "",
                      style: Constants.getPokeNameTextStyle(),
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      (pokemon.id ?? "").toString(),
                      style: Constants.getPokeNameTextStyle(),
                    ),
                    SizedBox(
                      width: 50.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 100.w,
                    ),
                    Chip(label: Text(UIHelper.getListToString(pokemon.type!)))
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ),
          Positioned(
            top: 0.37.sh,
            right: 0.01.sw,
            child: Image.asset(
              Constants.imgAssetPokeItem,
              height: UIHelper.getPokeItemSize(),
              width: UIHelper.getPokeItemSize(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 0.5.sh,
                width: 1.sw,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Name",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          pokemon.name ?? "",
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Height",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          pokemon.height ?? "",
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Weight",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          pokemon.weight ?? "",
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Spawn Time",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          pokemon.spawnTime ?? "",
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Weakness",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          UIHelper.getListToString(pokemon.weaknesses ?? []),
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Pre Evolution",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          (pokemon.prevEvolution?[0] ??
                                  Evolution(name: "N/A", num: ""))
                              .toString(),
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Next Evolution",
                          style: Constants.getDetailKeyTextStyle(),
                        ),
                        Text(
                          (pokemon.nextEvolution?[0] ??
                                  Evolution(name: "N/A", num: "").toString())
                              .toString(),
                          style: Constants.getDetailValueTextStyle(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.img!,
                errorWidget: (context, string, dynamic) => Image.asset(
                  Constants.imgAssetPokeItem,
                  fit: BoxFit.contain,
                ),
                height: 400.h,
                width: 400.h,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Scaffold _landscapeMode(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UIHelper.getItemColor(pokemon.type!),
        height: 1.sh,
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 150.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 36,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              pokemon.name ?? "",
                              style: Constants.getPokeNameTextStyle(),
                            ),
                          ),
                          Text(
                            (pokemon.id ?? "").toString(),
                            style: Constants.getPokeNameTextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Chip(label: Text(UIHelper.getListToString(pokemon.type!))),
                    SizedBox(height: 150.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            /* SizedBox(
                              height: UIHelper.getPokeItemSize(),
                              width: UIHelper.getPokeItemSize(),
                              child: Image.asset(
                                Constants.imgAssetPokeItem,
                                fit: BoxFit.contain,
                              )), */
                            Hero(
                              tag: pokemon.id!,
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img!,
                                errorWidget: (context, string, dynamic) =>
                                    Image.asset(
                                  Constants.imgAssetPokeItem,
                                  fit: BoxFit.contain,
                                ),
                                height: 600.h,
                                width: 600.h,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(
                                        color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 100.h)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 1.sh,
              width: 0.55.sw,
              child: Stack(children: [
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 0.75.sh,
                    width: 0.54.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Name",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              pokemon.name ?? "",
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Height",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              pokemon.height ?? "",
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Weight",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              pokemon.weight ?? "",
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Spawn Time",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              pokemon.spawnTime ?? "",
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Weakness",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              UIHelper.getListToString(
                                  pokemon.weaknesses ?? []),
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Pre Evolution",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              (pokemon.prevEvolution?[0] ??
                                      Evolution(name: "N/A", num: ""))
                                  .toString(),
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Next Evolution",
                              style: Constants.getDetailKeyTextStyle(),
                            ),
                            Text(
                              (pokemon.nextEvolution?[0] ??
                                      Evolution(name: "N/A", num: "")
                                          .toString())
                                  .toString(),
                              style: Constants.getDetailValueTextStyle(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
