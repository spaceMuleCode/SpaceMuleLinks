import 'package:bouncy_widget/bouncy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linktreeclone/rows/github_row.dart';
import 'package:linktreeclone/rows/isntagramrow.dart';
import 'package:linktreeclone/rows/linkedin_row.dart';
import 'package:linktreeclone/rows/twitter_row.dart';
import 'package:linktreeclone/rows/web_row.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected = false;
  final String assetName = 'assets/mule.svg';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
        color:
            // color with hex 389BEEFF
            const Color(0xFF389BEE),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetName,
            height: 100,
            width: 100,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Want your Own? Open Source',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  onPressed: () {},
                  child: const Text(
                    ' Here',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          TwitterRow(
            selected: selected,
            icon: const FaIcon(FontAwesomeIcons.twitter),
            onTap: () async {
              final _url = Uri.parse('https://twitter.com/spacemulecode');
              if (await canLaunchUrl(_url)) {
                await launchUrl(_url);
              } else {
                throw 'Could not launch $_url';
              }
            },
          ),
          SizedBox(
            height: 1,
          ),
          InstagramInfoRow(
            selected: selected,
            icon: const FaIcon(FontAwesomeIcons.instagram),
            onTap: () async {
              final _url = Uri.parse('https://instagram.com/spacemulecode');
              if (await canLaunchUrl(_url)) {
                await launchUrl(_url);
              } else {
                throw 'Could not launch $_url';
              }
            },
          ),
          SizedBox(
            height: 1,
          ),
          LinkedInRow(
            selected: selected,
            icon: const FaIcon(FontAwesomeIcons.linkedinIn),
            onTap: () async {
              final _url =
                  Uri.parse('https://www.linkedin.com/in/smithzacharyb/');
              if (await canLaunchUrl(_url)) {
                await launchUrl(_url);
              } else {
                throw 'Could not launch $_url';
              }
            },
          ),
          SizedBox(
            height: 1,
          ),
          GitHubRow(
            selected: selected,
            icon: const FaIcon(FontAwesomeIcons.githubAlt),
            onTap: () async {
              final _url = Uri.parse('https://www.github.com/smithzachary/');
              if (await canLaunchUrl(_url)) {
                await launchUrl(_url);
              } else {
                throw 'Could not launch $_url';
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Made With Love By ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
              SizedBox(
                height: 4,
              ),
              Bouncy(
                duration: Duration(milliseconds: 2000),
                lift: 5,
                ratio: 0.5,
                pause: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color:
                        // color with hex 389BEEFF
                        Colors.white,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(2),
                        minimumSize: Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerLeft),
                    onPressed: () async {
                      final _url = Uri.parse('https://www.spacemulecode.com');
                      if (await canLaunchUrl(_url)) {
                        await launchUrl(_url);
                      } else {
                        throw 'Could not launch $_url';
                      }
                    },
                    child: const Text(
                      'SpaceMuleCode',
                      style: TextStyle(
                          color: Color(0xFF389BEE),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
