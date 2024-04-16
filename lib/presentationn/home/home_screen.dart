import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/sizes.dart';
import 'package:netflix/presentationn/home/widgets/background_card.dart';
import 'package:netflix/presentationn/home/widgets/custom_app_bar.dart';
import 'package:netflix/presentationn/home/widgets/main_title_card.dart';
import 'package:netflix/presentationn/home/widgets/title_number_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: const [
                    BackgroundCardWidget(),
                    kHeight,
                    MainTitleCardWidget(
                      titleText: "Released in the past year",
                    ),
                    MainTitleCardWidget(
                      titleText: "Trending Now",
                    ),
                    TitleNumberCard(
                      titleText: "Top 10 Tv Shows in India Today",
                    ),
                    MainTitleCardWidget(
                      titleText: "Tenes Dramas",
                    ),
                    MainTitleCardWidget(
                      titleText: "South Indian Cinema",
                    ),
                  ],
                ),
                scrollNotifier.value ? CustomAppBarWidget() : kHeight
              ],
            ),
          );
        },
      ),
    ));
  }
}
