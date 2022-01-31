import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThumbButton extends StatefulWidget {
  final VoidCallback onTap;

  const ThumbButton({
    Key? key,
    required this.onTap,
  });

  @override
  ThumbButtonState createState() => ThumbButtonState();
}

class ThumbButtonState extends State<ThumbButton> {
  BoxDecoration? borderDecoration;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        button: true,
        enabled: true,
        label: 'Login',
        child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: widget.onTap,
                child: Focus(
                    onKey: (node, event) {
                      if (event is RawKeyDownEvent) {
                        if (event.logicalKey == LogicalKeyboardKey.enter ||
                            event.logicalKey == LogicalKeyboardKey.space) {
                          widget.onTap();
                          return KeyEventResult.handled;
                        }
                      }
                      return KeyEventResult.ignored;
                    },
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        setState(() => borderDecoration = BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.5),
                                width: 2)));
                      } else {
                        setState(() => borderDecoration = null);
                      }
                    },
                    child: Container(
                      decoration: borderDecoration,
                      height: 120,
                    )))));
  }
}
