import 'package:flutter/material.dart';

import 'package:desafio_gen/data/models/mcu_model.dart';
import 'package:desafio_gen/data/controllers/timeline_controller.dart';
import 'package:desafio_gen/data/repositories/mcu/repository.dart';

import 'package:desafio_gen/ui/components/loading_component.dart';
import 'package:desafio_gen/ui/screens/timeline/movie_card_screen.dart';
import 'package:desafio_gen/utils/constants.dart';

class TimeLineMoviePage extends StatefulWidget {
  const TimeLineMoviePage({super.key, required this.title});
  final String title;

  @override
  State<TimeLineMoviePage> createState() => _TimeLineMoviePageState();
}

class _TimeLineMoviePageState extends State<TimeLineMoviePage> {
  final McuController _controllerMcu = McuController(
    McuRepository(),
  );

  @override
  void initState() {
    super.initState();
    _controllerMcu.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: _controllerMcu.imageBackground,
          builder: (context, imageBackground, child) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FadeInImage(
                    image: NetworkImage(
                      "$envBaseURLImageBackground${imageBackground ?? '/yFuKvT4Vm3sKHdFY4eG6I4ldAnn.jpg'}",
                      // scale: 0.9,
                    ),
                    placeholder: const AssetImage("assets/logo_icon.png"),
                    filterQuality: FilterQuality.high,
                  ).image,
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.dstOut,
                  ),
                ),
              ),
            );
          },
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Image.asset(
              "assets/logo_marvel_studios_header.png",
              fit: BoxFit.contain,
              height: 100.0,
              width: 100.0,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Spacer(
                  flex: 2,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 125,
                      width: 200,
                      child: Text(
                        "MARVEL CINEMATIC UNIVERSE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "LINHA DO TEMPO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ValueListenableBuilder<McuModel?>(
                          valueListenable: _controllerMcu.list,
                          builder: (_, list, __) {
                            if (list == null) {
                              return const Center(
                                child: LoadingWidget(),
                              );
                            }
                            return ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: list.mcu?.length,
                              itemBuilder: (_, index) {
                                // return Container();
                                return InkWell(
                                  child: MovieCard(
                                    list: list,
                                    index: index,
                                  ),
                                  onTap: () {
                                    _controllerMcu.imageBackground.value =
                                        list.mcu?[index].backdropPath;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
