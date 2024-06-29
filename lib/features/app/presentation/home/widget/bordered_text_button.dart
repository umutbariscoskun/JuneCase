part of '../home_view.dart';

class _BorderedTextButton extends StatelessWidget {
  const _BorderedTextButton();

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        child: Container(
          decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(24.r)),
          width: 280.w,
          height: 48.h,
          child: Center(
              child: Text(
            locales.todaysLuckyNumber,
            style: ThemeConstants.medium(context, ColorConstants.black),
          )),
        ),
        onPressed: () {});
  }
}
