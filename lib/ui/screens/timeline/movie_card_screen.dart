import 'dart:ui';

import 'package:desafio_gen/ui/components/click_here_component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:desafio_gen/data/models/vote_chart_model.dart';
import 'package:desafio_gen/data/models/mcu_model.dart';
import 'package:desafio_gen/utils/constants.dart';

class MovieCard extends StatelessWidget {
  final McuModel list;
  final int index;
  const MovieCard({
    super.key,
    required this.list,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    String posterPath = list.mcu?[index].posterPath ?? "";
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.29,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage("$envBaseURLImageBackground$posterPath"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: SfCircularChart(
                          margin: EdgeInsets.zero,
                          series: <CircularSeries>[
                            DoughnutSeries<VoteChartModel, String>(
                              pointColorMapper: (VoteChartModel vote, _) =>
                                  vote.color,
                              dataSource: [
                                VoteChartModel(
                                  voteAverage: "",
                                  // list.mcu![index].voteCount.toString(),
                                  voteCount:
                                      (((list.mcu![index].voteAverage! * 10) /
                                                  100) *
                                              list.mcu![index].voteCount!)
                                          .round()
                                          .toInt(),
                                  color: const Color.fromRGBO(210, 213, 49, 1),
                                ),
                                VoteChartModel(
                                  voteAverage: "",
                                  voteCount: list.mcu![index].voteCount! -
                                      (((list.mcu![index].voteAverage! * 10) /
                                                  100) *
                                              list.mcu![index].voteCount!)
                                          .round(),
                                  color: Colors.transparent,
                                )
                              ],
                              xValueMapper: (VoteChartModel data, _) =>
                                  data.voteAverage,
                              yValueMapper: (VoteChartModel data, _) =>
                                  data.voteCount,
                              innerRadius: '90%',
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: false,
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.02,
                        right: 9,
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              (list.mcu![index].voteAverage! * 10)
                                  .round()
                                  .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 50,
                              ),
                            ),
                            Text(
                              "%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 70,
                                fontFeatures: const [
                                  FontFeature.superscripts(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.4,
              ),
              child: Text(
                list.mcu![index].title.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.4,
                ),
                child: Text(
                  DateFormat("d 'de' MMMM 'de' y", 'pt_Br').format(
                    DateTime.parse(
                      list.mcu![index].releaseDate.toString(),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: index == 1,
          child: Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.27,
            child: const ClickHereWidget(width: 65),
          ),
        )
      ],
    );
  }
}
