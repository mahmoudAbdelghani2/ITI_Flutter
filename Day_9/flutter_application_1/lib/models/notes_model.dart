class Note {
  int? id;
  String title;
  String description;
  String day;
  String hour;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.day,
    required this.hour
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'description': description,
      'day': day,
      'hour': hour,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      day: map['day'],
      hour: map['hour'],
    );
  }
}
