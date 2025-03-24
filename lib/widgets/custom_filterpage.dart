import 'package:flutter/material.dart';

class CustomFilterpage extends StatefulWidget {
CustomFilterpage({super.key});




  @override
  State<CustomFilterpage> createState() => _FilterPageState();
}

class _FilterPageState extends State<CustomFilterpage> {

String selectedCategory = 'all';

  final List<Map<String, String>> products = [
    {'name': 'وعاء', 'category': 'plants'},
    {'name': 'وعاء 1', 'category': 'pots'},
    {'name': 'بذور 1', 'category': 'seeds'},
    {'name': 'نبات 2', 'category': 'plants'},
    {'name': 'وعاء 2', 'category': 'pots'},
    {'name': 'بذور 2', 'category': 'seeds'},
  ];

  @override
  Widget build(BuildContext context) {
final filteredProducts = selectedCategory == 'all'
        ? products
        : products
            .where((product) => product['category'] == selectedCategory)
            .toList();





return Container(
      // Add height or constraints to ensure the Column can layout properly
      height: MediaQuery.of(context).size.height, 




    child : ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton('All'),
              _buildFilterButton('Plants'),
              _buildFilterButton('Pots'),
              _buildFilterButton('Seeds'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredProducts[index]['name']!),
                );
              },
            ),
          ),
        ],
    )
    );
  }

  Widget _buildFilterButton(String category) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedCategory = category.toLowerCase();
        });
      },
      child: Text(category),
    );
  }
  }
