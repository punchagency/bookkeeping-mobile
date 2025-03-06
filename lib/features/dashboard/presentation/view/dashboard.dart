import 'package:flutter/material.dart';
import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final double _currentBalance = 5000.0;
  final double _totalIncome = 7500.0;
  final double _totalExpenses = 2500.0;

  final List<Map<String, dynamic>> _recentTransactions = [
    {
      'title': 'Groceries',
      'amount': -150.0,
      'date': '2023-10-01',
      'category': 'Food',
    },
    {
      'title': 'Salary',
      'amount': 3000.0,
      'date': '2023-10-01',
      'category': 'Income',
    },
    {
      'title': 'Rent',
      'amount': -1000.0,
      'date': '2023-10-02',
      'category': 'Housing',
    },
    {
      'title': 'Freelance Work',
      'amount': 500.0,
      'date': '2023-10-03',
      'category': 'Income',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBkWhite,
      appBar: AppBar(
        title: Text(
          'BookKeeping App',
          style: AppTextStyle.h1.copyWith(
            color: AppColors.appBkWhite,
          ),
        ),
        backgroundColor: AppColors.appBkGrey800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: AppTextStyle.h2.copyWith(
                color: AppColors.appBkGrey800,
              ),
            ),
            10.toColumnSpace(),
            Text(
              'Here’s an overview of your finances.',
              style: AppTextStyle.b3.copyWith(
                color: AppColors.appBkGrey600,
              ),
            ),
            const SizedBox(height: 40),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: AppColors.appBkWhite,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Current Balance',
                      style: AppTextStyle.b2.copyWith(
                        color: AppColors.appBkGrey800,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${_currentBalance.toStringAsFixed(2)}',
                      style: AppTextStyle.h1.copyWith(
                        color: AppColors.appBkGrey800,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildBalanceItem('Total Income', _totalIncome, true),
                        _buildBalanceItem(
                            'Total Expenses', _totalExpenses, false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Recent Transactions',
              style: AppTextStyle.h3.copyWith(
                color: AppColors.appBkGrey800,
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _recentTransactions.length,
              itemBuilder: (context, index) {
                final transaction = _recentTransactions[index];
                return _buildTransactionItem(transaction);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.appBkGrey800,
        child: const Icon(
          Icons.mic,
          color: AppColors.appBkWhite,
        ),
      ),
    );
  }

  Widget _buildBalanceItem(String title, double amount, bool isIncome) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.b3.copyWith(
            color: AppColors.appBkGrey600,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: AppTextStyle.b1.copyWith(
            color: AppColors.appBkGrey800,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(Map<String, dynamic> transaction) {
    final isIncome = transaction['amount'] > 0;
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: AppColors.appBkWhite,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Icon(
          isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: AppColors.appBkGrey800,
        ),
        title: Text(
          transaction['title'],
          style: AppTextStyle.b2.copyWith(
            color: AppColors.appBkGrey800,
          ),
        ),
        subtitle: Text(
          '${transaction['date']} • ${transaction['category']}',
          style: AppTextStyle.b3.copyWith(
            color: AppColors.appBkGrey600,
          ),
        ),
        trailing: Text(
          '\$${transaction['amount'].toStringAsFixed(2)}',
          style: AppTextStyle.b2.copyWith(
            color: AppColors.appBkGrey800,
          ),
        ),
      ),
    );
  }
}
