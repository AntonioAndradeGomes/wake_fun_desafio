import 'package:flutter/material.dart';
import 'package:wakke_fun/app/shared/utils/models/wake.dart';

class CardWake extends StatelessWidget {
  final Wake wake;
  const CardWake({Key? key, required this.wake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: wake.usuarioAutorImagemPerfil != null
                          ? NetworkImage(
                              wake.usuarioAutorImagemPerfil!,
                            )
                          : null,
                      backgroundColor: const Color(0xFF0000FF),
                      radius: 18,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      wake.usuarioAutorApelido!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset('assets/images/icon_coments.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      wake.comentariosQtd!.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset('assets/images/icon_star.png'),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      wake.mediaAcertos!.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    wake.imagemCapa!,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 280,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(
                        100,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        wake.titulo!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
