import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signals/signals_flutter.dart';
import 'package:task/app/shared/extensions/context.dart';
import 'package:task/app/shared/router/router.dart';
import 'package:task/app/shared/signals/reservation.dart';
import 'package:task/app/shared/signals/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: kToolbarHeight),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            title: Text('Theme', style: context.textTheme.titleMedium),
            leading: const Icon(Icons.brightness_4),
            trailing: Watch.builder(
              builder: (context) {
                return Switch.adaptive(
                  value: themeSignal.value == ThemeMode.light,
                  onChanged: (val) => toggleTheme(),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      // show buttom sheet
                      const ReservationRoute().push(context);
                    },
                    child: const Text('Open Reservation'),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      final body = await reservations.future;
                      const channel = MethodChannel('native_channel');
                      final result = await channel.invokeMethod(
                        'showBottomSheet',
                        {'body': body.toString()},
                      );
                      log(result.toString());
                    },
                    child: const Text('Show IOS Ticket'),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async {
                      final body = await reservations.future;
                      const channel = MethodChannel('native_channel');
                      final result = await channel.invokeMethod(
                        'showBottomSheet',
                        {'body': body.toString()},
                      );
                      log(result.toString());
                    },
                    child: const Text('Show Android Ticket'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
