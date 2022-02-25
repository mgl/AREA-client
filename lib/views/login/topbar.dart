import 'package:flutter/material.dart';
import 'package:client/views/login/border_button.dart';
import 'package:client/layout/text_scale.dart';
import 'package:client/layout/image_placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:client/layout/adaptive.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacing = SizedBox(width: 30);
    final isDesktop = isDisplayDesktop(context);

    if (isDesktop) {
      return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ExcludeSemantics(
                  child: SizedBox(
                      height: 80,
                      child: FadeInImagePlaceholder(
                          image: const AssetImage('assets/Epitech.png'),
                          placeholder:
                              LayoutBuilder(builder: (context, constraints) {
                            return SizedBox(
                                width: constraints.maxHeight,
                                height: constraints.maxHeight);
                          })))),
              spacing,
              Text('Login to Area',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 35 / reducedTextScale(context),
                      fontWeight: FontWeight.w600))
            ]),
          ]));
    }
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Wrap(alignment: WrapAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ExcludeSemantics(
                child: SizedBox(
                    height: 80,
                    child: FadeInImagePlaceholder(
                        image: const AssetImage('assets/Epitech.png'),
                        placeholder:
                            LayoutBuilder(builder: (context, constraints) {
                          return SizedBox(
                              width: constraints.maxHeight,
                              height: constraints.maxHeight);
                        })))),
            spacing,
           /* Text('Login to Area',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 35 / reducedTextScale(context),
                    fontWeight: FontWeight.w600))*/
          ]),
        ]));
  }
}
