import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mutlumesaj/core/base_bloc/base_view.dart';
import 'package:mutlumesaj/core/base_bloc/base_widget.dart';
import 'package:mutlumesaj/core/config/dependency_injection/injectable.dart';
import 'package:mutlumesaj/core/constants/asset_constants.dart';
import 'package:mutlumesaj/core/constants/color_constants.dart';
import 'package:mutlumesaj/core/constants/data_constants.dart';
import 'package:mutlumesaj/core/constants/theme_constants.dart';
import 'package:mutlumesaj/core/shared/helper_functions.dart';
import 'package:mutlumesaj/features/app/domain/entity/message_entity.dart';
import 'package:mutlumesaj/features/app/presentation/Common/Widget/animated_button.dart';
import 'package:mutlumesaj/features/app/presentation/Common/Widget/background_image_view.dart';
import 'package:mutlumesaj/features/app/presentation/home/cubit/home_cubit.dart';

part 'widget/bordered_text_button.dart';
part 'widget/svg_button.dart';
part 'widget/pop_up_menu_button.dart';
part 'widget/message_box.dart';
part 'widget/like_button.dart';
part 'widget/item_builder.dart';

@RoutePage()
final class HomeScreen extends BaseView<HomeCubit, HomeState> {
  HomeScreen({super.key, required this.messages})
      : super(cubit: () => getIt<HomeCubit>(param1: messages));
  final List<MessageEntity> messages;
  @override
  Widget builder(BuildContext context, HomeCubit cubit) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35.w),
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
      body: const BackgroundImageView(_HomeBody()),
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
                  locales.dailyMessage,
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
