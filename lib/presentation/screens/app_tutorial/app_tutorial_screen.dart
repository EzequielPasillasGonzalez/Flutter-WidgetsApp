import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    title: 'Busca la comida',
    caption: 'Dolore in aute reprehenderit irure qui nisi ea cupidatat.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    title: 'Entrega rápida',
    caption:
        'Sunt commodo esse elit labore minim occaecat eiusmod labore pariatur sit anim id.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    title: 'Disfruta la comida',
    caption: 'Ut qui labore ut laboris velit.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _AppTutorial());
  }
}

class _AppTutorial extends StatefulWidget {
  const _AppTutorial();

  @override
  State<_AppTutorial> createState() => _AppTutorialState();
}

class _AppTutorialState extends State<_AppTutorial> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle? captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Stack(
      children: [
        PageView(
          physics: BouncingScrollPhysics(),
          controller: pageViewController,
          children: slides
              .map(
                (slideData) => _SlideView(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl,
                ),
              )
              .toList(),
        ),

        Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            onPressed: () => context.pop(),
            child: Text('Salir', style: captionStyle),
          ),
        ),

        endReached
            ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Comenzar'),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class _SlideView extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _SlideView({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge;
    final TextStyle? captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Image(image: AssetImage(imageUrl)),
            Text(title, style: titleStyle),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
