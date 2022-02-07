// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:youtube_flutter_egitim/models/student.dart';
import 'package:youtube_flutter_egitim/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "Barış", "Yüksekdağ", 85,
        "https://www.thefashionisto.com/wp-content/uploads/2021/03/Attractive-Man-Selfie-Sunglasses-Smiling.jpg"),
    Student.withId(2, "Hakan", "Tepe", 41,
        "https://wallpaperaccess.com/full/2213424.jpg"),
    Student.withId(3, "Eren", "Çapak", 31,
        "https://www.begonya.com/wp-content/uploads/2021/09/koksal-bektasoglu-kimdir.-1024x683.jpg")
  ];
  Student selectedStudent = Student.withId(0, " Hiç kimse", "", 0, "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Öğrenci Takip Sistemi",
            style: TextStyle(color: Colors.white),
          ),
          // backgroundColor: Colors.white,
          elevation: 0.3,
          // systemOverlayStyle:
          //  SystemUiOverlayStyle(statusBarColor: Colors.white),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].profileImg),
                    ),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                    onLongPress: () {
                      print("Uzun basıldı");
                    },
                  );
                }),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Seçili öğrenci :" + selectedStudent.firstName)),
          Row(
            children: <Widget>[
              SizedBox(
                width: 3.0,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text("Yeni öğrenci", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.blueAccent),

                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentAdd(students)));
                    },
                    //label: Text("Yeni öğrenci ekle"),
                  )),
              SizedBox(
                width: 3.0,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text("Güncelle", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: Colors.orangeAccent),
                    onPressed: () {
                      setState(() {});
                      print("Güncellendi");
                    },
                    //label: Text("Yeni öğrenci ekle"),
                  )),
              SizedBox(
                width: 3.0,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ElevatedButton(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 3.0,
                        ),
                        Text("Sil", style: TextStyle(fontSize: 12))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                    onPressed: () {
                      setState(() {
                        students.remove(selectedStudent);
                      });

                      print("Silindi");
                    },
                    //label: Text("Yeni öğrenci ekle"),
                  )),
              SizedBox(
                width: 3.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.sentiment_very_satisfied);
  } else if (grade >= 40) {
    return Icon(Icons.sentiment_neutral);
  } else {
    return Icon(Icons.smoking_rooms);
  }
}
