import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_demo_3/models/user_model.dart';
import 'package:network_demo_3/services/http_service.dart';
class EditPage extends StatefulWidget {

  final User user;

  const EditPage({Key? key, required this.user}) : super(key: key);

  static const String id = "edit_page";

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

   final nameController = TextEditingController();
   final usernameController = TextEditingController();
   final emailController = TextEditingController();
   final addressController = TextEditingController();
   final phoneController = TextEditingController();

   ///#Edit
   void _apiUserEdit(User user) {
     
     user.name = nameController.text;
     user.username = usernameController.text;
     user.email = emailController.text;
     user.phone = phoneController.text;
     user.address.city = addressController.text;
     
     HttpService.PUT(HttpService.API_EDIT_TODO + user.id.toString(), HttpService.paramsUpdate(user));
     Navigator.pop(context);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => _apiUserEdit(widget.user),icon: Icon(CupertinoIcons.arrow_left),),
        actions: [
          TextButton(onPressed: () => _apiUserEdit(widget.user), child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 20),))
        ],
        title: const Text("EDIT INFO"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController..text = widget.user.name,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: addressController..text = widget.user.address.city,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController..text = widget.user.email,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: phoneController..text = widget.user.phone,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usernameController..text = widget.user.username,
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder()
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
