import '../../domain/entity/order_type_card.dart';

class AppConstants {
  static const serviceTypeList = <OrderTypeCard>[
    OrderTypeCard(
      name: "Усунення дірки / латання",
      description: "Зашивання або латання пошкоджених ділянок тканини.",
    ),
    OrderTypeCard(
      name: "Встановлення блискавки",
      description: "Пришивання нової блискавки у виріб.",
    ),
    OrderTypeCard(
      name: "Заміна блискавки",
      description: "Демонтаж старої та пришивання нової блискавки.",
    ),
    OrderTypeCard(
      name: "Підрубка низу",
      description: "Вкорочення низу штанів, спідниць, суконь тощо.",
    ),
    OrderTypeCard(
      name: "Вкорочення довжини",
      description: "Регулювання довжини рукавів або штанів.",
    ),
    OrderTypeCard(
      name: "Подовження виробу",
      description: "Додавання довжини за рахунок вставок або матеріалу.",
    ),
    OrderTypeCard(
      name: "Ремонт або встановлення кишень",
      description: "Ремонт або додавання нових кишень.",
    ),
    OrderTypeCard(
      name: "Ушивання виробу",
      description: "Зменшення об’єму одягу для кращої посадки по фігурі.",
    ),
    OrderTypeCard(
      name: "Розширення виробу",
      description: "Збільшення об’єму або ширини одягу.",
    ),
    OrderTypeCard(
      name: "Заміна підкладки",
      description: "Оновлення або встановлення нової підкладки.",
    ),
    OrderTypeCard(
      name: "Підгонка по фігурі",
      description: "Корекція виробу для ідеальної посадки.",
    ),
    OrderTypeCard(
      name: "Встановлення гудзиків / кнопок / клепок",
      description: "Пришивання або встановлення елементів застібки.",
    ),
    OrderTypeCard(
      name: "Заміна гудзиків",
      description: "Оновлення або пришивання нових гудзиків.",
    ),
    OrderTypeCard(
      name: "Встановлення люверсів",
      description: "Монтаж металевих отворів для шнурівки чи декору.",
    ),
    OrderTypeCard(
      name: "Заміна фурнітури",
      description: "Оновлення гачків, пряжок та інших деталей.",
    ),
    OrderTypeCard(
      name: "Ремонт швів",
      description: "Підсилення або повторне прошивання швів.",
    ),
    OrderTypeCard(
      name: "Перешивання старого одягу",
      description: "Оновлення або зміна крою існуючого виробу.",
    ),
    OrderTypeCard(
      name: "Реставрація одягу",
      description: "Відновлення вигляду або структури старого виробу.",
    ),
    OrderTypeCard(
      name: "Індивідуальне пошиття",
      description: "Пошиття виробу на замовлення за мірками клієнта.",
    ),
    OrderTypeCard(
      name: "Прасування / відпарювання",
      description: "Надання виробу охайного вигляду після шиття.",
    ),
  ];
}
