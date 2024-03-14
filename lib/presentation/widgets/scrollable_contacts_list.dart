import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/presentation/bloc/emergency_contact/emergency_contact_bloc.dart';

import '../../core/const/colors.dart';
import '../../core/theme/theme.dart';

class ScrollableContactList extends StatefulWidget {
  const ScrollableContactList({
    super.key,
  });

  @override
  State<ScrollableContactList> createState() => _ScrollableContactListState();
}

class _ScrollableContactListState extends State<ScrollableContactList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyContactBloc, EmergencyContactState>(
      builder: (context, state) {
        return RawScrollbar(
          thumbColor: AppColors.grey.withOpacity(0.5),
          controller: _scrollController,
          radius: const Radius.circular(5),
          thickness: 5,
          thumbVisibility: true,
          minThumbLength: 80,
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: AppColors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  itemCount: context
                      .read<EmergencyContactBloc>()
                      .state
                      .emContacts!
                      .length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 45,
                          child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text(
                                context
                                    .read<EmergencyContactBloc>()
                                    .state
                                    .emContacts![index]
                                    .name,
                                style: AppTheme.themeData.textTheme.titleMedium!
                                    .copyWith(color: AppColors.black),
                              ),
                            ),
                          ),
                        ),
                        const Divider(height: 0.5)
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
