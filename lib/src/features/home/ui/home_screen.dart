import 'package:comicsawy/src/core/constants/app_constants.dart';
import 'package:comicsawy/src/core/di/dependency_injection.dart';
import 'package:comicsawy/src/core/theming/app_colors.dart';
import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:comicsawy/src/features/home/logic/cubit/favorite_page_cubit.dart';
import 'package:comicsawy/src/features/home/logic/cubit/home_page_cubit.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  late List<Widget> pages;
  final Widget homePage;
  final Widget favoritesPage;
  Home({super.key, required this.homePage, required this.favoritesPage}) {
    pages = [homePage, favoritesPage];
  }
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;

  PreferredSizeWidget _buildAppBar(BuildContext context) => AppBar(
        titleTextStyle: TextStyles.font24GrayW700,
        automaticallyImplyLeading: false,
        title: Text(
          AppConstants.appTitle,
          style: TextStyles.font24GrayW700,
        ),
        centerTitle: true,
      );

  Widget _buildBody() => widget.pages.elementAt(currentPageIndex);

  Widget _buildFloatingActionButton() => FloatingActionButton(
      onPressed: () {},
      child: const Icon(
        Icons.stop,
      ));

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: (value) => setState(() {
                currentPageIndex = value;
              }),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: const Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const BottomNavigationBarItem(
              label: 'Favorites',
              icon: Icon(
                Icons.star_border_rounded,
                color: AppColors.gray,
              ),
              activeIcon: Icon(
                Icons.star_rounded,
                color: AppColors.gold,
              ),
            ),
          ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  @override
  void dispose() {
    getIt<HomePageCubit>().close();
    getIt<FavoritesPageCubit>().close();
    super.dispose();
  }
}
