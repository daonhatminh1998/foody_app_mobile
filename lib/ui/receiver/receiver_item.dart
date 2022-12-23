import 'package:flutter/material.dart';
import 'package:foody_app/model/receiver/receiver.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';

class ReceiverItem extends StatefulWidget {
  final Receiver receiver;
  final Function(Receiver receiver) onClick;
  final Function(Receiver receiver) onTap;

  const ReceiverItem({
    super.key,
    required this.receiver,
    required this.onClick,
    required this.onTap,
  });
  @override
  State<ReceiverItem> createState() => _ReceiverItemState();
}

class _ReceiverItemState extends State<ReceiverItem> {
  ReceiverViewModel model = ReceiverViewModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          color: const Color.fromRGBO(60, 184, 21, 1),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              // height: MediaQuery.of(context).size.height * 0.125,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: widget.receiver.fullName,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                    text: '\n',
                                  ),
                                  TextSpan(
                                      text: widget.receiver.phone,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: widget.receiver.address,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold))
                                ]),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        widget.receiver.is_Default.toString() ==
                                                "1"
                                            ? "Default"
                                            : "",
                                  )
                                ]),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              widget.onTap(widget.receiver);
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Color.fromRGBO(246, 80, 5, 1),
                            )),
                      ]),
                ],
              ),
            ),
          )),
      onTap: () => widget.onClick(widget.receiver),
      // onTap: () {
      //   print("tapped ${widget.receiver.toJson()}");
      // },
    );
  }
}
