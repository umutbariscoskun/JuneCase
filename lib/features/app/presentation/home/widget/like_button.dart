part of '../home_view.dart';

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
