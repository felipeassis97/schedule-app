import 'package:flutter/material.dart';
import 'package:schedule_app/shared/components/custom_textfield.dart';
import 'package:schedule_app/shared/components/primary_button.dart';
import 'package:schedule_app/shared/theme/app_colors.dart';

class CreateNewEvent extends StatefulWidget {
  const CreateNewEvent({Key? key}) : super(key: key);
  static const routeName = '/newEvent';

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Adicionar evento')),
        body: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _title(title: 'INFORMAÇÃO DO EVENTO'),
                    _fieldName(),
                    _fieldDescription(),
                    _dateFields(),
                    const SizedBox(height: 16),
                    _title(title: 'INFORMAÇÃO DO LOCAL'),
                    _addressFields()
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: PrimaryButton(
                  onPressed: () {},
                  label: 'Adicionar evento',
                ),
              ),
            )
          ],
        ));
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

  Widget _fieldName() => const CustomTextField(label: 'Nome do evento');

  Widget _fieldDescription() =>
      const CustomTextField(label: 'Descrição do evento');

  Widget _dateFields() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Flexible(child: CustomTextField(label: 'Data')),
          Flexible(child: CustomTextField(label: 'Início')),
          Flexible(child: CustomTextField(label: 'Término')),
        ],
      );

  Widget _addressFields() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(flex: 7, child: CustomTextField(label: 'CEP')),
              const SizedBox(width: 16),
              InkWell(
                onTap: () {},
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
            children: const [
              Flexible(flex: 7, child: CustomTextField(label: 'Rua')),
              Flexible(flex: 3, child: CustomTextField(label: 'Número')),
            ],
          ),
          const CustomTextField(label: 'Bairro'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Flexible(flex: 7, child: CustomTextField(label: 'Cidade')),
              Flexible(flex: 3, child: CustomTextField(label: 'UF')),
            ],
          )
        ],
      );
}
