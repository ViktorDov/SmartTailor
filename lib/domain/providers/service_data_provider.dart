import 'package:hive/hive.dart';
import 'package:smart_tailor/core/constants/app_constants.dart';

import '../entity/order_type_card.dart';

class ServiceDataProvider {
  static const String _serviceBox = 'serviceBox';
  static const String _key = 'serviceOrderTypeListkey';
  final List<OrderTypeCard> _deffoltServices = AppConstants.serviceTypeList;

  Future<List<OrderTypeCard>> getService() async {
    final box = await Hive.openBox(_serviceBox);
    return box.get(_key, defaultValue: _deffoltServices)!;
  }

  // fun for change list of orderType
  Future<void> upgradeService(OrderTypeCard service) async {
    final box = await Hive.openBox(_serviceBox);
    final current = box.get(_key, defaultValue: _deffoltServices)!;
    if (!current.contains(service)) {
      current.add(service);
      await box.put(_key, current);
    } else {
      // todo exeptions
    }
  }

  Future<void> closeBox() async {
    await Hive.close();
  }
}
