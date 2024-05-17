import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopCard extends StatelessWidget {
  final num balance;
  final num income;
  final num expense;

  const TopCard({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  static String convertToIdr(dynamic number) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: 0,
    );
    return currencyFormatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var fontStyle = const TextStyle(
      fontSize: 11,
    );

    return Container(
      alignment: Alignment.center,
      width: size.width * 0.9,
      height: size.height * 0.27,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: const Offset(5, 10),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFFD8D9DA), Color(0xFF61677A)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('B A L A N C E'),
          Text(
            'Rp ${convertToIdr(balance)}',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.green,
                        size: size.width * 0.05,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Income',
                        style: fontStyle,
                      ),
                      Text('Rp ${convertToIdr(income)}', style: fontStyle),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Icon(
                        Icons.arrow_downward,
                        color: Colors.red,
                        size: size.width * 0.05,
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expenses', style: fontStyle),
                      Text('Rp ${convertToIdr(expense)}', style: fontStyle),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
