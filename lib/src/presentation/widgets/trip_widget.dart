

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testapp/src/domain/entities/trip_entity.dart';

class TripWidget extends StatelessWidget {
  final TripEntity tripEntity;

  const TripWidget({Key? key, required this.tripEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Card(
        elevation: 12,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        child: Icon(Icons.person, size: 40,),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text('${tripEntity.driver1 != null ? tripEntity.driver1 : tripEntity.driver2 != null ? tripEntity.driver2 : 'Не указан'}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text('${tripEntity.bus?.name}'),
                          const SizedBox(height: 20,)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/svg/vertical-s-line.svg'),
                      const SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text('Дистанция'),
                              const SizedBox(width: 10,),
                              Text('${tripEntity.distance} км'),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 140,
                            child: Text('${tripEntity.departure?.name}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                          Text('${tripEntity.depDate}'),
                          Text('${tripEntity.depTime}'),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 140,
                            child: Text('${tripEntity.destination?.name}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic
                              ),
                            ),
                          ),
                          Text('${tripEntity.arrDate}'),
                          Text('${tripEntity.arrTime}'),
                        ],
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 20),
                      //   child: Text('Автовокзал'),
                      // )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

