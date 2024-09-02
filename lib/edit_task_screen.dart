import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:readexcel/users.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.users});

  Users users;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerTaskId,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'کدزائر',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskName,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'نام',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskFamily,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: ' نام خانوادگی',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerTaskNumberPhone,
                    maxLines: 2,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'تلفن همراه',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: negahban2.hasFocus
                                ? Color(0xff18DAA3)
                                : Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerTaskMedinaRoom,
                    maxLines: 2,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'اتاق مدینه',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: negahban2.hasFocus
                                ? Color(0xff18DAA3)
                                : Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerTaskMeccaRoom,
                    maxLines: 2,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'اتاق مکه',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: negahban2.hasFocus
                                ? Color(0xff18DAA3)
                                : Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controllerTaskBusNumber,
                    maxLines: 2,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'شماره اتوبوس',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: negahban2.hasFocus
                                ? Color(0xff18DAA3)
                                : Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: controllerTaskDescription,
                    maxLines: 2,
                    decoration: InputDecoration(
                        floatingLabelStyle: TextStyle(color: Color(0xff18DAA3)),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        labelText: 'توضحیات',
                        labelStyle: TextStyle(
                            fontFamily: 'GM',
                            fontSize: 20,
                            color: negahban2.hasFocus
                                ? Color(0xff18DAA3)
                                : Color(0xffC5C5C5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Color(0xffC5C5C5), width: 3)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(
                                width: 3, color: Color(0xff18DAA3)))),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypeitem = index;
                        });
                      },
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff18DAA3),
                    minimumSize: Size(200, 48)),
                onPressed: () {
                  String id = controllerTaskId!.text;
                  String name = controllerTaskName!.text;
                  String family = controllerTaskFamily!.text;
                  String numberPhone = controllerTaskNumberPhone!.text;
                  String medinaRoom = controllerTaskMedinaRoom!.text;
                  String meccaRoom = controllerTaskMeccaRoom!.text;
                  String busNumber = controllerTaskBusNumber!.text;
                  String description = controllerTaskDescription!.text;

                  editUser(id, name, family, numberPhone, medinaRoom, meccaRoom,
                      busNumber, description);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ویرایش مشخصات زائر',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  editUser(
      String id,
      String name,
      String family,
      String numberPhone,
      String medinaRoom,
      String meccaRoom,
      String busNumber,
      String description) {
    widget.users.id = id;
    widget.users.name = name;
    widget.users.family = family;
    widget.users.numberPhone = numberPhone;
    widget.users.medinaRoom = medinaRoom;
    widget.users.meccaRoom = meccaRoom;
    widget.users.busNumber = busNumber;
    widget.users.description = description;
    widget.users.save(); // box.put(1, users);
    // print(box.get(1)!.fullName);
  }
}
