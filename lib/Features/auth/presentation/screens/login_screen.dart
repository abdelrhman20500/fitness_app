import 'package:fitness_app/Features/layout/presentation/view/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/routes/app_rout.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/CustomButton.dart';
import '../widgets/custom_text_field.dart';
import 'register_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B121F),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'IronPulse',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/trainning.png",
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 24),
                const Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Fuel your progress. Log in to your pulse.',
                    style: TextStyle(color: Color(0xFF5A6982), fontSize: 14),
                  ),
                ),
                const SizedBox(height: 24),
                const Text('Email Address', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  controller: _emailController,
                ),
                const SizedBox(height: 16),
                const Text('Password', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  isPassword: _isObscure,
                  controller: _passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(_isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: const Color(0xFF5A6982)),
                    onPressed: () => setState(() => _isObscure = !_isObscure),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF007BFF))),
                  ),
                ),
                const SizedBox(height: 10),

                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) =>  LayoutScreen()),
                            (route) => false,
                      );
                    } else if (state is LoginError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const Center(child: CircularProgressIndicator(color: Color(0xFF007BFF)));
                    }
                    return CustomButton(
                      text: 'Log In',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).loginUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                          );
                        }
                      },
                    );
                  },
                ),

                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[800], thickness: 1)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('OR CONTINUE WITH', style: TextStyle(color: Color(0xFF5A6982), fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(child: Divider(color: Colors.grey[800], thickness: 1)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Google',
                        iconPath: 'assets/images/google_icon.png',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSocialButton(
                        text: 'Facebook',
                        iconPath: 'assets/images/facebook_icon.png',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ", style: TextStyle(color: Color(0xFF5A6982))),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.registerScreen);
                      },
                      child: const Text('Sign Up', style: TextStyle(color: Color(0xFF007BFF), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({required String text, required String iconPath, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1E293B)),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFF141E33).withOpacity(0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, height: 20, width: 20, errorBuilder: (c, e, s) => const Icon(Icons.g_mobiledata, color: Colors.white)),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}