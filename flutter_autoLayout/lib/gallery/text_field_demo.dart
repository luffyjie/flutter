import 'package:flutter_autoLayout/public.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/services.dart';

class TextFieldDemo extends StatelessWidget {
  const TextFieldDemo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AutolayoutLocalizations.of(context).demoTextFieldTitle),
      ),
      body: const TextFormFieldDemo(),
    );
  }
}

class TextFormFieldDemo extends StatefulWidget {
  const TextFormFieldDemo({Key key}) : super(key: key);

  @override
  TextFormFieldDemoState createState() => TextFormFieldDemoState();
}

class PersonData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,
              semanticLabel: _obscureText
                  ? AutolayoutLocalizations.of(context)
                      .demoTextFieldShowPasswordLabel
                  : AutolayoutLocalizations.of(context)
                      .demoTextFieldHidePasswordLabel),
        ),
      ),
    );
  }
}

class TextFormFieldDemoState extends State<TextFormFieldDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersonData person = PersonData();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();
  final _UsNumberTextInputFormatter _phoneNumberFormatter =
      _UsNumberTextInputFormatter();

  void _handleSubmitted() {
    final form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidateMode = AutovalidateMode.always;
      showInSnackBar(
          AutolayoutLocalizations.of(context).demoTextFieldFormErrors);
    } else {
      form.save();
      showInSnackBar(AutolayoutLocalizations.of(context)
          .demoTextFieldNameHasPhoneNumber(person.name, person.phoneNumber));
    }
  }

  String _validateName(String value) {
    if (value.isEmpty) {
      return AutolayoutLocalizations.of(context).demoTextFieldNameRequired;
    }
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return AutolayoutLocalizations.of(context)
          .demoTextFieldOnlyAlphabeticalChars;
    }
    return null;
  }

  String _validatePhoneNumber(String value) {
    final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d-\d\d\d\d$');
    if (!phoneExp.hasMatch(value)) {
      return AutolayoutLocalizations.of(context)
          .demoTextFieldEnterUSPhoneNumber;
    }
    return null;
  }

  String _validatePassword(String value) {
    final passwordField = _passwordFieldKey.currentState;
    if (passwordField.value == null || passwordField.value.isEmpty) {
      return AutolayoutLocalizations.of(context).demoTextFieldEnterPassword;
    }
    if (passwordField.value != value) {
      return AutolayoutLocalizations.of(context)
          .demoTextFieldPasswordsDoNotMatch;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBoxSpace = SizedBox(height: 24);

    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Scrollbar(
          child: SingleChildScrollView(
            dragStartBehavior: DragStartBehavior.down,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                sizedBoxSpace,
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.person),
                    hintText: AutolayoutLocalizations.of(context)
                        .demoTextFieldWhatDoPeopleCallYou,
                    labelText: AutolayoutLocalizations.of(context)
                        .demoTextFieldNameField,
                  ),
                  onSaved: (value) {
                    person.name = value;
                  },
                  validator: _validateName,
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.phone),
                    hintText: AutolayoutLocalizations.of(context)
                        .demoTextFieldWhereCanWeReachYou,
                    labelText: AutolayoutLocalizations.of(context)
                        .demoTextFieldPhoneNumber,
                    prefixText: '+1 ',
                  ),
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    person.phoneNumber = value;
                  },
                  maxLength: 14,
                  maxLengthEnforced: false,
                  validator: _validatePhoneNumber,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    _phoneNumberFormatter,
                  ],
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    icon: const Icon(Icons.email),
                    hintText: AutolayoutLocalizations.of(context)
                        .demoTextFieldYourEmailAddress,
                    labelText:
                        AutolayoutLocalizations.of(context).demoTextFieldEmail,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {
                    person.email = value;
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: AutolayoutLocalizations.of(context)
                        .demoTextFieldTellUsAboutYourself,
                    helperText: AutolayoutLocalizations.of(context)
                        .demoTextFieldKeepItShort,
                    labelText: AutolayoutLocalizations.of(context)
                        .demoTextFieldLifeStory,
                  ),
                  maxLength: 3,
                ),
                sizedBoxSpace,
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText:
                        AutolayoutLocalizations.of(context).demoTextFieldSalary,
                    suffixText:
                        AutolayoutLocalizations.of(context).demoTextFieldUSD,
                  ),
                  maxLines: 1,
                ),
                sizedBoxSpace,
                PasswordField(
                  fieldKey: _passwordFieldKey,
                  helperText: AutolayoutLocalizations.of(context)
                      .demoTextFieldNoMoreThan,
                  labelText:
                      AutolayoutLocalizations.of(context).demoTextFieldPassword,
                  onFieldSubmitted: (value) {
                    setState(() {
                      person.password = value;
                    });
                  },
                ),
                sizedBoxSpace,
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: AutolayoutLocalizations.of(context)
                        .demoTextFieldRetypePassword,
                  ),
                  maxLength: 8,
                  obscureText: true,
                  validator: _validatePassword,
                ),
                sizedBoxSpace,
                Center(
                  child: RaisedButton(
                      child: Text(AutolayoutLocalizations.of(context)
                          .demoTextFieldSubmit),
                      onPressed: _handleSubmitted),
                ),
                sizedBoxSpace,
                Text(
                  AutolayoutLocalizations.of(context)
                      .demoTextFieldRequiredField,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final newTextLength = newValue.text.length;
    final newText = StringBuffer();
    var selectionIndex = newValue.selection.end;
    var usedSubstringIndex = 0;
    if (newTextLength >= 1) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
      if (newValue.selection.end >= 3) selectionIndex += 2;
    }
    if (newTextLength >= 7) {
      newText.write(newValue.text.substring(3, usedSubstringIndex = 6) + '-');
      if (newValue.selection.end >= 6) selectionIndex++;
    }
    if (newTextLength >= 11) {
      newText.write(newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
      if (newValue.selection.end >= 10) selectionIndex++;
    }
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
