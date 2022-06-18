part of 'app_bloc.dart';

abstract class AppState {
  final int currentPageIndex;
  AppState(this.currentPageIndex);
}

class AppStateInitial extends AppState {
  AppStateInitial() : super(0);
}

class AppStateChange extends AppState {
  AppStateChange(int currentPageIndex) : super(currentPageIndex);
}
