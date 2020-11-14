import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/cliente/models/cliente.dart';
import 'package:proyecto_cobros/app/modules/cliente/widget/cliente_render/card_cliente_render.dart';
import 'package:proyecto_cobros/app/modules/cobro/models/importacao_exportacao_app_cobrancas.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/cobro_controller.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/efetuar_cobro/efetuar_cobro_page.dart';
import 'package:proyecto_cobros/app/modules/cobro/pages/cobro/widgets/card_parcelas_cobros_render.dart';

class ListaContaReceberPage extends StatefulWidget {
  final String title;
  final Cliente cliente;
  const ListaContaReceberPage({
    Key key,
    this.title = "Lista Cuenta Receber",
    this.cliente,
  }) : super(key: key);

  @override
  _ListaContaReceberPageState createState() => _ListaContaReceberPageState();
}

class _ListaContaReceberPageState extends State<ListaContaReceberPage> {
  CobroController cobroController = Modular.get();
  @override
  void initState() {
    cobroController.findByParcelasByCliente(widget.cliente.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.cliente.id,
              child: CardClienteRender(
                cliente: widget.cliente,
              ),
            ),
            Container(
                width: Get.width,
                height: Get.height - 220,
                child: Observer(builder: (_) {
                  return ListView.builder(
                    reverse: false,
                    itemCount: cobroController.dataProvider.length,
                    itemBuilder: (_, int index) {
                      ImportacaoExportacaoAppCobrancas appCobrancas =
                          cobroController.dataProvider[index];
                      return Hero(
                        tag: appCobrancas.idParcela,
                        child: CardParcelasCobrosRender(
                          appCobrancas: cobroController.dataProvider[index],
                          cliente: widget.cliente,
                        ),
                      );
                    },
                  );
                })),
          ],
        ),
      ),
    );
  }
}
