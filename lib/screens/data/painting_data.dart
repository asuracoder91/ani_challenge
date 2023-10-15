import 'package:flutter/material.dart';

class Paint {
  final String title;
  final String artist;
  final String year;
  final String description;
  final String gifUrl;
  final String bgUrl;
  final String allImageUrl;
  final Widget detail;

  Paint({
    required this.title,
    required this.artist,
    required this.year,
    required this.description,
    required this.gifUrl,
    required this.bgUrl,
    required this.allImageUrl,
    required this.detail,
  });
}

class DemoData {
  final List<Paint> _paints = [
    Paint(
      title: 'Napoleon Crossing the Alps',
      artist: 'Jacques-Louis David',
      year: '1801-1805',
      description:
          'Some find it stiff and lifeless, proof of Jacques-Louis David’s ineptness at capturing movement. Some see it not as art, but propaganda, pure and simple. Some snigger at its overblown, action-packed, cliff-hanging momentousness, with shades of “Hi ho Silver, away!” Some have it down as a sort of beginning of the end moment in David’s career, before he officially became Napoleon’s artist-lackey. Whatever one might say, though (and a lot has been said about Napoleon Crossing the Alps), it is still arguably the most successful portrait of Napoleon Bonaparte that was ever made',
      gifUrl: "assets/animations/0.gif",
      bgUrl: "assets/animations/0.png",
      allImageUrl: "assets/animations/0_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'Mona Lisa',
      artist: 'Leonardo da Vinci',
      year: '1503',
      description:
          'The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci. Considered an archetypal master- piece of the Italian Renaissance, it has been described as "the best known, the most visited, the most written about, the most sung about, and the most parodied work of art in the world".',
      gifUrl: "assets/animations/1.gif",
      bgUrl: "assets/animations/1.png",
      allImageUrl: "assets/animations/1_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'The Fifer',
      artist: 'Édouard Manet',
      year: '1866',
      description:
          "Edouard Manet’s ‘The Fifer’ was created in 1866 and is an artwork depicting a young boy, assumed to be Victorine Meurent with a hat on her head. Manet’s model had recently posed for the paint- ing of both Olympia and Luncheon on the Grass, both museums of Musée d’Orsay located in Paris. However, in this painting, Victorine appears much more demure wearing a silk dressing gown.",
      gifUrl: "assets/animations/2.gif",
      bgUrl: "assets/animations/2.png",
      allImageUrl: "assets/animations/2_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'The Scream',
      artist: 'Edvard Munch',
      year: '1893',
      description:
          "The Scream is a proto-expressionist artwork realized by Norwegian painter Edvard Munch in 1893. It depicts a deformed human figure disturbingly screaming in a landscape with unnatural colors. Representing a universal symbol of anxiety, Munch’s iconic Scream is preserved in the National Gallery of Oslo.",
      gifUrl: "assets/animations/3.gif",
      bgUrl: "assets/animations/3.png",
      allImageUrl: "assets/animations/3_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'Girl with a Pearl Earring',
      artist: 'Johannes Vermeer',
      year: '1665',
      description:
          "Girl with a Pearl Earring is an oil painting by Dutch Golden Age painter Johannes Vermeer, dated c. 1665. Going by vari- ous names over the centuries, it became known by its present title towards the end of the 20th century after the earring worn by the girl portrayed there",
      gifUrl: "assets/animations/4.gif",
      bgUrl: "assets/animations/4.png",
      allImageUrl: "assets/animations/4_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'The Star',
      artist: 'Edgar Degas',
      year: '1878',
      description:
          "This painting is titled L'Étoile (The Star). We see a lone ballerina on the stage, the stage lighting shining brilliantly onto her and her performance. She is en pointe, balancing gracefully on one leg and maintaining a majestic pose. There are flowers on her white dress; her ribbon flows out from her extended neck; and she wears a crown atop her head. She bends her head back and closes her eyes in sweet triumph at the success of her performance (perhaps the audience is clapping for this young star at this moment), and her rosy cheeks blush with the satisfaction of accomplishment.",
      gifUrl: "assets/animations/5.gif",
      bgUrl: "assets/animations/5.png",
      allImageUrl: "assets/animations/5_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'The Kiss',
      artist: 'Gustav Klimt',
      year: '1907-1908',
      description:
          "Gustav Klimt’s “The Kiss” is a magnifi- cent masterpiece that has become em- blematic of Art Nouveau, showcasing the artist’s Golden Phase. Measuring at 72in x 72in (180cm x 180cm), this iconic painting depicts a man cradling a wo- man's face as he leans in to kiss her. The couple is shown in traditional Art Nouveau style, symbolizing love and passion through highly decorative elements.",
      gifUrl: "assets/animations/6.gif",
      bgUrl: "assets/animations/6.png",
      allImageUrl: "assets/animations/6_all.png",
      detail: const MonaLisa(),
    ),
    Paint(
      title: 'Self-Portrait with Grey Felt Hat',
      artist: 'Vincent van Gogh',
      year: '1887',
      description:
          "Self-Portrait with Grey Felt Hat is one such defining portrait that captures Van Gogh’s unique style and personality. It highlights his expressive brushwork and vivid use of colors, creating a master- piece that transcends time. Today, it stands as a testament to the creative genius of one of history’s most celebrated artists.",
      gifUrl: "assets/animations/7.gif",
      bgUrl: "assets/animations/7.png",
      allImageUrl: "assets/animations/7_all.png",
      detail: const MonaLisa(),
    ),
  ];

  List<Paint> getPaints() => _paints;
}

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

class Gogh extends StatelessWidget {
  const Gogh({
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
