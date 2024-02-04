import 'package:ecom_app/logic/bottom%20navigation/cubit/bottom_nav_cubit.dart';
import 'package:ecom_app/utils/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: const Center(
        child: Text("Hello"),
      ),
      bottomNavigationBar: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return SizedBox(
            height: size.width * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(icons.length, (index) => InkWell(
                  onTap: () {
                    if (index == 0) {
                      BlocProvider.of<BottomNavCubit>(context)
                          .getNavBarItem(NavbarItem.home);
                    } else if (index == 1) {
                      BlocProvider.of<BottomNavCubit>(context)
                          .getNavBarItem(NavbarItem.explore);
                    } else if (index == 2) {
                      BlocProvider.of<BottomNavCubit>(context)
                          .getNavBarItem(NavbarItem.search);
                    } else if (index == 3) {
                      BlocProvider.of<BottomNavCubit>(context)
                          .getNavBarItem(NavbarItem.orders);
                    } else if (index == 4) {
                      BlocProvider.of<BottomNavCubit>(context)
                          .getNavBarItem(NavbarItem.profile);
                    }
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        width: size.width * 0.06,
                        fit: BoxFit.contain,
                          image: AssetImage(index == state.index
                              ? icons[index].activeIcon
                              : icons[index].inActiveIcon)),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                          top: index == state.index ? 0 : size.width * .02,
                        ),
                        width: size.width * .016,
                        height: index == state.index ? size.width * .016 : 0,
                        decoration:  const BoxDecoration(
                          color: Color(0XFF563D7C),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(height: size.width * .01),
                    ],
                  ),
                ),)
              ],
            ),
          );
        },
      ),
    );
  }

  List<BottomIconModel> icons = [
    BottomIconModel(
        activeIcon: ConstantImages.home,
        inActiveIcon: ConstantImages.inactiveHome),
    BottomIconModel(
        activeIcon: ConstantImages.explore,
        inActiveIcon: ConstantImages.inactiveExplore),
    BottomIconModel(
        activeIcon: ConstantImages.search, inActiveIcon: ConstantImages.search),
    BottomIconModel(
        activeIcon: ConstantImages.order,
        inActiveIcon: ConstantImages.inactiveOrder),
    BottomIconModel(
        activeIcon: ConstantImages.profile,
        inActiveIcon: ConstantImages.inactiveProfile)
  ];
}

class BottomIconModel {
  final String activeIcon;
  final String inActiveIcon;
  BottomIconModel({required this.activeIcon, required this.inActiveIcon});
}
