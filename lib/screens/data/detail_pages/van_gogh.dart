import 'package:flutter/material.dart';

class VanGogh extends StatelessWidget {
  const VanGogh({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 512,
      child: Column(children: [
        const Text(
          "Self-Portrait with Grey Felt Hat",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white),
        ),
        const Text(
          "Vincent van Gogh",
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
          'Van Gogh created more than 43 self-portraits between 1885 and 1889. They were usually completed in series, such as those painted in Paris in mid-1887, and continued until shortly before his death. Generally the portraits were studies, created during periods when he was reluctant to mix with others, or when he lacked models, and so painted himself',
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
              width: 160,
              child: Text(
                'The self-portraits reflect a high degree of self-scrutiny. Often they were intended to mark important periods in his life; for example, the mid-1887 Paris series were painted',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              children: [
                SizedBox(
                    height: 194,
                    child:
                        Image.asset("assets/images/gogh_01.jpg", width: 180)),
                const Text(
                  "Self-Portrait, Sep.1889",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1,
                    letterSpacing: -0.6,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'at the point where he became aware of Claude Monet, Paul Cézanne and Signac',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'In Self-Portrait with Grey Felt Hat, heavy strains of paint spread outwards across the canvas. It is one of his most renowned self-portraits of that period, "with its highly organized rhythmic brushstrokes, and the novel halo derived from the Neo-impressionist repertoire was what Van Gogh himself called a \'purposeful\' canvas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'They contain a wide array of physiognomical representations. Van Gogh\'s mental and physical condition is usually apparent; he may appear unkempt, unshaven or with a neglected beard, ',
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
                'with deeply sunken eyes, a weak jaw, or having lost teeth. Some show him with full lips, a long face or prominent skull, or sharpened, alert features.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/gogh_02.jpg", width: 160),
          ],
        ),
        const Text(
          ' His hair is sometimes depicted in a vibrant reddish hue and at other times ash colored.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Van Gogh\'s self-portraits vary stylistically. In those painted after December 1888, the strong contrast of vivid colors highlight the haggard pallor of his skin. Some depict the artist with a beard, others without. He can be seen with bandages in portraits executed just after he mutilated his ear.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Image.asset("assets/images/gogh_03.jpg", width: 160),
            Image.asset("assets/images/gogh_04.jpg", width: 160),
          ],
        ),
        const Text(
          'In only a few does he depict himself as a painter. Those painted in Saint-Rémy show the head from the right, the side opposite his damaged ear, as he painted himself reflected in his mirror',
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
