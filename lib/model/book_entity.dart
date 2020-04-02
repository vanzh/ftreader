import 'package:ftreader/generated/json/base/json_convert_content.dart';
import 'package:ftreader/generated/json/base/json_filed.dart';



class BookData with JsonConvert<BookData> {
	@JSONField(name: "Category")
	String category;
	@JSONField(name: "Books")
	List<BookDataBook> books;
	@JSONField(name: "Categories")
	List<BookDataCategory> categories;
	@JSONField(name: "BookList")
	BookDataBookList bookList;
}

class BookDataBook with JsonConvert<BookDataBook> {
	@JSONField(name: "Id")
	int id;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Author")
	String author;
	@JSONField(name: "Img")
	String img;
	@JSONField(name: "Desc")
	String desc;
	@JSONField(name: "CName")
	String cName;
	@JSONField(name: "Score")
	String score;
}

class BookDataCategory with JsonConvert<BookDataCategory> {
	@JSONField(name: "CategoryName")
	String categoryName;
	@JSONField(name: "CategoryId")
	int categoryId;
}

class BookDataBookList with JsonConvert<BookDataBookList> {
	@JSONField(name: "ImgUrl")
	String imgUrl;
	@JSONField(name: "ListId")
	int listId;
	@JSONField(name: "Title")
	String title;
	@JSONField(name: "Description")
	String description;
}
