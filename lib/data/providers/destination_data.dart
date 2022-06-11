import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:noesatrip_app/data/models/destination.dart';

class DestinationData with ChangeNotifier {
  List<Destination> _items = [];

  List<Destination> get items {
    return [..._items];
  }

  Future<void> fetchDestination() async {
    final url = Uri.parse('http://localhost:8000/api/destinations');

    try {
      final res = await http.get(url);
      final jsonMembers = jsonDecode(res.body);
      // print(jsonMembers);

      final List<Destination> loadedDestination = [];

      jsonMembers.forEach((data) {
        Destination destination = Destination.fromJson(data);
        loadedDestination.add(destination);
      });

      _items = loadedDestination;
      notifyListeners();
      return Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      rethrow;
    }
  }
}
