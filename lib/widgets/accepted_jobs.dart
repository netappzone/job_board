import 'package:flutter/material.dart';

import 'package:job_board/data/models/jobs.dart';
import 'package:date_format/date_format.dart';

class AcceptedJobs extends StatelessWidget {
  final Jobs job;

  const AcceptedJobs({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height, _width, _fixedPadding;
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _fixedPadding = _height * 0.015;

    return Padding(
      padding: EdgeInsets.all(_fixedPadding),
      child: Material(
        elevation: 2.0,
        shadowColor: Colors.black,
        borderRadius:
            const BorderRadius.only(bottomRight: Radius.elliptical(30, 15)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                "Delivery of ${job.title!}",
                style: Theme.of(context).textTheme.subtitle1!.merge(
                    const TextStyle(
                        letterSpacing: 0.5, fontWeight: FontWeight.w500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Pick-up:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ' ${job.pickup!.addressLine1!},  ${job.pickup!.postCode!}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Drop-off:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    ' ${job.dropOff!.addressLine1!},  ${job.dropOff!.postCode!}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Expected delivery date:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    formatDate(
                        job.expectedDeliveryDate!, [dd, '/', mm, '/', yyyy]),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .merge(const TextStyle(fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
