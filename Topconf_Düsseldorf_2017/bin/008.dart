void main() {
  var b1 = new Book("Android 7", "978-3-8362-4200-4");

  print("Titel: ${b1.title}, ISBN: ${b1.isbn}");
}

class Book {
  var title;
  var isbn;

  Book(this.title, this.isbn);
}
