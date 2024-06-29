import 'package:flutter/material.dart';
import 'package:mutlumesaj/core/constants/asset_constants.dart';
import 'package:mutlumesaj/core/constants/color_constants.dart';

class BackgroundImageView extends StatelessWidget {
  const BackgroundImageView(this.view, {super.key});
  final Widget view;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            AssetConstants.backgroundImagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: ColoredBox(color: ColorConstants.black.withOpacity(0.2)),
        ),
        view,
      ],
    );
  }
}
