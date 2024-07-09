import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class NavbarSelectedPageIndexCubit extends Cubit<int> {
  NavbarSelectedPageIndexCubit() : super(0);

  void changeIndex(int val){
    emit(val);
  }
}
