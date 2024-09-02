import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:readexcel/user_details_screen.dart';
import 'users.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('usersBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchControllerByName = TextEditingController();
  final TextEditingController _searchControllerById = TextEditingController();
  final TextEditingController _searchControllerFamily = TextEditingController();
  final TextEditingController _searchControllerMeccaRoom =
      TextEditingController();
  final TextEditingController _searchControllerMedinaRoom =
      TextEditingController();
  final TextEditingController _searchControllerByBusNumber =
      TextEditingController();
  List<Users> searchResult = [];

  void _onSearchTextId(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.id.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  void _onSearchTextChangedName(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.name.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  void _onSearchTextFamily(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.family.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  void _onSearchTextMeccaRoom(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.meccaRoom.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  void _onSearchTextMedinaRoom(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.medinaRoom.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  void _onSearchTextChangedBusNumber(String text) {
    searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    final Box<Users> usersBox = Hive.box<Users>('usersBox');
    for (int i = 0; i < usersBox.length; i++) {
      Users user = usersBox.getAt(i)!;
      if (user.busNumber.toLowerCase().contains(text.toLowerCase())) {
        searchResult.add(user);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff18Daa3),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'لیست مسافران',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    controller: _searchControllerFamily,
                    onChanged: _onSearchTextFamily,
                    decoration: InputDecoration(
                      hintText: 'نام خانوادگی',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'sm',
                        color: Color(0xffE5E5E5),
                      ),
                      filled: true,
                      fillColor: Color(0xff18Daa3),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _searchControllerById,
                          onChanged: _onSearchTextId,
                          decoration: InputDecoration(
                            hintText: 'کدزائر',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'sm',
                              color: Color(0xffE5E5E5),
                            ),
                            filled: true,
                            fillColor: Color(0xff18Daa3),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:               Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _searchControllerByBusNumber,
                          onChanged: _onSearchTextChangedBusNumber,
                          decoration: InputDecoration(
                            hintText: 'شماره اتوبوس',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'sm',
                              color: Color(0xffE5E5E5),
                            ),
                            filled: true,
                            fillColor: Color(0xff18Daa3),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _searchControllerMeccaRoom,
                          onChanged: _onSearchTextMeccaRoom,
                          decoration: InputDecoration(
                            hintText: 'شماره اتاق مکه',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'sm',
                              color: Color(0xffE5E5E5),
                            ),
                            filled: true,
                            fillColor: Color(0xff18Daa3),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _searchControllerMedinaRoom,
                          onChanged: _onSearchTextMedinaRoom,
                          decoration: InputDecoration(
                            hintText: 'شماره اتاق مدینه',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontFamily: 'sm',
                              color: Color(0xffE5E5E5),
                            ),
                            filled: true,
                            fillColor: Color(0xff18Daa3),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchResult.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 160,
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
                                    builder: (context) => UserDetailsScreen(
                                        user: searchResult[index]),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                searchResult[index].id,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(':کدزائر'),
                                              Spacer(),
                                              Text(
                                                searchResult[index].family,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                searchResult[index].name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                searchResult[index].numberPhone,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(':شماره تماس'),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                searchResult[index].meccaRoom,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(':ش مکه'),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(
                                                searchResult[index].medinaRoom,
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
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [


                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                searchResult[index].busNumber,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(':ش اتوبوس'),
                                            ],
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(children: [
Text('نام:',style: TextStyle(fontSize: 16.0,color: Colors.grey
),),
SizedBox(width: 5,),
Text(
searchResult[index].name,
style: TextStyle(
fontSize: 16.0,
fontWeight: FontWeight.bold,
),
),
],),

SizedBox(height: 8.0),
Row(children: [
Text('نام خانوادگی:',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
color: Colors.grey,),),
SizedBox(width: 5,),
Text(
searchResult[index].family,
style: TextStyle(
fontSize: 16.0,

),
),
],),

SizedBox(height: 8.0),
Row(children: [
Text('شماره اتاق مکه',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
color: Colors.grey,),),
SizedBox(width: 5,),
Text(
searchResult[index].meccaRoom,
style: TextStyle(
fontSize: 16.0,

),
),
],),
SizedBox(height: 8.0),
Row(children: [
Text('شماره اتاق مدینه',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
color: Colors.grey,),),
SizedBox(width: 5,),
Text(
searchResult[index].medinaRoom,
style: TextStyle(
fontSize: 16.0,

),
),
],),
SizedBox(height: 8.0),
Row(children: [
Text('اتوبوس',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,
color: Colors.grey,),),
SizedBox(width: 5,),
Text(
searchResult[index].busNumber,
style: TextStyle(
fontSize: 16.0,

),
),
],),

],
),*/
