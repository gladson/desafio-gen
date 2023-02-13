import 'package:desafio_gen/data/models/mcu_model.dart';

abstract class McuInterface {
  Future<McuModel> getList();
}
