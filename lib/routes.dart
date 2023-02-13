import 'package:flutter/material.dart';

import 'package:desafio_gen/utils/constants.dart';

import 'package:desafio_gen/ui/screens/timeline/page_screen.dart';

final Map<String, WidgetBuilder> routesList = {
  envRouteInitial: (context) => const TimeLineMoviePage(
        title: "MARVEL CINEMATIC UNIVERSE",
      ),
};
