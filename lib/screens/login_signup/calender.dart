import 'package:fitnessapp/screens/login_signup/event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TextEditingController _eventcontroller = TextEditingController();
  Map<DateTime, List<Event>> events = {};
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getsEventsForDay(_selectedDay!));
  }

  void _onselected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getsEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getsEventsForDay(DateTime day) {
    // Retrieve all events from the selected day
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 40,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Text('Event'),
                  content: TextField(
                    controller: _eventcontroller,
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_eventcontroller.text.isNotEmpty) {
                          // If the selected day already has events, append to the list
                          if (events[_selectedDay] != null) {
                            events[_selectedDay]!
                                .add(Event(_eventcontroller.text));
                          } else {
                            // Otherwise, create a new list for the selected day
                            events[_selectedDay!] = [
                              Event(_eventcontroller.text)
                            ];
                          }
                          setState(() {
                            _selectedEvents.value =
                                _getsEventsForDay(_selectedDay!);
                            _eventcontroller.clear();
                          });

                          // Clear the text field and update the events for the selected day
                          Navigator.of(context).pop();
                          _eventcontroller.clear();
                          _selectedEvents.value =
                              _getsEventsForDay(_selectedDay!);
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              },
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const Text('Add Event'),
        ),
      ),
      body: content(),
    );
  }

  Widget content() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            rowHeight: 35,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            focusedDay: _focusedDay,
            eventLoader: _getsEventsForDay,
            firstDay: DateTime.utc(2010, 12, 30),
            lastDay: DateTime.utc(2030, 10, 25),
            onDaySelected: _onselected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text('Events'),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Confirm Action"),
                            content: const Text(
                                "Are you sure you want to remove this event?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    // ignore: collection_methods_unrelated_type
                                    events[_selectedDay]!.removeAt(index);
                                  });
                                  // Add your confirm action logic here
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Event removed!")),
                                  );
                                },
                                child: const Text("Confirm"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 202, 186, 186), // Background color
                        borderRadius:
                            BorderRadius.circular(10), // Rounded edges
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.7), // Dark shadow for depth
                            offset: const Offset(4, 4), // Bottom-right shadow
                            blurRadius: 6, // Smoothness of the shadow
                          ),
                          BoxShadow(
                            color: Colors.white
                                .withOpacity(0.5), // Light shadow for highlight
                            offset: const Offset(-4, -4), // Top-left shadow
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(value[index].title),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}
