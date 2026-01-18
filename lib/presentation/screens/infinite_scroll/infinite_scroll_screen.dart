import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _InfiniteScrollView(scrollController: scrollController),
      floatingActionButton: _FloatingActionButton(
        scrollController: scrollController,
      ),
    );
  }
}

class _FloatingActionButton extends StatefulWidget {
  const _FloatingActionButton({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_FloatingActionButton> createState() => _FloatingActionButtonState();
}

class _FloatingActionButtonState extends State<_FloatingActionButton> {
  bool isNeededToShow = false;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      final show = widget.scrollController.offset > 200;

      if (show != isNeededToShow) {
        setState(() {
          isNeededToShow = show;
        });
      }
    });
  }

  void scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      spacing: 20,
      children: [
        if (isNeededToShow)
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: FloatingActionButton(
              onPressed: () => scrollToTop(),
              heroTag: 'btn-scroll-top',
              child: const Icon(Icons.arrow_upward_rounded),
            ),
          ),

        FloatingActionButton(
          onPressed: () => context.pop(),
          heroTag: 'btn-back',
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ],
    );
  }
}

class _InfiniteScrollView extends StatefulWidget {
  const _InfiniteScrollView({required this.scrollController});
  final ScrollController scrollController;

  @override
  State<_InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<_InfiniteScrollView> {
  List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels + 500 >=
          widget.scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    moveScollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((e) => lastId + e));
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!isMounted) return;

    final lastId = imagesIds.last;

    isLoading = true;
    setState(() {});

    imagesIds.clear();

    imagesIds.add(lastId + 1);
    addFiveImages();

    isLoading = false;

    if (!isMounted) return;

    setState(() {});
  }

  void moveScollToBottom() {
    if (widget.scrollController.position.pixels + 100 <=
        widget.scrollController.position.maxScrollExtent) {
      return;
    }

    widget.scrollController.animateTo(
      widget.scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ListViewImages(
          scrollController: widget.scrollController,
          imagesIds: imagesIds,
          onRefresh: onRefresh,
        ),

        if (isLoading) _IsLoadingWidget(),
      ],
    );
  }
}

class _ListViewImages extends StatelessWidget {
  const _ListViewImages({
    required this.scrollController,
    required this.imagesIds,
    required this.onRefresh,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;
  final RefreshCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: RefreshIndicator(
        onRefresh: onRefresh,

        edgeOffset: 10,
        strokeWidth: 2,
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              placeholder: const AssetImage('assets/images/jar-loading.gif'),
              width: double.infinity,
              height: 300,
              image: NetworkImage(
                'https://picsum.photos/id/${imagesIds[index]}/500/300',
              ),
            );
          },
        ),
      ),
    );
  }
}

class _IsLoadingWidget extends StatelessWidget {
  const _IsLoadingWidget();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: FadeInUp(
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.primaryContainer,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: const CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      ),
    );
  }
}
