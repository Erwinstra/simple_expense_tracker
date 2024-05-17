import 'package:flutter/material.dart';
import 'package:simple_expense_tracker_app/components/transaction_tile.dart';

class Transactions extends StatelessWidget {
  final dynamic transactionList;

  const Transactions({
    super.key,
    required this.transactionList,
  });

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: ListView.builder(
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          return TransactionTile(
            transactionName: transactionList[index][0],
            money: transactionList[index][1],
            expenseOrIncome: transactionList[index][2],
          );
        },
      ),
    );
  }
}
