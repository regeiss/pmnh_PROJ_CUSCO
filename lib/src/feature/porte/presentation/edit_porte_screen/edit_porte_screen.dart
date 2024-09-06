import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/src/common_widgets/date_time_picker.dart';
import 'package:gtk_flutter/src/common_widgets/responsive_center.dart';
import 'package:gtk_flutter/src/constants/breakpoints.dart';
import 'package:gtk_flutter/src/feature/porte/domain/porte.dart';
import 'package:gtk_flutter/src/feature/porte/presentation/edit_porte_screen/edit_porte_screen_controller.dart';
import 'package:gtk_flutter/src/utils/async_value_ui.dart';

class EditPorteScreen extends ConsumerStatefulWidget {
  const EditPorteScreen({super.key, this.porteId, this.porte});
  final PorteID? porteId;
  final Porte? porte;

  @override
  ConsumerState<EditPorteScreen> createState() => _EditJobPageState();
}

class _EditJobPageState extends ConsumerState<EditPorteScreen> {
  final _formKey = GlobalKey<FormState>();

  late DateTime _startDate;
  late TimeOfDay _startTime;
  late DateTime _endDate;
  late TimeOfDay _endTime;
  // late String _comment;

  DateTime get start => DateTime(_startDate.year, _startDate.month, _startDate.day, _startTime.hour, _startTime.minute);
  DateTime get end => DateTime(_endDate.year, _endDate.month, _endDate.day, _endTime.hour, _endTime.minute);

  String? _descricao;
  Timestamp? _dataCriacao;

  @override
  void initState() {
    super.initState();
    if (widget.porte != null) {
      _descricao = widget.porte?.descricao;
      _dataCriacao = widget.porte?.dataCriacao;
    }

    final start = DateTime.now();
    _startDate = DateTime(start.year, start.month, start.day);
    _startTime = TimeOfDay.fromDateTime(start);

    final end = DateTime.now();
    _endDate = DateTime(end.year, end.month, end.day);
    _endTime = TimeOfDay.fromDateTime(end);
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
      final success = await ref.read(editPorteScreenControllerProvider.notifier).submit(
            porteId: widget.porteId,
            oldPorte: widget.porte,
            descricao: _descricao ?? '',
            dataCriacao: _dataCriacao ?? Timestamp.now(),
          );
      if (success && mounted) {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      editPorteScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(editPorteScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.porte == null ? 'Novo porte' : 'Editar porte'),
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
        decoration: const InputDecoration(labelText: 'Porte descrição'),
        keyboardAppearance: Brightness.light,
        initialValue: _descricao,
        validator: (value) => (value ?? '').isNotEmpty ? null : 'Name can\'t be empty',
        onSaved: (value) => _descricao = value,
      ),
      TextFormField(
        decoration: const InputDecoration(labelText: 'Data criação'),
        keyboardAppearance: Brightness.light,
        initialValue: _dataCriacao != null ? '$_dataCriacao' : null,
        keyboardType: const TextInputType.numberWithOptions(
          signed: false,
          decimal: false,
        ),
        onSaved: (value) => _dataCriacao = Timestamp.now(), // int.tryParse(value ?? '') ?? 0,
      ),
      DateTimePicker(
        labelText: 'Start',
        selectedDate: _startDate,
        selectedTime: _startTime,
        onSelectedDate: (date) => setState(() => _startDate = date),
        onSelectedTime: (time) => setState(() => _startTime = time),
      ),
    ];
  }
}
