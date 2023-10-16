import 'package:flutter/material.dart';

class MonaLisa extends StatelessWidget {
  const MonaLisa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 512,
      child: Column(children: [
        const Text(
          "Mona Lisa",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white),
        ),
        const Text(
          "Leonardo da Vinci",
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          color: Colors.white,
          thickness: 0.5,
        ),
        const SizedBox(height: 10),
        const Text(
          'The Mona Lisa (Italian: Gioconda or Monna Lisa; French: Joconde) is a half-length portrait painting by Italian artist Leonardo da Vinci. \nConsidered an archetypal masterpiece of the Italian Renaissance, it has been described as "the best known, the most visited, the most written about, the most sung about, and the most parodied work of art in the world". ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 120,
              child: Text(
                'The painting\'s novel qualities include the subject\'s',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/mona_06.jpg", width: 220),
          ],
        ),
        const Text(
          ' enigmatic expression, monumentality of the composition, the subtle modelling of forms, and the atmospheric illusionism. ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'The painting has been traditionally considered to depict the Italian noblewoman Lisa del Giocondo.It is painted in oil on a white Lombardy poplar panel. Leonardo never gave the painting to the Giocondo family, and it is believed he later left it in his will to his favored apprentice Salaì.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/images/mona_01.jpg", width: 120),
            Image.asset("assets/images/mona_02.jpg", width: 120),
            Image.asset("assets/images/mona_03.jpg", width: 120),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          ' It was believed to have been painted between 1503 and 1506; however, Leonardo may have continued working on it as late as 1517. It was acquired by King Francis I of France and is now the property of the French Republic. It has been on permanent display at the Louvre in Paris since 1797. ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 190,
              child: Text(
                'The painting\'s global fame and popularity stem from its 1911 theft by Vincenzo Peruggia, who attributed his actions to Italian patriotism—a belief it should belong to Italy. The theft and subsequent recovery in 1914 generated unprecedented publicity for an art theft,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/mona_08.jpg", width: 160),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          ' and led to the publication of many cultural depictions such as the 1915 opera Mona Lisa, two early 1930s films (The Theft of the Mona Lisa and Arsène Lupin) and the song Mona Lisa recorded by Nat King Cole—one of the most successful songs of the 1950s. ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/images/mona_09.jpg", width: 200),
            const SizedBox(width: 10),
            const SizedBox(
              width: 150,
              child: Text(
                'The Mona Lisa is one of the most valuable paintings in the world. It holds the Guinness World Record for the highest known ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'painting insurance valuation in history at US\$100 million in 1962, equivalent to \$1 billion as of 2023.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    );
  }
}
