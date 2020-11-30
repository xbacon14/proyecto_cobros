import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_page.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/widgets/card_parcelas_cobros_render.dart';

class ParcelaRender extends StatelessWidget {
  final ImportacaoExportacaoAppCobrancas appCobrancas;
  final CobroController cobroController;

  const ParcelaRender({Key key, this.appCobrancas, this.cobroController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Hero(
          tag: appCobrancas.idParcela,
          child: CardParcelasCobrosRender(appCobrancas: appCobrancas)),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Cobrar',
          color: Colors.grey,
          icon: Icons.attach_money,
          foregroundColor: Colors.white,
          onTap: () {
            FocusScope.of(context).unfocus();
            Get.to(CobroPage(appCobrancas: appCobrancas));
          },
        )
      ],
    );
  }
}
