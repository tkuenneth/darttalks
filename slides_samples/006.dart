void main() {
  var b1 = new Book("Android 8",
      "978-3-8362-6058-9");
  print("Titel: ${b1.title}, ISBN: ${b1.isbn}");
}

class Book {
  var title;
  var isbn;
  Book(this.title, this.isbn);
}
