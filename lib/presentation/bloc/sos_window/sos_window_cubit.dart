import 'package:bloc/bloc.dart';

class SosWindowCubit extends Cubit<bool> {
  SosWindowCubit() : super(false);

  void openWindow(){
    emit(true);
  }

  void closeWindow(){
    emit(false);
  }
}
