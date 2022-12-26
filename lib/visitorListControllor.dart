import 'dart:convert';
import 'Model/visitor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisitorListBloc {
 late List <Visitor> listVisitor =[] ;
  late final SharedPreferences sharedPreferences;
  VisitorListBloc() {

  }
  void initialGetSaved() async {
    var response = sharedPreferences.getStringList("visitorListData");
    print(sharedPreferences.getStringList("visitorListData"));
    Iterable<String> jsondataisw = response as Iterable<String>;
    for (final v in jsondataisw) {
      Map<String, dynamic> please = jsonDecode(v);
      var visitor = Visitor.fromJson(please);
      print(visitor.id);
      listVisitor.add(visitor);

    }
  }



// *****************************  Step 5 : Dispose     *****************************

  void dispose() {

  }
}
