import 'package:flutter/material.dart';

class FadeInImagePlaceholder extends StatelessWidget {
  final ImageProvider image;
  final Widget placeholder;
  final Widget? child;
  final Duration duration;
  final bool excludeFromSemantics;
  final double? width;
  final double? height;
  final BoxFit? fit;
  const FadeInImagePlaceholder({
    Key? key,
    required this.image,
    required this.placeholder,
    this.child,
    this.duration = const Duration(milliseconds: 500),
    this.excludeFromSemantics = false,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        image: image,
        excludeFromSemantics: excludeFromSemantics,
        width: width,
        height: height,
        fit: fit,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) {
            return this.child ?? child;
          } else {
            return AnimatedSwitcher(
                duration: duration,
                child: frame != null ? this.child ?? child : placeholder);
          }
        });
  }
}
