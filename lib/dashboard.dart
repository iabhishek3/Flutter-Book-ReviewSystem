import 'package:book_rating/dot_type.dart';
import 'package:book_rating/loader.dart';
import 'package:flutter/material.dart';
import './service/book-service.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard View'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: FutureBuilder(
            future: Services.fetchHomeData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                    child: Center(
                  child: ColorLoader5(
                    dotOneColor: Colors.redAccent,
                    dotTwoColor: Colors.blueAccent,
                    dotThreeColor: Colors.green,
                    dotType: DotType.circle,
                    dotIcon: Icon(Icons.adjust),
                    duration: Duration(seconds: 1),
                  ),
                ));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(snapshot.data[index].author),
                        onTap: () => _showModalBottomSheet(context),
                      );
                    });
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile'))
        ],
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.only(
                  topLeft: new Radius.circular(15.0),
                  topRight: new Radius.circular(15.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              header(),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  height: 100,
                ),
                // child: ListView.builder(
                //   shrinkWrap: false,
                //   itemCount: menu.items.length,
                //   itemBuilder: (context, i) => Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: ListTile(
                //             title: Text(
                //               menu.items[i],
                //             ),
                //             onTap: () {
                //               Navigator.pop(context);
                //               Navigator.pushNamed(
                //                   context, "/${menu.items[i]}");
                //             }),
                //       ),
                // ),
              ),
              // MyAboutTile()
            ],
          )));
}

Widget header() => Ink(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.cyan.shade600, Colors.blue.shade900])),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              radius: 25.0,
              // backgroundImage: AssetImage(UIData.pkImage),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileTile(
                title: "Pawan Kumar",
                subtitle: "mtechviral@gmail.com",
                textColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;
  ProfileTile({this.title, this.subtitle, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}
