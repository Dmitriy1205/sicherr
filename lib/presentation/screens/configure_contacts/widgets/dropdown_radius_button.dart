import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/utils/radius_string.dart';
import 'package:sicherr/domain/entities/navigation/route_details/route_details.dart';
import 'package:sicherr/presentation/bloc/map/home_position/home_position_cubit.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/strings.dart';
import '../../../../core/theme/theme.dart';

class DropdownRadiusButton extends StatelessWidget {
  final RouteDetails routeDetails;

  const DropdownRadiusButton({super.key, required this.routeDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink, width: 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isDense: true,
          borderRadius: BorderRadius.circular(20),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          value: radiusToString(
              radiusInt:
                  context.read<HomePositionCubit>().state.routeDetails.radius),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.pink),
          iconSize: 24,
          style: AppTheme.themeData.textTheme.titleSmall!
              .copyWith(fontSize: 16, color: AppColors.mainAccent),
          onChanged: (String? newValue) {
            context.read<HomePositionCubit>().setRadius(
                routeDetails: routeDetails,
                pickedRadius: stringToRadius(newValue!));
          },
          items: AppStrings.distances
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text('Radius $value'),
            );
          }).toList(),
        ),
      ),
    );
  }
}
