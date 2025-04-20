import 'package:flutter/material.dart';

class DrinkReminder extends StatefulWidget {
  const DrinkReminder({super.key});

  @override
  State<DrinkReminder> createState() => _DrinkReminderState();
}

class _DrinkReminderState extends State<DrinkReminder> {
  String? selectedvalue;
  final TextEditingController _watercap = TextEditingController();
  final TextEditingController _timevalue = TextEditingController();
  final TextEditingController _fromTimeController = TextEditingController();
  final TextEditingController _toTimeController = TextEditingController();

  // Method to show time picker and update the respective controller
  Future<void> _selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(), // Default to the current time
    );

    if (pickedTime != null) {
      setState(() {
        // Format time as a string
        final String formattedTime =
            pickedTime.format(context); // Example: "2:30 PM"
        controller.text = formattedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drink Reminder')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Total quantity (in litre)',
                  )),
              const SizedBox(
                height: 8,
              ),
              DropdownMenu(
                controller: _watercap,
                width: double.infinity,
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: '3p5litre', label: '3.5 L'),
                  DropdownMenuEntry(value: ' 3litre', label: '3 L'),
                  DropdownMenuEntry(value: '2p5litre', label: '2.5 L '),
                ],
                onSelected: (String? value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Time interval for intake (in hours)',
                  )),
              const SizedBox(
                height: 8,
              ),
              DropdownMenu(
                controller: _timevalue,
                width: double.infinity,
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: ' 1hrs', label: '1 '),
                  DropdownMenuEntry(value: '2hrs', label: '2  '),
                  DropdownMenuEntry(value: '3hrs', label: '3 '),
                ],
                onSelected: (String? value) {
                  setState(() {
                    selectedvalue = value;
                  });
                },
              ),
              const SizedBox(
                height: 12,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Time Duration',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // "From" Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('From :'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: _fromTimeController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Select time',
                            suffixIcon: Icon(Icons.access_time),
                            border: OutlineInputBorder(),
                          ),
                          onTap: () {
                            _selectTime(context, _fromTimeController);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // "To" Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('To:'),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          controller: _toTimeController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'Select time',
                            suffixIcon: Icon(Icons.access_time),
                            border: OutlineInputBorder(),
                          ),
                          onTap: () {
                            _selectTime(context, _toTimeController);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 120, // Set the desired width
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Text('Add Reminder'),
                    // Set the desired color
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
