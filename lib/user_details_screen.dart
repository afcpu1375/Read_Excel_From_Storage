import 'package:flutter/material.dart';
import 'package:readexcel/edit_task_screen.dart';
import 'package:readexcel/full_detail.dart';
import 'package:readexcel/users.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({required this.user});

  final Users user;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff18DAA3),
        title: Text('نتایج جستحو',style: TextStyle(fontSize: 15),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
                Text(
                  'نام ونام خانوداگی : ${widget.user.name}',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'شماره همراه: ${widget.user.family}',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff18DAA3),
                      minimumSize: Size(200, 48)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return FullDetailScreen(
                          users: widget.user,
                        );
                      },
                    ));
                  },
                  child: Text(
                    'نمایش',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff18DAA3),
                      minimumSize: Size(200, 48)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'بازگشت',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
