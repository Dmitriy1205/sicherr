import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/bloc/map/search_position/search_position_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MapSearchField extends StatefulWidget {
  const MapSearchField({Key? key}) : super(key: key);

  @override
  State<MapSearchField> createState() => _MapSearchFieldState();
}

class _MapSearchFieldState extends State<MapSearchField> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchPositionCubit, SearchPositionState>(
      listener: (context, state) {
        state.maybeMap(
            positionPicked: (s) {
              _searchController.text = s.placeDetails.address;
            },
            orElse: () {});
      },
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24), bottom: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(3, 3),
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.searchResult.length,
                    itemBuilder: (context, index) {
                      final place = state.searchResult[index];
                      return InkWell(
                        onTap: () async {
                          context.read<SearchPositionCubit>().pickPosition(
                              placeId: state.searchResult[index].placeId!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(AppIcons.position),
                              const SizedBox(
                                width: 17,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place.description!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTheme
                                          .themeData.textTheme.titleLarge!
                                          .copyWith(
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 11),
                                    const Divider(
                                      color: Color(0xFFDADADA),
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(54),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                focusNode: focusNode,
                controller: _searchController,
                style: AppTheme.themeData.textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 22),
                  hintText: AppLocalizations.of(context)!.searchHere,
                  prefixIcon: SvgPicture.asset(AppIcons.search,
                      height: 10, width: 10, fit: BoxFit.scaleDown),
                  hintStyle: AppTheme.themeData.textTheme.titleLarge!
                      .copyWith(fontSize: 18, color: const Color(0xFF87878B)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(54),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(54),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(54),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (query) {
                  context.read<SearchPositionCubit>().getPlaces(query: query);
                },
                onTapOutside: (_) {
                  focusNode.unfocus();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
