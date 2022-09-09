// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example/app/shared/models/plan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:example/app/modules/home/home_store.dart';
import 'package:example/app/shared/core/app_colors.dart';
import 'package:example/app/shared/core/app_fonts.dart';
import 'package:example/app/shared/extensions/number_extensions.dart';
import 'package:example/app/shared/models/call_price_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telzir'),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  'Seja bem vindo a TELZIR, a sua companhia de telefonia!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Nós temos o plano certo para você que deseja falar mais pagando menos.'),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 210,
              child: Observer(
                builder: (_) {
                  if (controller.plans.isEmpty) {
                    return Center(
                      child: Text(
                        'Nenhum plano da Telzir foi encontrado',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: controller.plans.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final plan = controller.plans[index];

                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryBlack),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: 220,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      plan.name ?? '',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                        'R\$ ${plan.price?.toMoney()} mensais'),
                                    const SizedBox(height: 16),
                                    GestureDetector(
                                      onTap: () {
                                        Modular.to.pushNamed('/working');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.primaryBlack),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        child: Text(
                                          'Escolher',
                                          style: TextStyle(
                                            color: AppColors.primaryBlack,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Você pode falar até ${plan.minutes} sem pagar nada!',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                  'Abaixo você pode simular quanto economizaria com cada plano da Telzir'),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Selecione o DDD de origem e o DDD de Destino: ',
                  style: AppFonts.title),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Observer(
                  builder: (_) {
                    if (controller.chosenCall != null) {
                      return TextButton(
                        onPressed: controller.clearChosenCall,
                        child: Chip(
                          label: Text(
                            'DDD Origem: ${controller.chosenCall?.sourceCod}  -  DDD Destino: ${controller.chosenCall?.destinationCod}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primaryBlack,
                        ),
                      );
                    } else {
                      return TextButton(
                        onPressed: () async {
                          final result = await showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(36)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return GetCallPriceBottomSheet(
                                plans: controller.callPrices,
                              );
                            },
                          ) as CallPriceModel?;

                          if (result != null) {
                            controller.chosenCall = result;
                          }
                        },
                        child: Chip(
                          label: Text(
                            'Selecionar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primaryBlack,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  Text('Selecione um Plano FaleMais: ', style: AppFonts.title),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Observer(
                  builder: (_) {
                    if (controller.chosenPlan != null) {
                      return TextButton(
                        onPressed: controller.clearChosenPlan,
                        child: Chip(
                          label: Text(
                            controller.chosenPlan?.name ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primaryBlack,
                        ),
                      );
                    } else {
                      return TextButton(
                        onPressed: () async {
                          final result = await showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(36)),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return GetPlanBottomSheet(
                                plans: controller.plans,
                              );
                            },
                          ) as PlanModel?;

                          if (result != null) {
                            controller.chosenPlan = result;
                          }
                        },
                        child: Chip(
                          label: Text(
                            'Selecionar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          backgroundColor: AppColors.primaryBlack,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Quantos minutos duraria a ligação?',
                style: AppFonts.title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Este campo precisa ser preenchido!';
                  }
                  if (int.tryParse(value!) == null) {
                    return 'Este campo precisa ser um número!';
                  }
                  return null;
                },
                controller: controller.minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: 'Ex.: 60',
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text('Consultar'),
                  onPressed: controller.consult,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) {
                if (controller.calls.isEmpty) {
                  return Container();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Resultados: ',
                        style: AppFonts.title,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: (controller.calls.length * 50) + 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            DataTable(
                              border: TableBorder.all(),
                              columns: [
                                DataColumn(
                                    label: Text('Origem',
                                        textAlign: TextAlign.center)),
                                DataColumn(
                                    label: Text('Destino',
                                        textAlign: TextAlign.center)),
                                DataColumn(
                                    label: Text('Tempo',
                                        textAlign: TextAlign.center)),
                                DataColumn(
                                    label: Text('Plano\nFaleMais',
                                        textAlign: TextAlign.center)),
                                DataColumn(
                                    label: Text('Com\nFaleMais',
                                        textAlign: TextAlign.center)),
                                DataColumn(
                                    label: Text('Sem\nFaleMais',
                                        textAlign: TextAlign.center)),
                              ],
                              rows: controller.calls.map((element) {
                                return DataRow(cells: [
                                  DataCell(Text(
                                      '${element.callPrice?.sourceCod}',
                                      textAlign: TextAlign.center)),
                                  DataCell(Text(
                                      '${element.callPrice?.destinationCod}',
                                      textAlign: TextAlign.center)),
                                  DataCell(Text(element.time.toString(),
                                      textAlign: TextAlign.center)),
                                  DataCell(Text(element.activePlan?.name ?? '',
                                      textAlign: TextAlign.center)),
                                  DataCell(Text(
                                      (element.withFaleMais ?? 0).toMoney(),
                                      textAlign: TextAlign.center)),
                                  DataCell(Text(
                                      (element.withoutFaleMais ?? 0).toMoney(),
                                      textAlign: TextAlign.center)),
                                ]);
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GetCallPriceBottomSheet extends StatelessWidget {
  final List<CallPriceModel> plans;
  const GetCallPriceBottomSheet({
    Key? key,
    required this.plans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Selecione abaixo os DDD de origem e de Destino!',
                    style: AppFonts.title,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: plans.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final plan = plans[index];

                  return ListTile(
                    onTap: () => Navigator.of(context).pop(plan),
                    title: Text(
                      'DDD Origem: ${plan.sourceCod}    -     DDD Destino: ${plan.destinationCod}',
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Voltar', style: AppFonts.title),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class GetPlanBottomSheet extends StatelessWidget {
  final List<PlanModel> plans;
  const GetPlanBottomSheet({
    Key? key,
    required this.plans,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Selecione abaixo um plano FaleMais',
                    style: AppFonts.title,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: plans.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) {
                  final plan = plans[index];

                  return ListTile(
                    onTap: () => Navigator.of(context).pop(plan),
                    title: Text(plan.name ?? ''),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Voltar', style: AppFonts.title),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
