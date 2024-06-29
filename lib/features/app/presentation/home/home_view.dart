import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mutlumesaj/core/base_bloc/base_view.dart';
import 'package:mutlumesaj/core/config/dependency_injection/injectable.dart';
import 'package:mutlumesaj/core/constants/asset_constants.dart';
import 'package:mutlumesaj/core/constants/color_constants.dart';
import 'package:mutlumesaj/core/constants/theme_constants.dart';
import 'package:mutlumesaj/features/app/presentation/Common/Widget/animated_button.dart';
import 'package:mutlumesaj/features/app/presentation/home/cubit/home_cubit.dart';

@RoutePage()
final class HomeScreen extends BaseView<HomeCubit, HomeState> {
  HomeScreen({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, HomeCubit cubit) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: const _BorderedTextButton(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: _SvgButton(
              svgPath: AssetConstants.editIcon,
              insetPadding: 11.r,
            ),
          ),
        ],
      ),
      body: const _BackgroundImageView(_HomeBody()),
    );
  }
}

class _BorderedTextButton extends StatelessWidget {
  const _BorderedTextButton();

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        child: Container(
          decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(24.r)),
          width: 290.w,
          height: 48.h,
          child: Center(
              child: Text(
            //TODO: TRANSLATE IT
            "Günün Şanslı Sayısı",
            style: ThemeConstants.medium(context, ColorConstants.black),
          )),
        ),
        onPressed: () {});
  }
}

class _SvgButton extends StatelessWidget {
  const _SvgButton({required this.svgPath, this.insetPadding});
  final String svgPath;
  final double? insetPadding;
  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      child: Container(
        padding: EdgeInsets.all(insetPadding ?? 5.r),
        decoration: const BoxDecoration(
          color: ColorConstants.white,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: SvgPicture.asset(
            width: 24.w,
            height: 24.h,
            svgPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: const Column(
          children: [
            _AppBar(),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              const _SvgButton(
                svgPath: AssetConstants.chevronLeftIcon,
              ),
              Expanded(
                child: Text(
                  //TODO: LOCALIZE
                  "Gunluk mesaj",
                  style: ThemeConstants.medium(context, ColorConstants.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const _SvgButton(svgPath: AssetConstants.moreVerticalIcon)
            ],
          ),
        ),
        Gap(5.h),
        const Divider(thickness: 1, height: 0),
      ],
    );
  }
}

class _BackgroundImageView extends StatelessWidget {
  const _BackgroundImageView(this.view);
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
