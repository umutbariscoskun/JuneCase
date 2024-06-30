part of '../home_view.dart';

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
                    onLikeButtonPressed: (item) async =>
                        await cubit.likeAnItem(item),
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
