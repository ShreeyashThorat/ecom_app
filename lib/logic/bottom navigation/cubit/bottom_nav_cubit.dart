import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(const BottomNavState(NavbarItem.home, 0));
  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const BottomNavState(NavbarItem.home, 0));
        break;
      case NavbarItem.explore:
        emit(const BottomNavState(NavbarItem.explore, 1));
        break;
      case NavbarItem.search:
        emit(const BottomNavState(NavbarItem.search, 2));
        break;
      case NavbarItem.orders:
        emit(const BottomNavState(NavbarItem.orders, 3));
        break;
      case NavbarItem.profile:
        emit(const BottomNavState(NavbarItem.profile, 4));
        break;
    }
  }
}

enum NavbarItem { home, explore, search, orders, profile }

class BottomNavState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  const BottomNavState(this.navbarItem, this.index);
  @override
  List<Object> get props => [navbarItem, index];
}
