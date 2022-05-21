import 'package:email_gestos/model/email.dart';
import 'package:email_gestos/screens/body_screen.dart';
import 'package:flutter/material.dart';

class ItemEmail extends StatefulWidget {
  Email email;
  ItemEmail({required this.email, Key? key}) : super(key: key);

  @override
  State<ItemEmail> createState() => _ItemEmailState();
}

class _ItemEmailState extends State<ItemEmail> {
  bool _leido = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      //color: leido ? Colors.white : Colors.blue,
      child: Card(
        color: _leido ? Colors.white : Colors.grey[350],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white60, width: 1),
                        borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () async{
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BodyScreen(email: widget.email),
                ));
            setState(() {
              _leido = true;
            });
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Icon(
                  _leido ? Icons.mark_email_read: Icons.mail,
                  size: 20
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          widget.email.dateTime.toString(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                        ),     
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          widget.email.from,
                          style: _leido ? TextStyle(fontSize: 20,) : TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          widget.email.subject,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
