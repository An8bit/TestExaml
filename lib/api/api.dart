import 'package:dio/dio.dart';
import 'package:testmobile/model/game.dart';
import 'package:testmobile/model/gamedetail.dart';
import 'package:testmobile/model/gamenews.dart';
import 'package:testmobile/model/product.dart';
import 'package:testmobile/model/student.dart';

abstract class Api {
   
 
  Future<List<Game>> getListGame();
  Future<GameDetail> getDetailGame(int id);
  Future<List<Game>> getPlatformGame(String platform);
  Future<List<GameNews>> getNewGame();
}