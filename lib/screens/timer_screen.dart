import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import 'settings_screen.dart';

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
            title: const Text('Welcome to ojo!'),
            content: const Text(
              'ojo helps you take care of your eyes by reminding you to take breaks.\n\n'
              'Every 20 minutes, you\'ll get a 20-second break to look at something 20 feet away.\n\n'
              'This is known as the 20-20-20 rule and helps reduce eye strain.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<TimerProvider>().setFirstTimeComplete();
                  Navigator.of(context).pop();
                  _startTimer();
                },
                child: const Text('Let\'s get started!'),
              ),
            ],
          ),
        );
      } else {
        _startTimer();
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: timerProvider.state == TimerState.work || timerProvider.state == TimerState.workComplete
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsScreen()),
                  );
                },
              ),
            ],
          ),
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
                        minimumSize: const Size(200, 75),
                      ),
                      child: const Text('Start Work',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else if (timerProvider.state == TimerState.rest)
                    ElevatedButton(
                      onPressed: () => timerProvider.startWork(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        minimumSize: const Size(200, 75),
                      ),
                      child: const Text('Start Work Now',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else if (timerProvider.state == TimerState.workComplete)
                    ElevatedButton(
                      onPressed: () => timerProvider.startRest(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                        minimumSize: const Size(200, 75),
                      ),
                      child: const Text('Start Break',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else if (timerProvider.state == TimerState.work)
                    ElevatedButton(
                      onPressed: () => timerProvider.startRest(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                        foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                        minimumSize: const Size(200, 75),
                      ),
                      child: const Text('Start Break Now',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
        return 'Look at something\n 20 feet away';
      case TimerState.ready:
        return 'Ready to work again?';
    }
  }
}
