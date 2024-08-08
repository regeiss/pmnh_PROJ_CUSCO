/* SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(12.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Senha'),
              ),
              const SizedBox(height: 40),
              Center(
                child: CustomButton(
                  isDisabled: false,
                  title: 'Entrar',
                  loading: ref
                      .watch(authNotifierProvider)
                      .maybeWhen(orElse: () => false, loading: () => true),
                  onPressed: () =>
                      ref.read(authNotifierProvider.notifier).login(
                            email: email.text,
                            password: password.text,
                          ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta? '),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupView(),
                      ),
                    ),
                    child: const Text('Cadastre-se'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: SignInButton(
                  Buttons.Google,
                  text: "Entrar com Google",
                  //mini: true,
                  onPressed: () => ref
                      .read(authNotifierProvider.notifier)
                      .continueWithGoogle(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SignInButton(
                  Buttons.Apple,
                  text: "Entrar com Apple",
                  //mini: true,
                  onPressed: () => ref
                      .read(authNotifierProvider.notifier)
                      .continueWithGoogle(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SignInButton(
                  Buttons.Facebook,
                  text: "Entrar com Facebook",
                  //mini: true, 
                  onPressed: () => ref
                      .read(authNotifierProvider.notifier)
                      .continueWithGoogle(),
                ),
              )
            ],
          ),
        ),
      ),

Screen de signup
=====================================================================================


=====================================================================================


*/