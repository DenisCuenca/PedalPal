import 'package:flutter/material.dart';

class PaymentConf extends StatelessWidget {
  const PaymentConf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(children: [
          Text("Opciones de pago   "),
          Icon(Icons.pedal_bike_rounded)
        ]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(185, 226, 226, 226),
                  borderRadius: BorderRadius.circular(23)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 25),
                child: Column(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 0, 0, 0), //background color of button
                            //border width and color
                            elevation: 3, //elevation of button

                            padding: const EdgeInsets.all(
                                24) //content padding inside button
                            ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.credit_card_rounded,
                              color: Colors.white,
                            ),
                            Text(
                              "    Tarjeta de Credito",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Número de tarjeta:"),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(hintText: "Nombre de propietario:"),
                    ),
                    const Row(children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(hintText: "cvv:"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextField(
                          decoration:
                              InputDecoration(hintText: "Fecha caducidad:"),
                        ),
                      )
                    ]),
                    const SizedBox(
                      height: 23,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(
                                255, 0, 0, 0), //background color of button
                            //border width and color
                            elevation: 3, //elevation of button

                            padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 24) //content padding inside button
                            ),
                        onPressed: () {},
                        child: const Text(
                          "Guardar",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 56, 176, 192), //background color of button
                    //border width and color
                    elevation: 3, //elevation of button

                    padding:
                        const EdgeInsets.all(24) //content padding inside button
                    ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.paypal,
                      color: Colors.white,
                    ),
                    Text(
                      "    PayPal",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
