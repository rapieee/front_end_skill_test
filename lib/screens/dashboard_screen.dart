import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../provider/item_provider.dart';
import '../../widgets/item_card.dart';
import '../../widgets/custom_text_field.dart';

class DashboardScreen extends StatelessWidget {
  final TextEditingController itemController = TextEditingController();

  void _showEditDialog(BuildContext context, ItemProvider itemProvider, String itemId) {
    final TextEditingController editController = TextEditingController();
    final item = itemProvider.items.firstWhere((item) => item.id == itemId);
    editController.text = item.name;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: editController,
            decoration: InputDecoration(hintText: "Enter new name"),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                itemProvider.editItem(itemId, editController.text);
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'User Dashboard',
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 173, 255),
        ),
        backgroundColor: Colors.blueGrey[50],
        body: Consumer<ItemProvider>(
          builder: (context, itemProvider, child) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: itemController,
                      label: 'Add New Item',
                      icon: Icons.add,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (itemController.text.isNotEmpty) {
                          itemProvider.addItem(itemController.text);
                          itemController.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter an item name.'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Add Item',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: itemProvider.items.isEmpty
                          ? Center(
                              child: Text(
                                'No items added yet.',
                                style: GoogleFonts.poppins(
                                    color: Colors.blueGrey[400]),
                              ),
                            )
                          : ListView.builder(
                              itemCount: itemProvider.items.length,
                              itemBuilder: (context, index) {
                                final item = itemProvider.items[index];
                                return ItemCard(
                                  item: item,
                                  onDelete: () =>
                                      itemProvider.removeItem(item.id),
                                  onEdit: () =>
                                      _showEditDialog(context, itemProvider, item.id),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
