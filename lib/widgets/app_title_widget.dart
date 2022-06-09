import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PokeAppTitle extends StatelessWidget {
  const PokeAppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTitleTextStyle(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                Constants.imgAssetPokeTitle,
                width: ScreenUtil().orientation == Orientation.portrait
                    ? 0.25.sh
                    : 0.25.sw,
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ));
  }
}
