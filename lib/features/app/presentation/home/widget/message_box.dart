part of '../home_view.dart';

final class _MessageBox extends StatelessWidget {
  final MessageEntity item;
  final void Function(MessageEntity) onLikeButtonPressed;

  const _MessageBox({
    required this.item,
    required this.onLikeButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        DateFormat(DataConstants.dateFormat).format(item.createdAt);
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
                  locales.dearUser,
                  style: ThemeConstants.large(context),
                ),
              ),
              Gap(8.w),
              Text(
                formattedDate,
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
