import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String thuhmahruai = '''
        Mara reih achuna App  hmâ theipa ta a y n’awpa heta sôh he peimawh ngâsâpa miakha a châ. 

        Mo pakha khopasana ta taopa a chápa vâta sôh hnawh y leipa ta, App siepahliepa ta sôh hmôpa chhao he hmo rairu kawpa a châ hra. 

        App he sôh cheipa ta update byuh tyhpa a châ. He app hmâtuhpa nata Mara reih hmasie a khotuhpa zy siepahliepa ta Mara reih achuna app a sie pazao lymâ thei nawpa ta DONATION he taopa a châ.

        Donation a tlopakhypa tawhta content chhao update lymâpa a châ aw. 

        Na reih cheichalo nawpa ta na pasaina rakha lymâ hawhta vaw thyu hra mah y.

Name Ac : FC BEIRACHHUADY
Bank Account No. : 20286547989
IFSC : SBIN0005822
UPI : 8798044892@paytm 



    ''';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 88, 88, 87),
        title: Text(
          'Donation',
          style: GoogleFonts.yesevaOne(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
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
