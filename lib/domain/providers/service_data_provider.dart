import 'package:hive/hive.dart';
import 'package:smart_tailor/core/constants/app_constants.dart';

class ServiceDataProvider {
  static const String _boxName = 'serviceBox';
  static const String _key = 'serviceOrderTypeListkey';
  final List<String> _deffoltServices = AppConstants.serviceTypeList;

  Future<List<String>> get() async {
    final box = await Hive.openBox(_boxName);
    return box.get(_key, defaultValue: _deffoltServices)!;
  }

  Future<void> put(String service) async {
    final box = await Hive.openBox(_boxName);
    final current = box.get(_key, defaultValue: _deffoltServices)!;
    if (!current.contains(service)) {
      current.add(service);
      await box.put(_key, current);
    } else {
      // todo exeptions
    }
  }

  Future<void> clear() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
    closeBox();
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}
