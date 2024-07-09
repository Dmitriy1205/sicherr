import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapFocusRequestCubit extends Cubit<LatLng?> {
  MapFocusRequestCubit() : super(null);

  void changeMapFocus(LatLng newLocation){
    emit(newLocation);
    emit(null);
  }
}
