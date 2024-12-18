1) enable activity recognition in your android  for step walked demo
2) firebase core and firestore package for data storing(collection reference ) CollectionReference collRef =
      FirebaseFirestore.instance.collection('user_info');
3)  DocumentReference docRef = FirebaseFirestore.instance for fetching data from FirebaseFirestore
3) StreamBuilder we use this to see change in firestore data n real time changes okay
docSnapshot.data() give==> {
  'name': 'Shrijana',
  'age': 21,
  'phone': '98634648'
}