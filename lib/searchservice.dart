import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField,CollectionReference Collection)  {

      return Collection
        .where('key',
        isEqualTo: searchField.substring(0, 1))
        .getDocuments();
  }
}
