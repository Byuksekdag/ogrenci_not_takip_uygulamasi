class Student {
  late int id;
  late String firstName;
  late String lastName;
  late int grade; //notu
  late String status; //kaldı geçti durumu
  late String profileImg;

  Student(this.firstName, this.lastName, this.grade, this.profileImg);

  /*
  Student(String this.firstName, String this.lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
*/
//named constructor
  Student.withId(
      this.id, this.firstName, this.lastName, this.grade, this.profileImg);
  /*Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  } */

  String get getStatus {
    String message = "";
    if (grade >= 50) {
      message = "Başarılı";
    } else if (grade >= 40) {
      message = "Bütünlemeye Kaldı";
    } else {
      message = "Başarısız";
    }
    status = message;
    return status;
  }
}
