import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;

  const ContactCard({
    super.key, 
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(contact.targetUrl);

        if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
          throw Exception('Could not launch $url');
        }
      },


      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: ColorScheme.of(context).primaryFixed,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorScheme.of(context).onSurface, width: 2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image(image: NetworkImage(contact.imageUrl)),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.contactName, style: TextStyle(color: ColorScheme.of(context).onSecondary, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(contact.contactDesc, style: TextStyle(color: ColorScheme.of(context).onSecondary))
                ],
              ),
              Spacer(),
              Icon(FontAwesomeIcons.arrowUpRightFromSquare)
            ],
          ),
        ),
      ),
    );
  }
}