import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class START extends StatefulWidget {
  int p1, p2, p3, p4;
  SharedPreferences prefs;

  START();

  @override
  _STARTState createState() => _STARTState();
}

class _STARTState extends State<START> {
  int page = 0;
  String title = "Triagem START";
  Widget body;
  Icon tileicon;
  Function titlefunc;
  int p = 3;
  List<bool> isSelected = List.filled(6, false);

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      widget.p1 = value.containsKey('p1') ? value.getInt('p1') : 0;
      widget.p2 = value.containsKey('p2') ? value.getInt('p2') : 0;
      widget.p3 = value.containsKey('p3') ? value.getInt('p3') : 0;
      widget.p4 = value.containsKey('p4') ? value.getInt('p4') : 0;
    });
  }

  void refresh() async {
    widget.prefs = await SharedPreferences.getInstance();
    widget.prefs.setInt('p1', widget.p1);
    widget.prefs.setInt('p2', widget.p2);
    widget.prefs.setInt('p3', widget.p3);
    widget.prefs.setInt('p4', widget.p4);
    isSelected = [false, false, false, false, false, false];
  }

  Color evaluation() {
    if (isSelected[0]) {
      p = 3;
      return Color.fromRGBO(52, 168, 83, 1.0);
    } else {
      if (isSelected[1]) {
        if (isSelected[4] || isSelected[2]) {
          p = 1;
          return Color.fromRGBO(234, 67, 53, 1.0);
        } else if (isSelected[4]) {
          p = 1;
          return Color.fromRGBO(234, 67, 53, 1.0);
        } else if (isSelected[5]) {
          p = 2;
          return Color.fromRGBO(251, 188, 4, 1.0);
        } else {
          p = 1;
          return Color.fromRGBO(234, 67, 53, 1.0);
        }
      } else {
        p = 4;
        return Colors.black;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 1:
        title = "Sum??rio";
        body = Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          "${widget.p1}",
                          style: TextStyle(
                              fontSize: 80,
                              color: Color.fromRGBO(79, 129, 189, 1.0)),
                        ),
                      ),
                      color: Color.fromRGBO(234, 67, 53, 1.0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          "${widget.p2}",
                          style: TextStyle(
                              fontSize: 80,
                              color: Color.fromRGBO(79, 129, 189, 1.0)),
                        ),
                      ),
                      color: Color.fromRGBO(251, 188, 4, 1.0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          "${widget.p3}",
                          style: TextStyle(
                              fontSize: 80,
                              color: Color.fromRGBO(79, 129, 189, 1.0)),
                        ),
                      ),
                      color: Color.fromRGBO(52, 168, 83, 1.0),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Center(
                        child: Text(
                          "${widget.p4}",
                          style: TextStyle(
                              fontSize: 80,
                              color: Color.fromRGBO(79, 129, 189, 1.0)),
                        ),
                      ),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        tileicon = Icon(Icons.delete);
        titlefunc = () {
          setState(() {
            widget.p1 = 0;
            widget.p2 = 0;
            widget.p3 = 0;
            widget.p4 = 0;
            SnackBar snackBar = SnackBar(
              backgroundColor: Color.fromRGBO(44, 73, 108, 0.70),
              content: Text(
                'Eliminado',
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 800),
            );
            refresh();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        };
        break;
      default:
        title = "Triagem START";
        body = Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: evaluation(),
                )),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[0] = !isSelected[0];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[0]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.directions_walk_rounded,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "Caminha",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[1] = !isSelected[1];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[1]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(WeatherIcons.windy,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "Respira",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[2] = !isSelected[2];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[2]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.autorenew_rounded,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "+30 ciclos/min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[3] = !isSelected[3];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[3]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.medical_services_outlined,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "Adjuvantes",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[4] = !isSelected[4];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[4]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.favorite_border,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "PC >2 seg",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isSelected[5] = !isSelected[5];
                        });
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: ((st) {
                            return st
                                ? Color.fromRGBO(208, 216, 232, 1.0)
                                : Color.fromRGBO(233, 237, 244, 1.0);
                          })(isSelected[5]),
                          side: BorderSide(
                            color: Colors.white,
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.assignment_turned_in_outlined,
                              size: 70,
                              color: Color.fromRGBO(44, 73, 108, 1.0)),
                          Text(
                            "Cumpre ordens",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(44, 73, 108, 1.0),
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
        tileicon = Icon(Icons.check);
        titlefunc = () {
          setState(() {
            switch (p) {
              case 1:
                widget.p1++;
                break;
              case 2:
                widget.p2++;
                break;
              case 3:
                widget.p3++;
                break;
              case 4:
                widget.p4++;
                break;
            }
            SnackBar snackBar = SnackBar(
              backgroundColor: Color.fromRGBO(44, 73, 108, 0.70),
              content: Text(
                'Guardado',
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 800),
            );
            refresh();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        };
        break;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Color.fromRGBO(79, 129, 189, 1.0),
          actions: [
            IconButton(
              icon: tileicon,
              onPressed: titlefunc,
            ),
          ],
        ),
        body: body,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(208, 216, 232, 1.0),
          selectedItemColor: Color.fromRGBO(79, 129, 189, 1.0),
          unselectedItemColor: Color.fromRGBO(44, 73, 108, 1.0),
          iconSize: 30,
          currentIndex: page,
          onTap: (int e) {
            setState(() {
              e == 1 ? page = 1 : page = 0;
            });
          },
          items: [
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Triagem"),
              icon: Icon(Icons.warning),
            ),
            BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text("Sum??rio"),
              icon: Icon(Icons.list),
            ),
          ],
        ));
  }
}
