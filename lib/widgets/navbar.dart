import '../constants/colors.dart';
import '../models/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/homepage.dart';
import '../pages/bookshelf.dart';
import '../pages/book_publisher.dart';
import '../pages/book_category.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    Key? key,
  }) : super(key: key);

  final _index = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kBottomNavigationBarHeight * 1,
        decoration: BoxDecoration(
          color: AnimeUI.background,
          boxShadow: [
            BoxShadow(
              spreadRadius: 7.5,
              blurRadius: 15,
              color: AnimeUI.cyan.withOpacity(.45),
            ),
          ],
        ),
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          children: List.generate(
            itemsNavBar.length,
            (index) => Expanded(
              child: ValueListenableBuilder<int>(
                  valueListenable: _index,
                  builder: (_, value, __) {
                    return GestureDetector(
                      onTap: () => '',
                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              itemsNavBar[index].path,
                              width: 20,
                              height: 20,
                              color: (index == value)
                                  ? AnimeUI.cyan
                                  : Colors.black,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              itemsNavBar[index].name,
                              style:
                                  Theme.of(context).textTheme.button?.copyWith(
                                        color: (index == value)
                                            ? AnimeUI.cyan
                                            : Colors.black,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
