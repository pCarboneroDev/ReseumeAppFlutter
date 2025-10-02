import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactPage extends StatelessWidget {

  final List<ContactModel> contactList = [
    ContactModel(
      contactName: "Gmail", 
      contactDesc: "pcarboneroalmellones@gmail.com",
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/maillogo.png',
      targetUrl: "mailto:pcarboneroalmellones@gmail.com"
    ),
    ContactModel(
      contactName: "GitHub", 
      contactDesc: 'View my GitHub account',
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/gitlogo.png',
      targetUrl: 'https://github.com/pCarboneroDev?tab=repositories'
    ),
    ContactModel(
      contactName: "LinkedIn", 
      contactDesc: 'View my LinkedIn profile',
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/lnlogo.png',
      targetUrl: 'https://www.linkedin.com/in/pablo-carbonero-almellones-2b63a422b'
    ),
    ContactModel(
      contactName: "Tlfn number", 
      contactDesc: 'Call me or send me a message!',
      imageUrl: 'https://pcarbonerodev.github.io/Carbonero-WebPortfolio/assets/images/lnlogo.png',
      targetUrl: 'tel:+34667291647'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contactTitle)
      ),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: _ContactCard(contact: contactList[index],),
          );
        },
      )
   );
  }
}

class _ContactCard extends StatelessWidget {
  final ContactModel contact;

  const _ContactCard({
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
          color: ColorScheme.of(context).secondary,
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