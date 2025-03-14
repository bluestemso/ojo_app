import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _showFirstTimeModal();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      context.read<TimerProvider>().tick();
    });
  }

  void _showFirstTimeModal() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<TimerProvider>().isFirstTime) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Welcome to Ojo!'),
            content: const Text(
              'Ojo helps you take care of your eyes by reminding you to take breaks. '
              'Every 20 minutes, you\'ll get a 20-second break to look at something 20 feet away. '
              'This is known as the 20-20-20 rule and helps reduce eye strain.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<TimerProvider>().setFirstTimeComplete();
                  Navigator.of(context).pop();
                },
                child: const Text('Let\'s get started!'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return Scaffold(
          backgroundColor: timerProvider.state == TimerState.work || timerProvider.state == TimerState.workComplete
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timerProvider.displayTime,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: timerProvider.state == TimerState.work || timerProvider.state == TimerState.workComplete
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _getStatusText(timerProvider.state),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: timerProvider.state == TimerState.work || timerProvider.state == TimerState.workComplete
                              ? Theme.of(context).colorScheme.onPrimaryContainer
                              : Theme.of(context).colorScheme.onSecondaryContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  if (timerProvider.state == TimerState.ready)
                    ElevatedButton(
                      onPressed: () => timerProvider.startWork(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: const Text('Start Work'),
                    )
                  else if (timerProvider.state == TimerState.rest)
                    ElevatedButton(
                      onPressed: () => timerProvider.startWork(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                      child: const Text('Start Work Now'),
                    )
                  else if (timerProvider.state == TimerState.workComplete)
                    ElevatedButton(
                      onPressed: () => timerProvider.startRest(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: const Text('Start Break'),
                    )
                  else if (timerProvider.state == TimerState.work)
                    ElevatedButton(
                      onPressed: () => timerProvider.startRest(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                      ),
                      child: const Text('Start Break Now'),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _getStatusText(TimerState state) {
    switch (state) {
      case TimerState.work:
        return 'Time to focus';
      case TimerState.workComplete:
        return 'Time for a break!';
      case TimerState.rest:
        return 'Look at something 20 feet away';
      case TimerState.ready:
        return 'Ready to work again?';
    }
  }
}
