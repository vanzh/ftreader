import 'package:ftreader/model/book_entity.dart';


bookDataFromJson(BookData data, Map<String, dynamic> json) {
	if (json['Category'] != null) {
		data.category = json['Category']?.toString();
	}
	if (json['Books'] != null) {
		data.books = new List<BookDataBook>();
		(json['Books'] as List).forEach((v) {
			data.books.add(new BookDataBook().fromJson(v));
		});
	}
	if (json['Categories'] != null) {
		data.categories = new List<BookDataCategory>();
		(json['Categories'] as List).forEach((v) {
			data.categories.add(new BookDataCategory().fromJson(v));
		});
	}
	if (json['BookList'] != null) {
		data.bookList = new BookDataBookList().fromJson(json['BookList']);
	}
	return data;
}

Map<String, dynamic> bookDataToJson(BookData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Category'] = entity.category;
	if (entity.books != null) {
		data['Books'] =  entity.books.map((v) => v.toJson()).toList();
	}
	if (entity.categories != null) {
		data['Categories'] =  entity.categories.map((v) => v.toJson()).toList();
	}
	if (entity.bookList != null) {
		data['BookList'] = entity.bookList.toJson();
	}
	return data;
}

bookDataBookFromJson(BookDataBook data, Map<String, dynamic> json) {
	if (json['Id'] != null) {
		data.id = json['Id']?.toInt();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Author'] != null) {
		data.author = json['Author']?.toString();
	}
	if (json['Img'] != null) {
		data.img = json['Img']?.toString();
	}
	if (json['Desc'] != null) {
		data.desc = json['Desc']?.toString();
	}
	if (json['CName'] != null) {
		data.cName = json['CName']?.toString();
	}
	if (json['Score'] != null) {
		data.score = json['Score']?.toString();
	}
	return data;
}

Map<String, dynamic> bookDataBookToJson(BookDataBook entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Id'] = entity.id;
	data['Name'] = entity.name;
	data['Author'] = entity.author;
	data['Img'] = entity.img;
	data['Desc'] = entity.desc;
	data['CName'] = entity.cName;
	data['Score'] = entity.score;
	return data;
}

bookDataCategoryFromJson(BookDataCategory data, Map<String, dynamic> json) {
	if (json['CategoryName'] != null) {
		data.categoryName = json['CategoryName']?.toString();
	}
	if (json['CategoryId'] != null) {
		data.categoryId = json['CategoryId']?.toInt();
	}
	return data;
}

Map<String, dynamic> bookDataCategoryToJson(BookDataCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['CategoryName'] = entity.categoryName;
	data['CategoryId'] = entity.categoryId;
	return data;
}

bookDataBookListFromJson(BookDataBookList data, Map<String, dynamic> json) {
	if (json['ImgUrl'] != null) {
		data.imgUrl = json['ImgUrl']?.toString();
	}
	if (json['ListId'] != null) {
		data.listId = json['ListId']?.toInt();
	}
	if (json['Title'] != null) {
		data.title = json['Title']?.toString();
	}
	if (json['Description'] != null) {
		data.description = json['Description']?.toString();
	}
	return data;
}

Map<String, dynamic> bookDataBookListToJson(BookDataBookList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ImgUrl'] = entity.imgUrl;
	data['ListId'] = entity.listId;
	data['Title'] = entity.title;
	data['Description'] = entity.description;
	return data;
}