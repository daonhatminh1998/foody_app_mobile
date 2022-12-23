// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:foody_app/components/background-image.dart';
import 'package:foody_app/ui/order/order_screen.dart';
import 'package:foody_app/ui/receiver/receiver_item.dart';
import 'package:foody_app/ui/receiver/receiver_new_screen.dart';
import 'package:foody_app/ui/receiver/receiver_update_screen.dart';
import 'package:foody_app/ui/receiver/receiver_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ReceiverScreen extends StatefulWidget {
  const ReceiverScreen({super.key, this.index});
  final index;

  @override
  State<ReceiverScreen> createState() => _ReceiverScreenState();
}

class _ReceiverScreenState extends State<ReceiverScreen> {
  final _receiverViewModel = ReceiverViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/carousel-2.jpg'),
        ScopedModel(
          model: _receiverViewModel,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(title: const Text("My Receiver")),
            body: _listReceiver(),
          ),
        ),
      ],
    );
  }

  Widget _listReceiver() => ScopedModelDescendant<ReceiverViewModel>(builder:
          (BuildContext context, Widget? child, ReceiverViewModel model) {
        _receiverViewModel.updateList();
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: model.receivers.length,
                      itemBuilder: (context, index) {
                        return ReceiverItem(
                          receiver: model.receivers[index],
                          onTap: (receiver) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UpdateReceiver(receiver: receiver),
                            ),
                          ),
                          onClick: (receiver) => {
                            if (widget.index == 1)
                              {
                                model.select(model.receivers[index]),
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const OrderScreen()),
                                ),
                              }
                            else
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateReceiver(receiver: receiver),
                                  ),
                                ),
                              }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              child: Card(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            color: Colors.amber,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add More',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewReceiver()));
              },
            ),
          ],
        );
      });
}
