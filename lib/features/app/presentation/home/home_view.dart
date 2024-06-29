import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mutlumesaj/core/base_bloc/base_view.dart';
import 'package:mutlumesaj/core/base_bloc/base_widget.dart';
import 'package:mutlumesaj/core/config/dependency_injection/injectable.dart';
import 'package:mutlumesaj/core/constants/asset_constants.dart';
import 'package:mutlumesaj/core/constants/color_constants.dart';
import 'package:mutlumesaj/core/constants/theme_constants.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
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
            padding: EdgeInsets.only(left: 30.w),
            child: const _BorderedTextButton(),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: _SvgButton(
              svgPath: AssetConstants.editIcon,
              insetPadding: 12.w,
            ),
          ),
        ],
      ),
      body: const _BackgroundImageView(_HomeBody()),
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
            Expanded(child: _ItemBuilder()),
          ],
        ),
      ),
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
          width: 300.w,
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
              const _PopUpMenuButton()
            ],
          ),
        ),
        Gap(5.h),
        const Divider(thickness: 1, height: 0),
      ],
    );
  }
}

class _PopUpMenuButton extends StatelessWidget {
  const _PopUpMenuButton();

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {},
      child: PopupMenuButton(
        offset: Offset(0, 45.h),
        onSelected: (value) {
          // your logic
        },
        itemBuilder: (BuildContext bc) {
          return const [
            //TODO:LOCALIZE
            PopupMenuItem(
              value: '/support',
              child: Text("Support"),
            ),
            PopupMenuItem(
              value: '/about',
              child: Text("About"),
            ),
            PopupMenuItem(
              value: '/contact',
              child: Text("Contact"),
            )
          ];
        },
        child: Container(
          padding: EdgeInsets.all(5.r),
          decoration: const BoxDecoration(
            color: ColorConstants.white,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: SvgPicture.asset(
              width: 24.w,
              height: 24.h,
              AssetConstants.moreVerticalIcon,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
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

final class _MessageBox extends StatelessWidget {
  final MessageEntity item;
  final void Function(MessageEntity) onLikeButtonPressed;

  const _MessageBox({
    required this.item,
    required this.onLikeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  //TODO : TRANSLATE IT
                  "Dear User",
                  style: ThemeConstants.large(context),
                ),
              ),
              Gap(8.w),
              Text(
                //TODO: FORMAT
                item.createdAt.toString(),
                style: ThemeConstants.small(context),
              ),
            ],
          ),
          Gap(10.h),
          Flexible(
            child: SingleChildScrollView(
              child: Text(
                item.content,
                style: ThemeConstants.medium(context, ColorConstants.white),
              ),
            ),
          ),
          Gap(10.h),
          _LikeButton(
            isLiked: item.isLiked,
            onTap: () => onLikeButtonPressed(item),
          ),
          Gap(16.h),
          Center(
              child: AnimatedButton(
                  child: SvgPicture.asset(AssetConstants.shareIcon),
                  onPressed: () {})),
          Gap(24.h),
        ],
      ),
    );
  }
}

class _LikeButton extends StatelessWidget {
  const _LikeButton({
    required this.isLiked,
    this.onTap,
  });
  final bool isLiked;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        onPressed: onTap ?? () {},
        child: AnimatedCrossFade(
            firstChild: SvgPicture.asset(
                width: 24.w, height: 24.h, AssetConstants.heartIcon),
            secondChild: SvgPicture.asset(
                width: 24.w, height: 24.h, AssetConstants.heartFillIcon),
            crossFadeState:
                isLiked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300)));
  }
}

final class _ItemBuilder extends BaseWidget<HomeCubit, HomeState> {
  const _ItemBuilder();

  @override
  Widget build(BuildContext context, HomeCubit cubit, HomeState state) {
    return state.when(
      initial: () {
        return const SizedBox.shrink();
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
      loaded: (HomeLoaded state) {
        return PageView.builder(
          onPageChanged: (index) async {
            await cubit.onIndexChanged(index);
          },
          scrollDirection: Axis.vertical,
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final item = state.messages[index];

            return Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: 24.h,
                bottom: 130.h,
              ),
              child: Center(
                child: BlurContainer(
                  child: _MessageBox(
                    item: item,
                    onLikeButtonPressed: (item) => cubit.likeAnItem(item),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

final class BlurContainer extends StatelessWidget {
  final Widget child;
  const BlurContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: child,
        ),
      ),
    );
  }
}
