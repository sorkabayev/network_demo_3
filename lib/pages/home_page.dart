import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/user_model.dart';
import '../services/http_service.dart';
import 'detail_page.dart';
import 'edit_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";
  List<User> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiUserList();
  }

  ///#Get
  void apiUserList(){
    HttpService.GET(HttpService.API_TODO_LIST, HttpService.paramEmpty()).then((response) => {
     print(response!),
      _showResponse(response)
    });
  }
///#Delete
  void apiUserDelete(){
    HttpService.DELETE(HttpService.API_DELETE_TODO, HttpService.paramEmpty()).then((response) => {
      print(response!),
      _showResponse(response)
    });
  }


  ///Showing
  void _showResponse(String response){
    UserList userlist = HttpService.parseUserList(response);
    print(userlist);
    setState(() {
      items = userlist.userList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("NetWorking"),
      ),
      body: items.isNotEmpty
          ? ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return itemOfList(items[index]);
          })
          : const Center(child: CircularProgressIndicator.adaptive()),
      floatingActionButton: FloatingActionButton(onPressed: () {  },child: Icon(Icons.add),),
    );
  }

  Widget itemOfList(User item) {
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
        SlidableAction(
          onPressed: (context){
          HttpService.storeListNote(items);
          items.remove(item);
          setState(() {});
        },
          icon: CupertinoIcons.delete,),
        SlidableAction(onPressed: (context) async {
         await Navigator.push(context,
             MaterialPageRoute(
                 builder: (context) => EditPage(user: item),
             ));
         apiUserList();
        },
          icon: CupertinoIcons.pen,),
      ],
      ),
      child: Card(

        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(user: item),
                ));
          },
          title: Text("${item.username}\n${item.email}\n${item.name}\n${item.phone}"),
          subtitle: Text(item.address.city.toString()),
        ),
      ),
    );
  }
}
