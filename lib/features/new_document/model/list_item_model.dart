class ListModel {
  List<FirebaseItemModel>? firebaseItemModel;
}

class FirebaseItemModel {
  final String? timesTamp;
  final ItemFirebase itemFirebase;

  FirebaseItemModel(this.timesTamp, this.itemFirebase);

  @override
  String toString() {
    return 'FirebaseItemModel{timesTamp: $timesTamp, itemFirebase: $itemFirebase}';
  }
}

class ItemFirebase {
  final String? ciot;
  final String? data;
  final bool? success;

  ItemFirebase({
    required this.ciot,
    required this.data,
    required this.success,
  });

  @override
  String toString() {
    return 'ItemFirebase{ciot: $ciot, data: $data, success: $success}';
  }
}
