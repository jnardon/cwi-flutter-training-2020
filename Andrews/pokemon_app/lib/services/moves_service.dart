import 'package:dio/dio.dart';
import 'package:pokemon_app/enums/types_etension.dart';
import 'package:pokemon_app/models/move_model.dart';
import 'package:pokemon_app/services/base_service.dart';

class MovesService {
  final _baseUrl = BaseService().baseUrl;
  final _dio = Dio();

  Future<List<MoveModel>> getMoves() async {
    final Response response = await _dio.get('${_baseUrl}moves');
    final moves = response.data as List;

    return moves
        .map((move) => MoveModel(
              name: move['name'],
              learnLevel: move['learnLevel'],
              type: TypesExtension.parseToType(move['type']),
            ))
        .toList();
  }
}
