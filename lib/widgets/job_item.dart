import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:job_board/data/models/jobs.dart';

import 'package:flutter/material.dart';
import 'package:job_board/logic/app_cubit.dart';

class JobItem extends StatelessWidget {
  final Jobs job;
  final AppCubit cubit;

  const JobItem({Key? key, required this.job, required this.cubit})
      : super(key: key);

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
              height: _width * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        // width: _width * 2 / 10,
                        height: _height * 0.35 / 10,
                        child: ElevatedButton(
                          child: const Text(
                            'REJECT',
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.elliptical(20, 10))),
                          ),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Kindly hold the button for 5 seconds to reject the job !'),
                            backgroundColor: Colors.red,
                          )),
                          onLongPress: () => cubit.removeJobs(job),
                        ),
                      ),
                      SizedBox(
                        width: _width * 0.025,
                      ),
                      SizedBox(
                        height: _height * 0.35 / 10,
                        // width: _width * 2.7 / 10,
                        child: ElevatedButton(
                          child: const Text(
                            'ACCEPT',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.elliptical(20, 10))),
                          ),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                                'Kindly hold the button for 5 seconds to accept the job !'),
                            backgroundColor: Colors.red,
                          )),
                          onLongPress: () {
                            cubit.getAcceptedJobs(job);
                            Timer(const Duration(seconds: 2), () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Job Accepted 🎈🎈🎈'),
                                backgroundColor: Colors.blue,
                              ));
                            });
                          },
                        ),
                      )
                    ],
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
