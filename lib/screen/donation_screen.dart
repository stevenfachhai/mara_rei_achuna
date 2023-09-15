import 'package:flutter/material.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String thuhmahruai = '''
                          THUHMAHRUAI

        Lalpa'n min pek hlate a bu a tihchhuah hi ka rilruah a awm ngai lova, mahse mak tak main tun hnaiah bawhzui loh theih lohvina awm ta tlatmai a kan tihlawhtling chu a ni ve ta reng mai! Lalpa chu fakin awm rawh se. Kapianthar hmain hlaka phuah ngai lova; ka pianthar atanga thlakhat a nih alangm vawin thlengin Lalpa'n min pek chhunzawm ta zel a ni.

        Heng blate hi thluk kalphung mawl te te an nih hlawm avangin mite hmaa phawrhchhuaha tan chuan ka iai fo thin a, mahse Lalpa'n midangte thinlunga thusawina atan a hman ve tlat avangin ka phawrhchhuak ve ta zel mai a. Kum 2012 atang phei kha chuan ka phak tawka a tha thei ang berin; hautak leh buaithlak tak a nihzia hrereng chungin audio and video live recording vekin kaphochhuak ta zel a ni.

        Heng hlate phochhuah a nih theihna tura musician leh soloist min thawhpuitu zawng zawngte leh kawng brang hrang a ka mamawhna zawn aminpui thintite hi ka hriatreng thinte leh kangaihtualmain a chhu nawn fo thin te an ni a, an chungah thinlung takin lawmthu ka sawi a ni.

        Ram ngaih hla (Patriotic song) ho hi tlem a zawng Lalpa'n mm pea: Zofate'n kan ram leh hnam hmangailma thinlung dik tak kan put theihna turin Lalpa'n tihtur nei veah min ngai nim ka hria a; karam tana ka tih ve theihtank ka lo tive hi a hlu ka timvannei kainti em em ani.

        Lalpa'nhla min pek ve te hi solo a sak tur ni tlangpui mahsela zaipawl thenkhatte'n an sak duh ve thin avangin tonic sol-fa i ka harmonise a ka dah thave ta zela. Mahse, solo a saktur hlate hi tonic sol-fa a chhiar theih a dah a nih hiana hla thluk ang diak diak a sol-fa dah a ren lo fo thin a, asol- fa ziak hi en hrehawm khanpa a tih huawk theih dawn avang leh, zaipanl tana sak a nawin zank theihna tur a nih ringin hla thlukhrulah ka siam rem hlek hlek thm. Tin. tonic sol-fa adah theih loh khanp a note thensanm a ngaih changin itale i ka dah ringant bank a: a hriatthiam theih the turah ka ngai. Chuvangin, sol-fa ang diak diaka sak tun ai chuan hla thu nena en milchunga herrem hlek hlek a that a rimanm. Tin chang khatna mila sol-fa te hi ziah a nih avangm chang dangte nen a immillo tlangpui bank a ni.

        Hlate hi phuah hmasak dan indawta dah ani a; Lalpa'n hla thar min pe ve leh hlaubte a nih a hlabu chhuah nawn hunte a la awm a nih chuan dah belh a tiremchang turah ka ngai a ni.

        Rimawi lamah hian naupan lai atanga mahni tui tuia tui ve em em thin kani a, kan mual umin lo kaihruaithintute blutzia hika fiah tell tell mai! Ka au in a phak tawk a min tuipui ve thinnate khan vawiin hun min hruai thleng ve tlat a, ka tleirawl tantirh a guitar perh pawh thiam mang lo ka pa in min support na entir nan acoustic guitar leh tape cassette player min leisakte kha rimawia min pawt nghettu a lo ni a. Tum hnuah ka nupui Mamuani'n theihtawp min chhuahpui thin bakah ka fate'n an phaktawka min tawiawm thinnate hi ka tan a hlu hle thin a ni.

        Harmonise fel thawkhata ka inhriat hnuah Pu, K. Lalremruata (KLR Tetea) Ramblin 'N' in mincheck saka; siamthat duh laia lo la ngah khawp mai a: a zarah a lang felfai ta kuar aa chungah ka lawm takzet a. Tin, type settings chungchangah Pu Vanneihtluanga (LV Arts) chungah ka innghat thui khanp mai a: a chungah lawathu ka´sawi bawk a ni.

        Heng zawng zawng hi Lalpa zara ka chan ani a; Lalpa chauh ropui ber rawh se.

                                                                  C.Lalzarmawia

    ''';

    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        // Wrap the Text widget with SingleChildScrollView
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              thuhmahruai,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
