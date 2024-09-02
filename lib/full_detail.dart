import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readexcel/edit_task_screen.dart';
import 'package:readexcel/users.dart';

class FullDetailScreen extends StatefulWidget {
  FullDetailScreen({super.key, required this.users});

  Users users;

  @override
  State<FullDetailScreen> createState() => _FullDetailScreenState();
}

class _FullDetailScreenState extends State<FullDetailScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? controllerTaskId;
  TextEditingController? controllerTaskName;
  TextEditingController? controllerTaskFamily;
  TextEditingController? controllerTaskNumberPhone;
  TextEditingController? controllerTaskMedinaRoom;
  TextEditingController? controllerTaskMeccaRoom;
  TextEditingController? controllerTaskBusNumber;
  TextEditingController? controllerTaskDescription;

  final box = Hive.box<Users>('usersBox');

  DateTime? _time;

  int _selectedTaskTypeitem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controllerTaskId = TextEditingController(text: widget.users.id);
    controllerTaskName = TextEditingController(text: widget.users.name);
    controllerTaskFamily = TextEditingController(text: widget.users.family);
    controllerTaskNumberPhone =
        TextEditingController(text: widget.users.numberPhone);
    controllerTaskMedinaRoom =
        TextEditingController(text: widget.users.medinaRoom);
    controllerTaskMeccaRoom =
        TextEditingController(text: widget.users.meccaRoom);
    controllerTaskBusNumber =
        TextEditingController(text: widget.users.busNumber);
    controllerTaskDescription =
        TextEditingController(text: widget.users.description);

    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
   // checkPermission(Permission.manageExternalStorage, context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                 getMainContent(),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMainContent()  {

    File file = File(widget.users.imagePath.toString());
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(height:150,child: InstaImageViewer(child: Image.file(File(file.path))))
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.users.id,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text(':کد زائر ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.users.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              Text(':نام  ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.users.family,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              Text(':نام خانوادگی  ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.users.numberPhone,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text(':شماره همراه ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.users.medinaRoom,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text(':شماره اتاق مدینه ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.users.meccaRoom,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text(':شماره اتاق مکه ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.users.busNumber,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text(':شماره اتوبوس ', style: TextStyle(fontSize: 15,color: Colors.grey)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(':توضیحات ', style: TextStyle(fontSize: 15,color: Colors.grey)),
              SizedBox(
                  height: 60,
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(widget.users.description,
                           style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          getTimeAndEditBadgs()
        ],
      ),
    );
  }

  Widget getTimeAndEditBadgs() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        SizedBox(
          height: 100,
        ),
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff18DAA3),
                      minimumSize: Size(200, 48)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return EditTaskScreen(
                          users: widget.users,
                        );
                      },
                    ));
                  },
                  child: Text(
                    'ویرایش',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff18DAA3),
                      minimumSize: Size(200, 48)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'بازگشت',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

/*  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Done!")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("NO permisson!")));
    }
  }*/
}
