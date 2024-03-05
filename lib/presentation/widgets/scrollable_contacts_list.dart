import 'package:flutter/material.dart';

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
          child: ListView.separated(
            controller: _scrollController,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 45,
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Name',
                      style: AppTheme.themeData.textTheme.titleMedium!
                          .copyWith(color: AppColors.black),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(height: 0.5);
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
