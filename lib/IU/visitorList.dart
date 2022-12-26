
import 'package:code_qr_project/Model/visitor.dart';
import 'package:code_qr_project/visitorListControllor.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VisitorList extends StatefulWidget {
  static const id='visitorList';
  @override
  State<VisitorList> createState() => _VisitorListState();
}

class _VisitorListState extends State<VisitorList> {
  List <Visitor> listVisitor = [];
  VisitorListBloc _visitorListBloc= VisitorListBloc();

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    initialGetSaved();
  }

  void initialGetSaved() async {
  _visitorListBloc.sharedPreferences = await SharedPreferences.getInstance();
  _visitorListBloc.initialGetSaved();
  listVisitor = _visitorListBloc.listVisitor;
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(title: Text("Visitor List"),),
      body:  buildListView(),

    );
  }

  Widget emptyList() {
    return Center(
        child: Text('No items')
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: listVisitor.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(listVisitor[index], index);
      },
    );
  }

  Widget buildItem(Visitor item, index) {
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(color: Colors.red[700]),
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item, index),
    );
  }

  void removeItem(Visitor item) {
    print("remove item");
  }

  Widget buildListTile(Visitor item, int index) {
    return
      Card(
        elevation: 8.0,
        child: Container(
          child:       ListTile(


            title: Text(
              item.id,
              key: Key('item-$index'),
              style: TextStyle(

              ),
            ),
            subtitle: Column
              (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                new Text("Time : "+item.time),
                new Text("Date : "+item.date),
                new Text("Door Number :"+item.doorNumber),

              ],
            ),
            leading: CircleAvatar(child: Text(item.id[0]),),

          )
          ,
        ),
      );
  }
}
