import 'package:flutter/material.dart';

class BandeiraParaguay extends StatelessWidget {
  final double size;
  const BandeiraParaguay({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 15,
      backgroundImage: Image.asset(
        'icons/flags/png/py.png',
        package: 'country_icons',
      ).image,
    );
  }
}

class BandeiraBrasil extends StatelessWidget {
  final double size;
  const BandeiraBrasil({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 15,
      backgroundImage: Image.asset(
        'icons/flags/png/br.png',
        package: 'country_icons',
      ).image,
    );
  }
}

class BandeiraEEUU extends StatelessWidget {
  final double size;
  const BandeiraEEUU({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 15,
      backgroundImage: Image.asset(
        'icons/flags/png/us.png',
        package: 'country_icons',
      ).image,
    );
  }
}

class BandeiraArgentina extends StatelessWidget {
  final double size;
  const BandeiraArgentina({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size ?? 15,
      backgroundImage: Image.asset(
        'icons/flags/png/ar.png',
        package: 'country_icons',
      ).image,
    );
  }
}
