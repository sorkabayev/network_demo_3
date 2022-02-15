import 'package:flutter/material.dart';

import '../models/user_model.dart';


class DetailPage extends StatefulWidget {

  final User user;

  const DetailPage({Key? key, required this.user}) : super(key: key);

  static const id = "/detail_page";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.user.username, style: const TextStyle(fontSize: 26),),
            Text(widget.user.address.city.toString()),
          ],
        ),
      ),
    );
  }
}
