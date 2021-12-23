import 'package:http/http.dart' ;
import 'package:flutter/foundation.dart';
import 'package:simpleproject/models/user_model.dart';
class FetchUser with ChangeNotifier{
  //Datum is users json model
  List<Datum> users = [];
  bool _error = false;
  String _errorMessage = '';
  int currentPage = 1;
  String url = 'https://reqres.in/api/users?page=';

  //let intialize total page, later its value updated
  int totalPages = 2;
  bool _message = true;

  bool get message => _message;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchUser async {
    if (currentPage > totalPages) {
      _message = false;
      notifyListeners();
    } else {
      final response = await get(Uri.parse(url + '$currentPage'));
      if (response.statusCode == 200) {
        try{
          final result = usersDataFromJson(response.body);
          users.addAll(result.data);

          currentPage++;
          totalPages = result.totalPages;

          // print(currentPage);
          _error = false;
        }catch(e){
          _error = true;
          _errorMessage = e.toString();
          users =[];
        }
      } else {
        _error = true;
        _errorMessage = "it might be your internet connection";
        users=[];

      }
      notifyListeners();
    }
  }

  //set to default value used to refreshing
  void initialValues(){
     users=[];
    _error = false;
     currentPage=1;
     totalPages=2;
     _message=true;
    _errorMessage = '';
    notifyListeners();
  }


}




