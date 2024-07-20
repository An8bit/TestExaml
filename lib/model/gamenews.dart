class GameNews {
  int? id;
  String? title;
  String? shortDescription;
  String? thumbnail;
  String? mainImage;
  String? articleContent;
  String? articleUrl;

  GameNews(
      {this.id,
      this.title,
      this.shortDescription,
      this.thumbnail,
      this.mainImage,
      this.articleContent,
      this.articleUrl});

  GameNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    thumbnail = json['thumbnail'];
    mainImage = json['main_image'];
    articleContent = json['article_content'];
    articleUrl = json['article_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['thumbnail'] = this.thumbnail;
    data['main_image'] = this.mainImage;
    data['article_content'] = this.articleContent;
    data['article_url'] = this.articleUrl;
    return data;
  }
}