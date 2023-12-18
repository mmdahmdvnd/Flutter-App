
import 'package:flutter/material.dart';
// import 'package:flutter_map_app/model.dart';
import 'Request.dart';

class RequestsViewModel extends ChangeNotifier {
  List<Request> _requests = [Request(name: 'درخواست 1'), Request(name: 'درخواست 2'), Request(name: 'درخواست 3')];

  List<Request> get requests => _requests;

  void addRequest(Request request) {
    _requests.add(request);
    notifyListeners();
  }
}