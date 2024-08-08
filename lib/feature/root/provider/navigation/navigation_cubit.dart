import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.dashboard, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.dashboard:
        emit(const NavigationState(NavbarItem.dashboard, 0));
        break;

      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 1));
        break;

      case NavbarItem.task:
        emit(const NavigationState(NavbarItem.task, 2));
        break;

      case NavbarItem.account:
        emit(const NavigationState(NavbarItem.account, 3));
        break;
    }
  }
}
