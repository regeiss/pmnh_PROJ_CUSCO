import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/date_time_picker.dart';
import 'package:gtk_flutter/src/common_widgets/responsive_center.dart';
import 'package:gtk_flutter/src/constants/breakpoints.dart';
import 'package:gtk_flutter/src/feature/pet/domain/pet.dart';
import 'package:gtk_flutter/src/feature/pet/presentation/controller/edita_pet_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';
import 'package:intl/intl.dart';

class EditaPetScreen extends ConsumerStatefulWidget {
  const EditaPetScreen({super.key, this.petId, this.pet});
  final PetID? petId;
  final Pet? pet;

  @override
  ConsumerState<EditaPetScreen> createState() => _EditPetPageState();
}

class _EditPetPageState extends ConsumerState<EditaPetScreen> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _criadoDate;
  late TimeOfDay _startTime;

  DateTime get start => DateTime(_criadoDate.year, _criadoDate.month, _criadoDate.day, _startTime.hour, _startTime.minute);
  //late String _comentario;

  String? _nome;
  String? _comentario;
  Timestamp? _data;
  bool? _ativo;
  String? _imageURLString;

  @override
  void initState() {
    super.initState();
    _criadoDate = DateTime.now();
    _startTime = TimeOfDay.now();

    if (widget.pet != null) {
      _nome = widget.pet?.nome;
      _comentario = widget.pet?.comentario;
      _data = widget.pet?.data;
      _ativo = widget.pet?.ativo;
      _imageURLString = widget.pet?.imageURLString;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      final success = await ref.read(editPetScreenControllerProvider.notifier).submit(
            petId: widget.petId,
            oldPet: widget.pet,
            nome: _nome ?? '',
            data: _data ?? Timestamp.fromDate(DateTime.now()),
            comentario: _comentario ?? "",
            ativo: _ativo ?? false,
            imageURLString: _imageURLString ?? "",
          );
      if (success && mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      editPetScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(editPetScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pet == null ? 'Novo Pet' : 'Editar Pet'),
        actions: <Widget>[
          TextButton(
            onPressed: state.isLoading ? null : _submit,
            child: const Text(
              'Salvar',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      body: _buildContents(),
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxContentWidth: Breakpoint.tablet,
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      Image.network(
        _imageURLString!,
        fit: BoxFit.fill,
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Nome'),
        keyboardAppearance: Brightness.light,
        initialValue: _nome,
        validator: (value) => (value ?? '').isNotEmpty ? null : 'Nome deve ser informado',
        onSaved: (value) => _nome = value,
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Comentário'),
        keyboardAppearance: Brightness.light,
        initialValue: _comentario != null ? '$_comentario' : null,
        onSaved: (value) => _comentario = value,
      ),
      _buildDate(),
      _buildCheckBox(),
    ];
  }

  Widget _buildDate() {
    DateFormat.yMd();
    return Row(children: <Widget>[
      DateTimePicker(
        labelText: 'Data criado-alterado',
        selectedDate: _data!.toDate(),
        selectedTime: TimeOfDay.fromDateTime(_data!.toDate()),
        onSelectedDate: (date) => setState(() => _data = Timestamp.fromDate(date)),
      )
    ]);
  }

  Widget _buildCheckBox() {
    return CheckboxListTile(
      title: Text(
        "ativo",
        // style: Theme.of(context).textTheme.titleLarge,
      ),
      value: _ativo,
      tristate: true,
      onChanged: (bool? value) {
        setState(() {
          _ativo = value ?? false;
        });
      },
      activeColor: Colors.blue,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }

  Widget _buildComment() {
    return TextField(
      keyboardType: TextInputType.text,
      maxLength: 50,
      controller: TextEditingController(text: _comentario),
      decoration: const InputDecoration(
        labelText: 'Comment',
        labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      ),
      keyboardAppearance: Brightness.light,
      style: const TextStyle(fontSize: 20.0, color: Colors.black),
      maxLines: null,
      onChanged: (comentario) => _comentario = comentario,
    );
  }
}
