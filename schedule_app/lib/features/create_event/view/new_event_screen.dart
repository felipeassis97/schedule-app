import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:mobx/mobx.dart';
import 'package:schedule_app/features/create_event/controller/create_event_store.dart';
import 'package:schedule_app/shared/components/custom_textfield.dart';
import 'package:schedule_app/shared/components/primary_button.dart';
import 'package:schedule_app/shared/components/snack_bar.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class CreateNewEvent extends StatefulWidget {
  const CreateNewEvent({Key? key}) : super(key: key);

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  final CreateEventStore formController = CreateEventStore();
  late final ReactionDisposer _feedbackSearchCep;

  @override
  void initState() {
    feedbackSearchCep();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
          appBar: AppBar(title: const Text('Adicionar evento')),
          body: KeyboardVisibilityBuilder(builder: (context, visible) {
            return Observer(builder: (context) {
              return LoadingOverlay(
                isLoading: formController.isLoading,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _title(title: 'INFORMAÇÃO DO EVENTO'),
                            _fieldName(),
                            _fieldDescription(),
                            _dateFields(),
                            const SizedBox(height: 16),
                            _title(title: 'INFORMAÇÃO DO LOCAL'),
                            _addressFields(),
                            const SizedBox(height: 80)
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !visible,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: PrimaryButton(
                              onPressed: () async {
                                formController.validateForm()
                                    ? await formController
                                        .cordinatesByAddress()
                                        .then((_) => Navigator.pop(context))
                                    : null;
                              },
                              label: 'Adicionar evento',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
          })),
    );
  }

  Widget _title({required String title}) => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          title,
          style: const TextStyle(
              color: AppColors.greyMedium,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        ),
      );

  Widget _fieldName() => CustomTextField(
        label: 'Nome do evento',
        controller: formController.eventName,
        onChanged: (String value) => formController.setHasErrorEventName(false),
        errorText: formController.hasErrorEventName
            ? 'Informe o nome do evento'
            : null,
      );

  Widget _fieldDescription() => CustomTextField(
        label: 'Descrição do evento',
        maxLenght: 300,
        controller: formController.eventDescription,
        onChanged: (String value) {
          formController.setHasErrorEventDescription(false);
        },
        errorText: formController.hasErrorEventDescription
            ? 'Informe a descrição do evento'
            : null,
      );

  Widget _dateFields() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              flex: 6,
              child: CustomTextField(
                label: 'Data',
                readOnly: true,
                controller: formController.dateEvent,
                icon: const Icon(Icons.event_rounded, size: 16),
                onTap: () async {
                  await formController.datePicker(context,
                      controller: formController.dateEvent);
                  formController.setHasErrorDateEvent(false);
                },
                errorText: formController.hasErrorDateEvent
                    ? 'Informe uma data'
                    : null,
              )),
          const SizedBox(width: 8),
          Flexible(
              flex: 4,
              child: CustomTextField(
                label: 'Início',
                readOnly: true,
                controller: formController.startTime,
                icon: const Icon(Icons.schedule_rounded, size: 16),
                onTap: () async {
                  await formController.timePicker(context,
                      controller: formController.startTime);
                  formController.setHasErrorStartTime(false);
                },
                errorText:
                    formController.hasErrorStartTime ? 'Obrigatório' : null,
              )),
          const SizedBox(width: 8),
          Flexible(
              flex: 4,
              child: CustomTextField(
                label: 'Fim',
                readOnly: true,
                controller: formController.endTime,
                icon: const Icon(Icons.schedule_rounded, size: 16),
                onTap: () async {
                  await formController.timePicker(context,
                      controller: formController.endTime);
                  formController.setHasErrorEndTime(false);
                },
                errorText:
                    formController.hasErrorEndTime ? 'Obrigatório' : null,
              )),
        ],
      );

  Widget _addressFields() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                  flex: 7,
                  child: CustomTextField(
                    label: 'CEP',
                    controller: formController.zipcode,
                    keyboardType: TextInputType.number,
                    mask: '#####-###',
                    errorText: formController.hasErrorZipcode
                        ? 'Informe o cep do evento'
                        : null,
                  )),
              const SizedBox(width: 16),
              InkWell(
                onTap: () async {
                  formController.zipcode.text.isEmpty
                      ? formController.setHasErrorZipcode(true)
                      : await formController
                          .getDetailsAddress(context,
                              cep: formController.zipcode.text)
                          .then((_) => FocusScope.of(context).unfocus());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.deepPurple,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 7,
                  child: CustomTextField(
                    label: 'Rua',
                    controller: formController.street,
                    onChanged: (String value) =>
                        formController.setHasErrorStreet(false),
                    errorText: formController.hasErrorStreet
                        ? 'Informe a rua do evento'
                        : null,
                  )),
              Flexible(
                  flex: 3,
                  child: CustomTextField(
                    label: 'Número',
                    controller: formController.number,
                    onChanged: (String value) =>
                        formController.setHasErrorNumber(false),
                    errorText:
                        formController.hasErrorNumber ? 'Obrigatório' : null,
                  )),
            ],
          ),
          CustomTextField(
            label: 'Bairro',
            controller: formController.neighborhood,
            onChanged: (String value) =>
                formController.setHasErrorNeighborhood(false),
            errorText: formController.hasErrorNeighborhood
                ? 'Informe o bairro do evento'
                : null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 7,
                  child: CustomTextField(
                    label: 'Cidade',
                    controller: formController.city,
                    onChanged: (String value) =>
                        formController.setHasErrorCity(false),
                    errorText: formController.hasErrorCity
                        ? 'Informe a cidade do evento'
                        : null,
                  )),
              Flexible(
                  flex: 3,
                  child: CustomTextField(
                    label: 'UF',
                    controller: formController.uf,
                    onChanged: (String value) =>
                        formController.setHasErrorUf(false),
                    errorText: formController.hasErrorUf ? 'Obrigatório' : null,
                  )),
            ],
          )
        ],
      );

  void feedbackSearchCep() {
    _feedbackSearchCep = reaction((_) => formController.isError, (_) {
      formController.isError
          ? CustomSnackBar.errorSnackBar(context,
              message: 'Ocorreu um erro ao carregar os dados do CEP informado')
          : null;
    });
  }

  @override
  void dispose() {
    _feedbackSearchCep();
    super.dispose();
  }
}
