import 'package:flutter/material.dart';
import 'package:renter_manager/models/renter.dart';
import 'package:renter_manager/pages/dashboard/components/navigation_card.dart';

class LastNotificationsList extends StatelessWidget {
  final List<Renter> renters;

  const LastNotificationsList({Key key, this.renters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: renters.length,
        itemBuilder: (context, index) {
          return NotificationCard(renter: renters[index]);
        },
      ),
    );
  }
}
