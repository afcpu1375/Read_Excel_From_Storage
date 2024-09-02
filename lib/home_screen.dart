import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readexcel/add_task_screen.dart';
import 'package:readexcel/edit_task_screen.dart';
import 'package:readexcel/full_detail.dart';
import 'package:readexcel/search.dart';
import 'package:readexcel/users.dart';
import 'package:readexcel/users_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var usersBox = Hive.box<Users>('usersBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff18Daa3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () async {
                checkPermission(Permission.manageExternalStorage, context);

                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  File file = File(result.files.single.path!);
                  var bytes = file.readAsBytesSync();
                  var excel = Excel.decodeBytes(bytes);

                  List<Map<String, dynamic>> jsonData = [];

                  for (var table in excel.tables.keys) {
                    for (var row in excel.tables[table]!.rows) {
                      Map<String, dynamic> rowData = {};
                      for (int i = 0; i < row.length; i++) {
                        rowData['Column $i'] = row[i]?.value.toString();
                      }
                      jsonData.add(rowData);
                    }
                  }

                  // تبدیل داده‌های به فرمت JSON
                  var jsonString = jsonEncode(jsonData);
                  print(jsonString);

                  /*     List<String> filesList =
                      await getFilesList('/storage/emulated/0/Download/Afcpu');
                  print(filesList);*/

                  /*   for(int i = 1 ; i<=filesList.length;i++){
                    addProfileImage(filesList[i]);
                  }*/

                  for (int i = 0; i < jsonData.length; i++) {
                    addUsers(
                        (jsonData[i]['Column 0']),
                        (jsonData[i]['Column 1']),
                        (jsonData[i]['Column 2']),
                        (jsonData[i]['Column 3']),
                        (jsonData[i]['Column 4']),
                        (jsonData[i]['Column 5']),
                        (jsonData[i]['Column 6']),
                        (jsonData[i]['Column 7']),
                        (jsonData[i]['Column 8']));
                  }

                  /*    for (var data in jsonData) {
                    addUsers(
                        (data["Column 0"]), (data["Column 1"]), (data["Column 2"]), (data["Column 3"]), (data["Column 4"]), (data["Column 5"]),(data["Column 6"]));
                  }*/

                  // نمایش داده‌های هر ستون
                  int columnNumber = 1; // شماره ستون مورد نظر
                  List<String> columnData = [];
                  for (var data in jsonData) {
                    columnData.add(data['Column $columnNumber']);
                  }
                  print('داده‌های ستون $columnNumber: $columnData');
                } else {
                  // اگر کاربر فایلی انتخاب نکرد
                }
              },
              child: Text('انتخاب فایل اکسل'),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search_rounded,
                )),
            Text(
              'لیست مسافران',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffE5E5E5),
      body: ValueListenableBuilder(
        valueListenable: usersBox.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: usersBox.values.length,
            itemBuilder: (context, index) {
              var users = usersBox.values.toList()[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 160,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(
                    (10),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullDetailScreen(
                          users: users,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          users.id,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(':کدزائر'),
                                      ],
                                    ),
                                    Container(
                                      child: Text(
                                        '${users.name} ${users.family}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      users.numberPhone,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(':شماره تماس'),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      users.meccaRoom,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(':ش  مکه'),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      users.medinaRoom,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(':ش مدینه'),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      users.busNumber,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(':ش اتوبوس'),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) {
                                            return EditTaskScreen(
                                              users: users,
                                            );
                                          },
                                        ));
                                      },
                                      child: Text(
                                        'ویرایش ',
                                        style:
                                            TextStyle(color: Color(0xff388f03)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Image.asset('assets/images/icon_edit.png'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AddTaskScreen();
            },
          ));
        },
        backgroundColor: Color(0xff18Daa3),
        child: Image.asset('assets/images/icon_add.png'),
      ),
    );
  }

  addUsers(
      String id,
      String name,
      String family,
      String numberPhone,
      String medinaRoom,
      String meccaRoom,
      String busNumber,
      String description,
      String imagePath) {
    var users = Users(
        id: id,
        name: name,
        family: family,
        numberPhone: numberPhone,
        medinaRoom: medinaRoom,
        meccaRoom: meccaRoom,
        busNumber: busNumber,
        description: description,
        imagePath: imagePath);
    usersBox.add(users);
    // box.put(1, users);
    // print(box.get(1)!.fullName);
  }

//get permission Storage

  Future<void> checkPermission(
      Permission permission, BuildContext context) async {
    final status = await permission.request();
    if (status.isGranted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("مجوز دسترسی صادر شد")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("مجوز دسترسی صادر نشد!")));
    }
  }

  void filterList(String enterdKeyword) {
    List<Users> usersResult = [];
  }
}
