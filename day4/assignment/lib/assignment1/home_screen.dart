import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? x;
  int? y;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('사칙연산'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                hintText: 'x값을 입력하세요.',
                label: 'X의 값은?',
                onChanged: (val) {
                  x = val.isEmpty ? null : int.parse(val);
                  setState(() {});
                },
              ),
              CustomTextField(
                hintText: 'y값을 입력하세요.',
                label: 'Y의 값은?',
                onChanged: (val) {
                  y = val.isEmpty ? null : int.parse(val);
                  setState(() {});
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                title: '더하기의 결과값은?',
                x: x,
                y: y,
                calc: 'add',
              ),
              CustomButton(
                title: '곱하기의 결과값은?',
                x: x,
                y: y,
                calc: 'multiply',
              ),
              CustomButton(
                title: '빼기의 결과값은?',
                x: x,
                y: y,
                calc: 'subtract',
              ),
              CustomButton(
                title: '나누기의 결과값은?',
                x: x,
                y: y,
                calc: 'divide',
              ),
              // Text('x: $x, y: $y'),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final int? x;
  final int? y;
  final String calc;

  const CustomButton({
    required this.title,
    required this.x,
    required this.y,
    required this.calc,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: ElevatedButton(
        onPressed: () {
          String result;

          if (x == null || y == null) {
            result = '유효한 값이 아닙니다.';
          } else {
            if (calc == 'add') {
              result = add(x!, y!).toString();
            } else if (calc == 'multiply') {
              result = multiply(x!, y!).toString();
            } else if (calc == 'subtract') {
              result = subtract(x!, y!).toString();
            } else if (calc == 'divide') {
              result = divide(x!, y!).toString();
            } else {
              result = '계산할 수 없습니다.';
            }
          }

          showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                  child: Center(
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Text(title),
      ),
    );
  }

  int add(int x, int y) {
    return x + y;
  }

  int multiply(int x, int y) {
    return x * y;
  }

  int subtract(int x, int y) {
    return x - y;
  }

  divide(int x, int y) {
    if (y == 0) {
      return '0으로 나눌 수 없습니다.';
    }
    return x / y;
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    required this.hintText,
    required this.label,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        SizedBox(width: 32),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: TextField(
            onChanged: onChanged,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
