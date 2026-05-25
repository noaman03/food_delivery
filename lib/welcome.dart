import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fooood/features/home/presentation/pages/home_page.dart';
import 'package:fooood/features/auth/presentation/pages/signup_page.dart';
import 'package:fooood/features/auth/presentation/pages/login_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcomebg.jpeg'),
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(73, 77, 99, 0),
                  Color.fromRGBO(25, 27, 47, 1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(27.41),
                      ),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                      elevation: 1,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    },
                    child: const Text(
                      'skip',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(254, 114, 76, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 160),
                    const SizedBox(
                      width: 311,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(17, 23, 25, 1),
                              fontSize: 53,
                            ),
                          ),
                          Text(
                            'FoodHub',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(254, 114, 76, 1),
                              fontSize: 53,
                            ),
                          ),
                          Text(
                            'Your favourite foods delivered fast at your door.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(48, 56, 79, 1),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 240),
                    SizedBox(
                      width: 293,
                      child: Row(
                        children: [
                          Container(
                            height: 1,
                            width: 84,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.625),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            ' sign in with',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Row(
                            children: [
                              Container(
                                height: 1,
                                width: 84,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.455),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 45),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(139.26, 54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.41),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.facebook_rounded,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(139.26, 54),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(27.41),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: SvgPicture.asset(
                                  'assets/icons/google.svg',
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 315,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: const BorderSide(color: Colors.white, width: 1),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ));
                        },
                        child: const Center(
                          child: Text('Start with email or phone'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        height: 17,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                              ),
                              child: const Text(
                                'sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  backgroundColor: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
