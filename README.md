1) enable activity recognition in your android  for step walked demo
2) firebase core and firestore package for data storing(collection reference ) CollectionReference collRef =
      FirebaseFirestore.instance.collection('user_info'); we use collRef to store document inside collection.
3)  DocumentReference docRef = FirebaseFirestore.instance for fetching data from document
3) StreamBuilder we use this to see change in firestore data n real time changes okay
docSnapshot.data() give==> {
  'name': 'Shrijana',
  'age': 21,
  'phone': '98634648'
}
4) basically, the future builder wdget is used whenever we want to fetch a data from outside that may be late or null or async, to handle such things ?null huna sakxa, !. null hudaina fix