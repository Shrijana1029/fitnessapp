import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EXtra extends StatefulWidget {
  const EXtra({super.key});

  @override
  State<EXtra> createState() => _EXtraState();
}

class _EXtraState extends State<EXtra> {
  CollectionReference collRef =
      FirebaseFirestore.instance.collection('user_info');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: collRef.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (streamSnapshot.hasError) {
          return Center(child: Text('Error: ${streamSnapshot.error}'));
        }
        if (!streamSnapshot.hasData || streamSnapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data available'));
        }

        // Accessing the QuerySnapshot
        //age: docs[index].data()['age']
        final docs = streamSnapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final data = docs[index].data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['name'] ?? 'No Name'),
              subtitle: Text('Age: ${data['age'] ?? 'Unknown'}'),
            );
          },
        );
      },
    ));
  }
}
