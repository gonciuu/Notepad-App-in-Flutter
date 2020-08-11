class Note {
  String title, description, time, date, category;
  int isStar, id;

  Note({this.id,
        this.description,
        this.category,
        this.title,
        this.date,
        this.isStar,
        this.time});

  Map<String,dynamic> noteToMap(){
    Map<String,dynamic> map = Map<String,dynamic>();
    map['id'] = this.id;
    map['title'] = this.title;
    map['description'] = this.description;
    map['time'] = this.time;
    map['date'] = this.date;
    map['category'] = this.category;
    map['isStar'] = this.isStar;
    return map;
  }






}
