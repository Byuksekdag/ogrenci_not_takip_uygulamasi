import 'package:flutter/material.dart';
import 'package:youtube_flutter_egitim/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  /*StudentAdd(List<Student> students) {
    this.students = students;
    }*/

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var student = Student("", "", 0, "");
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildFirstLastNameField(),
              buildFirstGradeField(),
              buildImageURLField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }

  buildFirstNameField() {
    return TextFormField(
      //Bildiğimiz Textbox.

      decoration: InputDecoration(
          labelText: "Öğrenci Adı",
          hintText: "Barış",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }

  buildFirstLastNameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //Bildiğimiz Textbox.

        decoration: InputDecoration(
            labelText: "Öğrenci Soyadı",
            hintText: "Yüksekdağ",
            prefixIcon: Icon(Icons.person_outline),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onSaved: (String? value) {
          student.lastName = value!;
        },
      ),
    );
  }

  buildFirstGradeField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //Bildiğimiz Textbox.

        decoration: InputDecoration(
            labelText: "Öğrenci Notu",
            hintText: "50",
            prefixIcon: Icon(Icons.grade),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onSaved: (String? value) {
          student.grade = int.parse(value!);
        },
      ),
    );
  }

  buildImageURLField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextFormField(
        //Bildiğimiz Textbox.

        decoration: InputDecoration(
            labelText: "Öğrenci Fotoğrafı Linki",
            hintText: "",
            prefixIcon: Icon(Icons.image),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(15)))),
        onSaved: (String? value) {
          student.profileImg = value!;
        },
      ),
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: () {
        formKey.currentState?.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}
