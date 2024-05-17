import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final String transactionName;
  final String money;
  final String expenseOrIncome;

  const TransactionTile({
    super.key,
    required this.transactionName,
    required this.money,
    required this.expenseOrIncome,
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
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5,
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: Text(transactionName),
          trailing: Text(
            '${expenseOrIncome == 'expense' ? '-' : '+'}Rp ${convertToIdr(int.parse(money))}',
            // 'Rp ${convertToIdr(balance)}'
            style: TextStyle(
              color: (expenseOrIncome == 'expense') ? Colors.red : Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
