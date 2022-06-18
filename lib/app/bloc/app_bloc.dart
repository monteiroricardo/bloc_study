import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppStateInitial()) {
    on<ChangeCurrentPage>(_changePageIndex);
  }
  _changePageIndex(ChangeCurrentPage event, Emitter<AppState> emit) {
    emit(AppStateChange(event.index));
  }
}
