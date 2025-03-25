import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ojo_app/screens/timer_screen.dart';
import 'package:ojo_app/providers/timer_provider.dart';
import 'package:rive/rive.dart' as rive;
import 'settings_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  rive.RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = rive.SimpleAnimation('blink');
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer, 
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)],
          ),
        ),
        child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ojo', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                  const SizedBox(height: 20),
                  Text('take care of your eyes', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                  const SizedBox(height: 20),
                  Container(
                    width: 150,
                    height: 150,
                    child: rive.RiveAnimation.asset(
                      'assets/eyeBlink.riv',
                      fit: BoxFit.cover,
                      controllers: [_controller!],
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                      minimumSize: const Size(200, 75),
                    ),
                    child: Text('Start', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primaryContainer),),
                    onPressed: () {
                      context.read<TimerProvider>().startWork();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TimerScreen()),
                      );
                    },
                  ),
                ],
                ),
            )),
      ));
  }
}
