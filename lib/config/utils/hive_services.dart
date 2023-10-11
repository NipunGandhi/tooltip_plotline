import 'package:hive/hive.dart';
import 'package:tooltip_plotline/config/model/tooltip_model.dart';

class LocalStorage {
  late Box list;

  fetch() async {
    await init();
    var map = await list.get("object");
    print(map);
    return map;
  }

  Future<void> init() async {
    list = await Hive.openBox("plotline");
  }

  store(Map<String, CustomToolTipParams> map) async {
    await init();
    await list.put("object", map);
  }
}
