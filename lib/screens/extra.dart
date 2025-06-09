import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  _SelectionPageState createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String selectedOption = 'Daily'; // Default selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Option')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Dropdown menu
          DropdownButton<String>(
            value: selectedOption,
            items: ['Daily', 'Weekly', 'Monthly']
                .map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedOption = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          // Container based on selection
          Expanded(
            child: Center(
              child: getSelectedContainer(),
            ),
          ),
        ],
      ),
    );
  }

  // Returns container based on what is selected
  Widget getSelectedContainer() {
    if (selectedOption == 'Daily') {
      return Container(
        color: Colors.blue[100],
        width: 200,
        height: 200,
        child: const Center(child: Text('Daily View')),
      );
    } else if (selectedOption == 'Weekly') {
      return Container(
        color: Colors.green[100],
        width: 200,
        height: 200,
        child: const Center(child: Text('Weekly View')),
      );
    } else if (selectedOption == 'Monthly') {
      return Container(
        color: Colors.red[100],
        width: 200,
        height: 200,
        child: const Center(child: Text('Monthly View')),
      );
    } else {
      return Container();
    }
  }
}
