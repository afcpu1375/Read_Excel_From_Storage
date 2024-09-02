import 'dart:io';

import 'package:flutter/material.dart';
import 'package:readexcel/edit_task_screen.dart';
import 'package:readexcel/full_detail.dart';
import 'package:readexcel/users.dart';

class UsersWidget extends StatefulWidget {
  UsersWidget({super.key, required this.users});

  Users users;

  @override
  State<UsersWidget> createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 160,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(
          (10),
        ),
      ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.users.id,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(':کدزائر'),
                      Spacer(),
                      Text(
                        widget.users.family,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        widget.users.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 15),
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
                        widget.users.numberPhone,
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
                        widget.users.meccaRoom,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(':شماره اتاق مکه'),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.users.busNumber,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(':شماره اتوبوس'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.users.medinaRoom,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(':شماره اتاق مدینه'),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return EditTaskScreen(
                                users: widget.users,
                              );
                            },
                          ));
                        },
                        child: Text(
                          'ویرایش ',
                          style: TextStyle(color: Color(0xff388f03)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset('assets/images/icon_edit.png'),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullDetailScreen(
                                users: widget.users,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'نمایش ',
                          style: TextStyle(color: Color(0xff388f03)),
                        ),
                      ),
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
    );

  }


}
