part of '../reservation_page.dart';

class _LoadingContent extends StatelessWidget {
  const _LoadingContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height - kToolbarHeight * 2,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      color: context.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // to exclude the padding
          OverflowBox(
            fit: OverflowBoxFit.deferToChild,
            maxWidth: context.width,
            child: ShimmerWidget(height: context.ratioHeight(300)),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: context.width / 1.5,
            child: const ListTile(
              title: SizedBox(child: ShimmerWidget(height: 20)),
              subtitle: ShimmerWidget(height: 14),
            ),
          ),
          const Row(
            children: [
              Expanded(
                child: ListTile(
                  title: SizedBox(child: ShimmerWidget(height: 20)),
                  subtitle: ShimmerWidget(height: 14),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: SizedBox(child: ShimmerWidget(height: 20)),
                  subtitle: ShimmerWidget(height: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: ListTile(
                  title: SizedBox(child: ShimmerWidget(height: 20)),
                  subtitle: ShimmerWidget(height: 14),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: SizedBox(child: ShimmerWidget(height: 20)),
                  subtitle: ShimmerWidget(height: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              color: context.colorScheme.outline.withOpacity(.35),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: ListTile(
                        title: SizedBox(child: ShimmerWidget(height: 20)),
                        subtitle: ShimmerWidget(height: 14),
                      ),
                    ),
                  ),
                  Expanded(child: ShimmerWidget()),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
