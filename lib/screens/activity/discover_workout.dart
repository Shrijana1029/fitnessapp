import 'package:flutter/material.dart';

class DiscoverWorkout extends StatefulWidget {
  final Map<String, dynamic> vObj;
  final VoidCallback onPressed;
  const DiscoverWorkout(
      {super.key, required this.vObj, required this.onPressed});

  @override
  State<DiscoverWorkout> createState() => _DiscoverWorkoutState();
}

class _DiscoverWorkoutState extends State<DiscoverWorkout> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.vObj['title']}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '${widget.vObj['exercises']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${widget.vObj['time']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                '${widget.vObj['tagi']}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: Container(
                  width: 201,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.vObj['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(
                        8), // Optional: add rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
