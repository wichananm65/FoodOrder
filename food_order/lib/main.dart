import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Food Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _menuItems = [];
  final List<Map<String, dynamic>> _allMenus = [
    {
      'name': 'Spaghetti Carbonara',
      'price': '12.99',
      'ingredients': ['Spaghetti', 'Eggs', 'Parmesan', 'Bacon'],
    },
    {
      'name': 'Margherita Pizza',
      'price': '10.99',
      'ingredients': ['Tomato Sauce', 'Mozzarella', 'Basil'],
    },
    {
      'name': 'Caesar Salad',
      'price': '8.99',
      'ingredients': ['Lettuce', 'Croutons', 'Parmesan', 'Caesar Dressing'],
    },
    {
      'name': 'Beef Burger',
      'price': '11.49',
      'ingredients': ['Beef Patty', 'Lettuce', 'Tomato', 'Cheese', 'Bun'],
    },
    {
      'name': 'Grilled Salmon',
      'price': '15.99',
      'ingredients': ['Salmon', 'Lemon', 'Herbs'],
    },
    {
      'name': 'Chicken Alfredo',
      'price': '13.49',
      'ingredients': ['Chicken', 'Fettuccine', 'Cream', 'Parmesan'],
    },
    {
      'name': 'Tuna Sandwich',
      'price': '7.99',
      'ingredients': ['Tuna', 'Bread', 'Mayonnaise', 'Lettuce'],
    },
  ];

  final Random _random = Random();
  double _totalPrice = 0.0;

  void _addRandomMenuItem() {
    setState(() {
      final randomIndex = _random.nextInt(_allMenus.length);
      final selectedItem = _allMenus[randomIndex];
      _menuItems.add(selectedItem);

      _totalPrice += double.parse(selectedItem['price']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('${widget.title} - Total: ${_totalPrice.toStringAsFixed(2)}'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: _menuItems.isEmpty
                ? const Center(
                    child: Text(
                      'No items in the menu! Press the + button to add one.',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.builder(
                    itemCount: _menuItems.length,
                    itemBuilder: (context, index) {
                      final menuItem = _menuItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Text(
                              '${menuItem['price']}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Text(
                            menuItem['name'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Ingredients: ${menuItem['ingredients'].join(', ')}',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomMenuItem,
        tooltip: 'Add Random Menu',
        child: const Icon(Icons.add),
      ),
    );
  }
}
