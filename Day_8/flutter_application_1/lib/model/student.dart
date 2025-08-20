class Student {
  String name;
  String email;
  String gender;
  bool active;
  bool notifications;
  DateTime dob;

  Student({
    required this.name,
    required this.email,
    required this.gender,
    required this.active,
    required this.notifications,
    required this.dob,
  });
  
  int get age {
    final today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
      age--;
    }
    return age;
  }
}


/*
  String _name = "";
  String _emai = "";
  String _gender = "Male";
  bool _active = false;
  bool _notifications = false;
  DateTime? _dob; */