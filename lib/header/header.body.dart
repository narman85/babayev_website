import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:babayev_website/util/hover_extension.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Nariman Babayev',
          style: GoogleFonts.montserrat(
            fontSize: 100,
            color: Colors.white,
            fontWeight: FontWeight.w100,
          ),
          maxLines: 1,
        ),
        AutoSizeText(
          'Software Developer',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 37),
        AutoSizeText(
          'I have 1 year of experience in mobile and web development in building beautiful apps',
          style: GoogleFonts.montserrat(
            fontSize: 25,
            color: Colors.purple,
            fontWeight: FontWeight.w200,
          ),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ?? false ? 20 : 40),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.purple,
            ),
            child: TextButton(
              onPressed: () => launch(
                  "mailto:babayev1994@gmail.com?subject=News&body=New%20plugin"),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: isMobile ?? false ? 10 : 17,
                  horizontal: isMobile ?? false ? 8 : 15,
                ),
                child: Text(
                  'Contact Me',
                  style: TextStyle(
                    fontSize: isMobile ?? false ? 20 : 24,
                    color: Colors.white,
                  ),
                ),
              ),
            )).moveUpOnHover,
      ],
    );
  }
}
