import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testapp/src/data/models/trip_model.dart';


import '../../../core/error/exception.dart';
import '../../../core/utils/consts.dart';

abstract class TripRemoteDataSource {
  Future<List<TripModel>> getTrips({
    String departureCity = 'Москва',
    String destinationCity = 'Уфа',
    String? date
  });
}

class TripRemoteDataSourceImpl extends TripRemoteDataSource {
  final http.Client client;

  TripRemoteDataSourceImpl({
    required this.client
  });

  @override
  Future<List<TripModel>> getTrips({
    String departureCity = 'Москва',
    String destinationCity = 'Уфа',
    String? date = '2024-02-20'
  }) async {
    print('$apiUrl/search_trips_cities/?departure_city=$departureCity&destination_city=$destinationCity&${date != null ? 'date='+date : ''}');
    final response = await client.get(
      Uri.parse('$apiUrl/search_trips_cities/?departure_city=$departureCity&destination_city=$destinationCity&${date != null ? 'date='+date : ''}'),
    );
    if (response.statusCode == 200) {
      final result = json.decode(response.body)['trips'];
      return (result as List)
          .map((item) => TripModel.fromJson(item))
          .toList();
    }else if(response.statusCode == 401){
      throw LoginException();
    }else {
      throw ServerException();
    }
  }

  _setHeaders(String token) => {
    HttpHeaders.authorizationHeader: 'Bearer $token'
  };

}
