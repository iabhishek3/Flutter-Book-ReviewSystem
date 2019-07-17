class Booklist {
  String name;
  String author;
  String category;
  String description;
  String note;
  String id;

  Booklist({
    this.name,
    this.author,
    this.category,
    this.description,
    this.note,
    this.id,
  });

  factory Booklist.fromJson(Map<String, dynamic> json) => new Booklist(
        name: json["name"],
        author: json["author"],
        category: json["category"],
        description: json["description"],
        note: json["note"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "author": author,
        "category": category,
        "description": description,
        "note": note,
        "id": id,
      };
}
