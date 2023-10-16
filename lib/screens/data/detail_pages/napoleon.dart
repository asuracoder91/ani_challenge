import 'package:flutter/material.dart';

class Napoleon extends StatelessWidget {
  const Napoleon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 512,
      child: Column(children: [
        const Text(
          "Napoleon Crossing the Alps",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white),
        ),
        const Text(
          "Jacques-Louis David",
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
          'Napoleon Crossing the Alps (also known as Napoleon at the Saint-Bernard Pass or Bonaparte Crossing the Alps; listed as Le Premier Consul franchissant les Alpes au col du Grand Saint-Bernard) is a series of five oil on canvas equestrian portraits of Napoleon Bonaparte painted by the French artist Jacques-Louis David between 1801 and 1805. Initially commissioned by the King of Spain, the composition shows a strongly idealized view of the real crossing that Napoleon and his army made across the Alps through the Great St Bernard Pass in May 1800.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'It has become one of the most commonly reproduced images of Napoleon.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'History of the five versions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(
            height: 1, width: 240, child: Divider(color: Colors.white)),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 160,
              child: Text(
                'The original painting remained in Madrid until 1812, when it was taken by Joseph Bonaparte after his abdication as King of Spain. He took it with him when he went into exile in the United States,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/napoleon_01.jpg", width: 160),
          ],
        ),
        const Text(
          ' and it hung at his Point Breeze estate near Bordentown, New Jersey. The painting was handed down through his descendants until 1949, when his great grandniece, Eugenie Bonaparte, bequeathed it to the museum of the Château de Malmaison.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'The version produced for the Château de Saint-Cloud from 1801 was removed in 1814 by the Prussian soldiers under von Blücher who offered it to Frederick William III King of Prussia. It is now held in the Charlottenburg Palace in Berlin.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'The 1802 copy from Les Invalides was taken down and put into storage on the Bourbon Restoration of 1814; but in 1837, under the orders of Louis-Philippe, it was rehung in his newly declared museum at the Palace of Versailles, where it remains to the present day.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'The 1803 version was delivered to Milan but confiscated in 1816 by the Austrians. The people of Milan refused to give it up and it remained in the city until 1825. It was finally installed at the Belvedere in Vienna in 1834. It remains there today, now part of the collection of the Österreichische Galerie Belvedere.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/images/napoleon_02.jpg", width: 180),
            Image.asset("assets/images/napoleon_04.jpg", width: 180),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'The version kept by David until his death in 1825 was exhibited at the Bazar Bonne-Nouvelle [fr] in 1846 (where it was remarked upon by Baudelaire). In 1850 it was offered to the future Napoleon III by David\'s daughter, Pauline Jeanin, and installed at the Tuileries Palace. In 1979, it was given to the museum at the Palace of Versailles.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Paintings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.8,
          ),
        ),
        const SizedBox(
            height: 1, width: 130, child: Divider(color: Colors.white)),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 190,
              child: Text(
                'The commission specified a portrait of Napoleon standing in the uniform of the First Consul, probably in the spirit of the portraits that were later produced by Antoine-Jean Gros, Robert Lefèvre (Napoleon in his coronation robes)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/napoleon_03.jpg", width: 160),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          ' and Jean Auguste Dominique Ingres (Napoleon I on his Imperial Throne), but David was keen to paint an equestrian scene. The Spanish ambassador, Ignacio Muzquiz, informed Napoleon and asked him how he would like to be represented. Napoleon initially requested to be shown reviewing the troops but eventually decided on a scene showing him crossing the Alps.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'In reality the crossing had been made in fine weather and Bonaparte had been led across by a guide a few days after the troops, mounted on a mule.[1] However, from the outset the painting was first and foremost propaganda, and Bonaparte asked David to portray him "calm, mounted on a fiery steed" (Calme sur un cheval fougueux), and it is probable that he also suggested the addition of the names of the other great generals who had led their forces across the Alps: Hannibal and Charlemagne.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset("assets/images/napoleon_05.jpg", width: 200),
            const SizedBox(width: 10),
            const SizedBox(
              width: 150,
              child: Text(
                'All five versions of the picture are of roughly the same large size (2.6 m × 2.2 m). Bonaparte appears mounted in the uniform of a general in chief, wearing a gold-trimmed bicorne, and armed with a Mamluk-style sabre.',
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
          ' He is wreathed in the folds of a large cloak which billows in the wind. His head is turned towards the viewer, and he gestures with his right hand toward the mountain summit.His left hand grips the reins of his steed. The horse rears up on its back legs, its mane and tail whipped against its body by the same wind that inflates Napoleon\'s cloak. In background a line of the soldiers interspersed with artillery make their way up the mountain. Dark clouds hang over the picture and in front of Bonaparte the mountains rise up sharply. In the foreground BONAPARTE, HANNIBAL and KAROLVS MAGNVS IMP. are engraved on rocks. On the breastplate yoke of the horse, the picture is signed and dated.',
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
