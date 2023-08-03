import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadlines() async {
    Response response = await get(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=5aa421f73d3342fba2f842b66a0f1d17');
    // print(response.body);
    List data = response.body['articles'];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
  }

  Future<List<NewsModel>> getNewsCategory({required String category}) async {
    Response response = await get(
        'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=5aa421f73d3342fba2f842b66a0f1d17');
    // print(response.body);
    List data = response.body['articles'];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
  }
}
