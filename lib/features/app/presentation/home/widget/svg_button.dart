part of '../home_view.dart';

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
