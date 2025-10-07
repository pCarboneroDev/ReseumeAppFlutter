import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/l10n/app_localizations.dart';
import 'package:resume_app/presentation/contact/bloc/contact_bloc.dart';
import 'package:resume_app/utils/ui_state.dart';
import 'package:url_launcher/url_launcher.dart';


class ContactPage extends StatefulWidget {

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with TickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<ContactBloc>(context).add(LoadContactEvent(Localizations.localeOf(context).languageCode));
  }

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
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(
          options: ParticleOptions(
            spawnMinSpeed: 5,
            spawnMaxSpeed: 20,
            spawnMaxRadius: 50,
            spawnMinRadius: 10,
            baseColor: ColorScheme.of(context).primary,
            particleCount: 20
          )
        ),

        child: BlocBuilder<ContactBloc, ContactState>(
          builder: (context, state) {
            final status = <UIStatus, Widget>{
              UIStatus.error: Center(child: Text("ERROR")),
              UIStatus.idle: Center(child: Text("IDLE")),
              UIStatus.loading: Center(child: CircularProgressIndicator.adaptive()),
              UIStatus.success: ListView.builder(
                itemCount: state.contactList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _ContactCard(contact: state.contactList[index],),
                  );
                },
              )
            };
            return status[state.uiState.status] ?? Container();
          },
        )
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