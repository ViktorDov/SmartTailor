enum StepStatus {
  inactive,
  active,
  completed,
  error,
}

class StepProgressData {
  final String title;
  final String subTitle;
  final String? errorMasage;
  final StepStatus? status;
  StepProgressData({
    required this.title,
    required this.subTitle,
    this.errorMasage,
    this.status,
  });
}
