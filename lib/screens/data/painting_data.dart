import 'package:ani_challenge/screens/data/detail_pages/napoleon.dart';
import 'package:ani_challenge/screens/data/detail_pages/van_gogh.dart';
import 'package:flutter/material.dart';

import 'detail_pages/mona_lisa.dart';

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
      detail: const Napoleon(),
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
      detail: const VanGogh(),
    ),
  ];

  List<Paint> getPaints() => _paints;
}
