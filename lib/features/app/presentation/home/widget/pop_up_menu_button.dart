part of '../home_view.dart';

class _PopUpMenuButton extends StatelessWidget {
  const _PopUpMenuButton();

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: () {},
      child: PopupMenuButton(
        offset: Offset(0, 45.h),
        itemBuilder: (BuildContext bc) {
          return [
            PopupMenuItem(
              value: '/support',
              child: Text(locales.support),
            ),
            PopupMenuItem(
              value: '/about',
              child: Text(locales.about),
            ),
            PopupMenuItem(
              value: '/contact',
              child: Text(locales.contact),
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
