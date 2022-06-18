part of 'app_bloc.dart';

abstract class AppEvent {}

class ChangeCurrentPage extends AppEvent {
  final int index;
  ChangeCurrentPage(this.index);
}
