import 'package:flutter/material.dart';

import 'package:desafio_gen/data/repositories/mcu/repository.dart';

import 'package:desafio_gen/data/models/mcu_model.dart';

class McuController {
  late final McuRepository _mcuRepository;
  McuController(this._mcuRepository);

  ValueNotifier<McuModel?> list = ValueNotifier(null);
  ValueNotifier<String?> imageBackground = ValueNotifier(null);

  fetch() async {
    list.value = await _mcuRepository.getList();
  }
}
