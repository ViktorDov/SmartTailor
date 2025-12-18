import 'package:flutter/material.dart';
import 'package:smart_tailor/presentation/widgets/step_indicator/step_data.dart';

class StepProgressIndicator extends StatelessWidget {
  final int currentStepIndex;
  final List<StepProgressData> stepsData;
  final VoidCallback onPress;
  const StepProgressIndicator({
    super.key,
    required this.currentStepIndex,
    required this.stepsData,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        stepsData.length,
        (index) => _StepProgressItem(
          step: stepsData[index],
          isLast: index == stepsData.length - 1,
        ),
      ),
    );
  }
}

class _StepProgressItem extends StatelessWidget {
  final StepProgressData step;
  final bool isLast;
  const _StepProgressItem({
    required this.step,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [],
    );
  }
}
