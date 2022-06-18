import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:noesatrip_app/data/models/destination.dart';
import 'package:noesatrip_app/data/providers/auth.dart';

class DestinationData with ChangeNotifier {
  List<Destination> _items = [];

  List<Destination> get items {
    return [..._items];
  }

  final String? token;
  final String? userId;

  DestinationData(this.token, this.userId, this._items);

  List<Destination> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Future<void> fetchDestination() async {
    final url = Uri.parse('http://localhost:8000/api/destinations');
    // print("$token, $userId");

    try {
      final res = await http.get(url);
      final jsonMembers = jsonDecode(res.body);
      // print(jsonMembers);

      final List<Destination> loadedDestination = [];

      final url_2 =
          Uri.parse('http://localhost:8000/api/favorite-status/$userId');
      final res_2 = await http.get(
        url_2,
        headers: {"Authorization": "Bearer $token"},
      );
      final favData = jsonDecode(res_2.body);
      // print(favData);

      int destId = 0;
      bool? status;

      jsonMembers.forEach((json) {
        destId = json["id"];
        if (favData["error"] != null) {
          status = false;
        } else {
          status = favData![destId.toString()] == null
              ? false
              : favData[destId.toString()];
        }
        Destination destination = Destination.fromJson(json, status);
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
