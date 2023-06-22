

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_sample_auth/auth/domain/usecases/post_login.dart';
import 'package:test_sample_auth/auth/presentation/login/cubit/auth_cubit.dart';
import 'package:test_sample_auth/auth/presentation/widget/parent.dart';
import 'package:test_sample_auth/core/common/app_route.dart';
import 'package:test_sample_auth/core/common/widgets/button.dart';
import 'package:test_sample_auth/core/common/widgets/button_text.dart';
import 'package:test_sample_auth/core/common/widgets/custom_password_filed.dart';
import 'package:test_sample_auth/core/common/widgets/custom_text_filed.dart';
import 'package:test_sample_auth/core/common/widgets/spacer_v.dart';
import 'package:test_sample_auth/core/common/widgets/text_f.dart';
import 'package:test_sample_auth/core/utils/context.dart';
import 'package:test_sample_auth/core/utils/string.dart';
import 'package:test_sample_auth/resources/dimens.dart';
import 'package:test_sample_auth/resources/palette.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(Routes.root.name);
    });
  }
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  bool _isPasswordHide = true;

  /// Global key
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          state.when(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              data.toString().toToastSuccess();

              TextInput.finishAutofillContext();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError();
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 65,
                        width: 65,
                        child: CircleAvatar(
                          backgroundColor: Palette.primary,
                          radius: Dimens.profilePicture + Dimens.space4,
                          child: CircleAvatar(

                            backgroundImage: AssetImage("assets/image/icons8-logo-96.png"),
                            radius: Dimens.profilePicture,
                          ),
                        ),
                      ),
                      SizedBox(height: 100,),
                      CustomTextField(controller: _conEmail, label: 'userName',
                      ),
                  //    const Spacer(),
                      const SizedBox(height: 16,),
                    CustomPasswordFiled(label: 'password', controller: _conPassword,),

                      SpacerV(value: Dimens.space24),
                      Button(
                        title: 'login',
                        onPressed: () {
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().login(
                              LoginParams(
                                username: _conEmail.text,
                                password: _conPassword.text,
                              ),
                            );

                          }
                          context.goNamed(Routes.root.name);
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}