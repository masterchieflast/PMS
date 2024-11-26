import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../Common/CustomButton.dart';


class BatteryInfoBlock extends StatelessWidget{

  static const platform = MethodChannel('com.example.lab4_5/channel');

  Future<String> _getBatteryLevel() async {
    try {
      final int batteryLevel = await platform.invokeMethod('getBatteryLevel');
      return 'Уровень заряда батареи: $batteryLevel%';
    } on PlatformException catch (e) {
      return "Не удалось получить уровень заряда батареи: '${e.message}'.";
    }
  }

  Future<String> _isCharging() async {
    try {
      final bool batteryState = await platform.invokeMethod('isCharging');
      if (batteryState){
        return 'Сейчас устройство заряжается';
      }
      else{
        return 'Устройство НЕ заряжается';
      }
    } on PlatformException catch (e) {
      return "Не удалось получить статус батареи: '${e.message}'.";
    }
  }


  Future<String> _sendSMS(String phoneNumber, String message) async {
    try {
      final String result = await platform.invokeMethod('sendSMS', {
        'phoneNumber': phoneNumber,
        'message': message,
      });
      return 'Сообщение отправлено: $result%';
    } on PlatformException catch (e) {
      return 'Ошибка: ${e.message}';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          CustomButton(
            icon: Icons.battery_3_bar,
            backgroundColor: Colors.orange,
            iconColor: Colors.white,
            iconSize: 32,
            onPressed: () async {
              try {
                String batteryLevel = await _getBatteryLevel();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Уровень заряда батареи'),
                    content: Text(batteryLevel),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Ошибка'),
                    content: Text('Не удалось получить данные о батарее: $e'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),


          CustomButton(
            icon: Icons.battery_charging_full_outlined,
            backgroundColor: Colors.lightGreen,
            iconColor: Colors.white,
            iconSize: 32,
            onPressed: () async {
              try {
                String batteryLevel = await _isCharging();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Статус батареи'),
                    content: Text(batteryLevel),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Ошибка'),
                    content: Text('Не удалось получить данные о батарее: $e'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),


          CustomButton(
            icon: Icons.mail_outline,
            backgroundColor: Colors.deepPurple,
            iconColor: Colors.white,
            iconSize: 32,
            onPressed: () async {
              try {
                String batteryLevel = await _sendSMS('+375298467707', 'Тест');
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Отправка сообщения'),
                    content: Text(batteryLevel),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Ошибка'),
                    content: Text('Не удалось отправить сообщение: $e'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),

        ],
      ),
    );
  }
}