
import 'package:flutter/widgets.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/widgets/grouped_items/grouped_items_factory.dart';


// Widget for grouping widgets by some string, in that case letters A-Z
class GroupedItems extends StatelessWidget {
  final Map<String, List<ContactEntity>> groupedContacts;
  final BaseContactFactory contactFactory;

  GroupedItems(
      {super.key, required this.groupedContacts, required this.contactFactory});

  final List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
        itemCount: groupedContacts.length,
        itemBuilder: (BuildContext context, int index) {
          String category = groupedContacts.keys.elementAt(index);
          List<ContactEntity> itemsInCategory = groupedContacts[category]!;

          // Return a widget representing the category and its items
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: index != 0 ? 15 : 0, bottom: 5),
                child: Text(
                  category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemsInCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = itemsInCategory[index];

                  return contactFactory.create(item);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

