import 'package:hive/hive.dart';
import 'package:smart_tailor/core/constants/app_constants.dart';

class ServiceDataProvider {
  static const String _serviceBox = 'serviceBox';
  static const String _orderTypeBox = 'orderType';
  static const String _key = 'serviceOrderTypeListkey';
  final List<String> _deffoltServices = AppConstants.serviceTypeList;

  Future<List<String>> get() async {
    final box = await Hive.openBox(_serviceBox);
    return box.get(_key, defaultValue: _deffoltServices)!;
  }

  Future<void> put(String service) async {
    final box = await Hive.openBox(_serviceBox);
    final current = box.get(_key, defaultValue: _deffoltServices)!;
    if (!current.contains(service)) {
      current.add(service);
      await box.put(_key, current);
    } else {
      // todo exeptions
    }
  }

  Future<void> saveOrderType(List<String> orderType) async {
    final box = await Hive.openBox(_orderTypeBox);
    await box.clear();
    await box.put(_key, orderType);
    closeBox();
  }

  Future<List<String>> getOrderType() async {
    final box = await Hive.openBox(_orderTypeBox);
    return box.get(_orderTypeBox);
  }

  Future<void> clear() async {
    final box = await Hive.openBox(_serviceBox);
    await box.clear();
    closeBox();
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}
