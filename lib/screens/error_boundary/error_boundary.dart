import 'package:flutter/material.dart';
import 'package:pay_tracker/constants/screen_display_text_constants.dart';

class ErrorBoundary extends StatelessWidget {
  const ErrorBoundary({super.key, required this.exception});
  final Exception exception;

  @override
  Widget build(BuildContext context) {
    String errorText = '$errorBoundaryText\n\n${exception.toString()}';
    return Container(
      constraints: const BoxConstraints.expand(),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 18,
            ),
            SingleChildScrollView(
              child: Text(
                errorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
