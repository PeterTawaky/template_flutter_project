class ApiConstants {
  // Notion API
  static final notion = _NotionApi();
  // Google Books API
  static final googleBooks = _GoogleBooksApi();
}

//! Notion API implementation
class _NotionApi {
  final String baseUrl = 'https://api.notion.com/v1';
  final keys = _NotionKeys();

  final endpoints = _NotionEndpoints();
}

class _NotionEndpoints {
  final String pages = '/pages';
  final String databases = '/databases';
  final String createPage = '/pages';
}

class _NotionKeys {
  String status = 'status';
  String code = 'code';
  String message = 'message';
  String source = 'source';
  String author = 'author';
  String title = 'title';
  String name = 'name';
  String urlToImage = 'urlToImage';
  String q = 'q';
  String apiKey = 'apiKey';
}

//! Google Books API implementation
class _GoogleBooksApi {
  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  final endpoints = _GoogleBookesEndpoints();
}

class _GoogleBookesEndpoints {
  final String volumes = 'volumes';
}
