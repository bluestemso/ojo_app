import 'package:flutter/material.dart';
import 'package:ojo_app/screens/timer_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.visibility_rounded, size: 80, color: Theme.of(context).colorScheme.primary,),
                      Text('j', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                      Icon(Icons.visibility_rounded, size: 80, color: Theme.of(context).colorScheme.primary,),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('take care of your eyes', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      foregroundColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Text('Start', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.primaryContainer),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TimerScreen()),
                      );
                    },
                  )
                ],
                  ),
            )),
      ));
  }
}
