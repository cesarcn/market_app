import 'package:flutter/material.dart';
import 'package:lab05/models/usuario_report.dart';
import 'package:lab05/providers/usuario_provider.dart';
import 'package:lab05/widgets/menu_lateral.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<UsuarioReport> listaUsuariosReport =
        usuarioProvider.listaUsuariosReport;

    List<charts.Series<UsuarioReport, String>> serie = [
      charts.Series(
        id: 'ReporteUsuarios',
        data: listaUsuariosReport,
        domainFn: (UsuarioReport serie, _) => serie.id,
        measureFn: (UsuarioReport serie, _) => serie.count,
        colorFn: (UsuarioReport serie, _) =>
            charts.ColorUtil.fromDartColor(Colors.redAccent),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: Color.fromARGB(255, 133, 9, 9),
      ),
      drawer: const MenuLateral(),
      backgroundColor: Colors.redAccent[100],
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover),
          ),
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Text('REPORTE DE USUARIOS'),
                Expanded(
                    child: charts.BarChart(
                  serie,
                  animate: true,
                )),
                Text('FUENTE: MONGODB')
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
