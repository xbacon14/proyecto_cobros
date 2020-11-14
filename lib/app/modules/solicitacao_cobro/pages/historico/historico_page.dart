import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/models/time_line_historico_cobro_dto.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/widget/custom_time_line_tile.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/historico/historico_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/pages/solicitacao_cobros/solicitacao_cobros_controller.dart';
import 'package:proyecto_cobros/app/modules/solicitacao_cobro/widget/hero_conta_receber.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HistoricoPage extends StatefulWidget {
  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  HistoricoController controller = Modular.get();
  SolicitacaoCobrosController solicitacaoCobrosController = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historico de Cobro'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(57, 151, 114, 1),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    solicitacaoCobrosController.conta = controller.conta;
                    Get.toNamed('/home/listaConta/solicitacao_cobros');
                  }),
            ],
          )
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          HeroContaReceber(conta: controller.conta),
          Observer(
            builder: (_) {
              return Visibility(
                visible: !controller.processando,
                child: Container(
                  width: Get.width,
                  height: Get.height - 220,
                  child: Observer(builder: (_) {
                    return ListView.builder(
                      reverse: false,
                      itemCount: controller.dataProvider.length,
                      itemBuilder: (_, int index) {
                        TimeLineHistoricoCobroDto dto =
                            controller.dataProvider[index];
                        return TimelineTile(
                          axis: TimelineAxis.vertical,
                          alignment: TimelineAlign.start,
                          endChild: CustomTimeLineTile(
                            historico: dto,
                          ),
                          indicatorStyle: IndicatorStyle(
                            iconStyle: IconStyle(
                                iconData: dto.tipoContato == 'Presencial'
                                    ? Icons.people
                                    : Icons.phone,
                                color: Colors.white,
                                fontSize: 16),
                            width: 20,
                            color: (dto.tipoContato == 'Presencial'
                                ? Colors.grey
                                : Color.fromRGBO(57, 151, 114, 1)),
                            padding: EdgeInsets.all(8),
                          ),
                        );
                      },
                    );
                  }),
                ),
                replacement: Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFFFF12E0B4),
                    ),
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
