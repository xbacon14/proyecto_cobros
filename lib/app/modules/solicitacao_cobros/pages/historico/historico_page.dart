import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/pages/historico/widget/custom_timeline_tile.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobros/widget/hero_conta_receber.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'historico_controller.dart';

class HistoricoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HistoricoController controller = Modular.get();
    return Scaffold(
      appBar: AppBar(
        title: Text('Historico de Cobros'),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            HeroContaReceber(conta: controller.conta),
            Observer(builder: (_) {
              return Visibility(
                child: SingleChildScrollView(
                  child: Container(
                    width: Get.width * 0.98,
                    height: Get.height * .715,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Observer(builder: (_) {
                      return ListView.builder(
                        reverse: false,
                        itemCount: controller.dataProvider.length,
                        itemBuilder: (_, int index) {
                          return TimelineTile(
                            axis: TimelineAxis.vertical,
                            alignment: TimelineAlign.start,
                            endChild: CustomTimeLineTile(
                              historico: controller.dataProvider[index],
                            ),
                            indicatorStyle: IndicatorStyle(
                              iconStyle: IconStyle(
                                  iconData: Icons.check,
                                  color: Colors.white,
                                  fontSize: 16),
                              width: 20,
                              color: Colors.green,
                              padding: EdgeInsets.all(8),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ),
                replacement: Container(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
