import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pay_tracker/constants/app_constants.dart';
import 'package:pay_tracker/constants/image_constants.dart';
import 'package:pay_tracker/screens/card_settings/card_settings.dart';
import 'package:pay_tracker/screens/message_list/payment_card_content.dart';
import 'package:pay_tracker/screens/transactions_list/transactions_list_content.dart';
import 'package:pay_tracker/types/displayed_sms.dart';
import 'package:pay_tracker/utilities/shared/shared_utilities.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    required this.availableAmount,
    required this.balanceType,
    required this.cardImageUri,
    required this.cardMessages,
    required this.cardNumber,
    required this.cardSpent,
    required this.cardType,
    required this.currencyName,
    required this.heroTag,
    required this.totalAmountSpent,
    required this.totalNumberOfTransactions,
    required this.totalTransactions,
    super.key,
  });
  final double totalAmountSpent;
  final int totalNumberOfTransactions;
  final List<DisplayedSms> cardMessages;
  final String availableAmount;
  final String balanceType;
  final String cardImageUri;
  final String cardNumber;
  final String cardSpent;
  final String cardType;
  final String currencyName;
  final String heroTag;
  final String totalTransactions;

  @override
  Widget build(BuildContext context) {
    String themeModeIdentifier =
        (Theme.of(context).brightness == Brightness.dark) ? '_dark' : '_light';

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).colorScheme.background, // Navigation bar
        ),
        title: const Text(appTitleTransactionsList),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardSettings(
                    cardType: cardType,
                    currencyName: currencyName,
                    cardNumber: cardNumber,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Hero(
              tag: heroTag,
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        '$cardImageUri$themeModeIdentifier$cardCoverFileType',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: PaymentCardContent(
                    availableAmount: availableAmount,
                    balanceType: balanceType,
                    cardNumber: cardNumber,
                    cardSpent: cardSpent,
                    cardType: cardType,
                    openedView: true,
                    totalAmountSpent: totalAmountSpent,
                    totalNumberOfTransactions: totalNumberOfTransactions,
                    totalTransactions: totalTransactions,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${cardMessages[0].weekday}, ${cardMessages[0].day} ${cardMessages[0].month} ${cardMessages[0].year}',
          ),
          const SizedBox(height: 12),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: cardMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return TransactionsListContent(
                  cardMessage: cardMessages[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
