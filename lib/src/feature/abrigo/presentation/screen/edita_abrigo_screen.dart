import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/date_time_picker.dart';
import 'package:gtk_flutter/src/common_widgets/responsive_center.dart';
import 'package:gtk_flutter/src/constants/breakpoints.dart';
import 'package:gtk_flutter/src/feature/abrigo/domain/abrigo.dart';
import 'package:gtk_flutter/src/feature/abrigo/presentation/controller/edit_abrigo_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';
import 'package:intl/intl.dart';

class EditaAbrigoScreen extends ConsumerStatefulWidget {
  const EditaAbrigoScreen({super.key, this.abrigoId, this.abrigo});
  final AbrigoID? abrigoId;
  final Abrigo? abrigo;

  @override
  ConsumerState<EditaAbrigoScreen> createState() => _EditAbrigoPageState();
}

class _EditAbrigoPageState extends ConsumerState<EditaAbrigoScreen> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _criadoDate;
  late TimeOfDay _startTime;

  DateTime get start => DateTime(_criadoDate.year, _criadoDate.month,
      _criadoDate.day, _startTime.hour, _startTime.minute);
  //late String _comentario;

  String? _nome;
  String? _comentario;
  Timestamp? _data;
  bool? _ativo;

  @override
  void initState() {
    super.initState();
    _criadoDate = DateTime.now();
    _startTime = TimeOfDay.now();

    if (widget.abrigo != null) {
      _nome = widget.abrigo?.nome;
      _comentario = widget.abrigo?.comentario;
      _data = widget.abrigo?.data;
      _ativo = widget.abrigo?.ativo;
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
      final success =
          await ref.read(editAbrigoScreenControllerProvider.notifier).submit(
                abrigoId: widget.abrigoId,
                oldAbrigo: widget.abrigo,
                nome: _nome ?? '',
                data: _data ?? Timestamp.fromDate(DateTime.now()),
                comentario: _comentario ?? "",
                ativo: _ativo ?? false,
              );
      if (success && mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      editAbrigoScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(editAbrigoScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.abrigo == null ? 'Novo Abrigo' : 'Editar Abrigo'),
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
            padding: const EdgeInsets.all(16.0),
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
      TextFormField(
        decoration: const InputDecoration(labelText: 'Nome'),
        keyboardAppearance: Brightness.light,
        initialValue: _nome,
        validator: (value) =>
            (value ?? '').isNotEmpty ? null : 'Nome deve ser informado',
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
    return DateTimePicker(
      labelText: 'Data criado-alterado',
      selectedDate: _data!.toDate(),
      selectedTime: TimeOfDay.now(),
      onSelectedDate: (date) =>
          setState(() => _data = Timestamp.fromDate(date)),
    );
  }

  Widget _buildCheckBox() {
    return CheckboxListTile(
      title: const Text("ativo"),
      value: _ativo,
      tristate: true,
      onChanged: (bool? value) {
        setState(() {
          _ativo = value ?? false;
        });
      },
      activeColor: Colors.blue,
      checkboxShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
