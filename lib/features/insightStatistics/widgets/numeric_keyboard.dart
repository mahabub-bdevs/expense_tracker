import 'package:flutter/material.dart';

class NumericKeyboard extends StatelessWidget {
  final String value;
  final ValueChanged<String> onKeyTap;
  final VoidCallback onBackspace;

  const NumericKeyboard({
    super.key,
    required this.value,
    required this.onKeyTap,
    required this.onBackspace,
  });

  static const _keys = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['.', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(

        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _keys.map((row) {
          return Row(
            children: row.map((key) {
              return Expanded(
                child: _KeyButton(
                  label: key,
                  onTap: () {
                    if (key == '⌫') {
                      onBackspace();
                    } else {
                      onKeyTap(key);
                    }
                  },
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _KeyButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: Colors.white24,
      highlightColor: Colors.white12,
      child: Container(
        height: 64,
        alignment: Alignment.center,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
