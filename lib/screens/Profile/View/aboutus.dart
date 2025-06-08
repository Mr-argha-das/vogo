import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Header and footer are intentionally omitted
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://i0.wp.com/vogo.family/wp-content/uploads/2025/01/banner-page-about-us.png"), fit: BoxFit.fitHeight)
            ),
            ),
            Text(
              'Despre noi',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ..._paragraphs.map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  p,
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> _paragraphs = [
  'Vogo.family este un concept inovator în industria HoReCa, Personal-Care și Lifestyle. Vogo folosește tehnologia pentru a asigura calitate și "well-being" pentru oameni, însă pune accent pe comunicare, pe discuții cu persoane reale, pe comunități și pe prieteni care fac tot ce se poate pentru a te susține și ajuta, pe a recomanda doar produse verificate de membrii comunității noastre și doar de la Furnizori / Producători verificați și certificați VOGO.',
  'Dacă te-ai săturat să aștepți minute în șir la telefon sau să discuți cu un robot IVR care doar te amână sau te pune pe tine la treabă, dacă ai avut experiențe neplăcute în a comanda produse care nu s-au ridicat la nivelul așteptărilor tale și care ți-au produs dezamăgire - asta pe lângă cheltuirea inutilă a banilor = risipă - înțelegi la ce ne referim.',
  'Produsele și serviciile Vogo aduc un plus de valoare experiențelor culinare, ospitalității și stilului de viață în general.',
  'Internetul este plin de informații amestecate, prezentate subiectiv, recenzii adevărate și recenzii cumpărate, reclame directe sau reclame mascate. Este complicat pentru fiecare dintre noi să căutăm, să filtrăm și să alegem cele mai bune servicii, rapid și în cunoștință de cauză. Suntem asaltați de marketing și de informații care ne pun în dificultate.',
  'Vogo family este, probabil, cel mai mare integrator de servicii și produse premium verificate. Conform statutului VOGO și a codului de conduită, accesul membrilor — atât cumpărători, cât și furnizori sau experți în anumite domenii — este permis exclusiv pe baza recomandărilor, a invitațiilor sau a unei verificări prealabile transmise la adresa de email: romania.partners@vogo.family',
  'Dacă ai pățit în trecut experiențe neplăcute care te-au deranjat, atunci poți intra în comunitatea VOGO. VOGO family folosește tehnologia pentru a identifica, în multitudinea de informații disponibile, acele servicii și produse care oferă o calitate bună la un preț corect. Atenție: VOGO nu filtrează sau selectează servicii și produse ieftine! Selectăm și îți recomandăm doar produse, servicii și furnizori de calitate - validați și verificați de noi. După selecția automată prin Data Mining și AI, toate produsele și serviciile sunt verificate manual / direct de consilierii noștri. În platformă se regăsesc doar produse și servicii încercate de consilieri, certificate și validate de aceștia conform criteriilor de calitate VOGO.',
  'Ți s-a întâmplat să ai nevoie de ceva și să întrebi un prieten: "Știi cumva un mecanic bun?" Sau: "Știi cumva, când merg în orașul Cluj, unde pot să mănânc ceva bun?" Sau ai avut nevoie de un medicament de la farmacie noaptea și a trebuit să suni un prieten să îl rogi: "Poți, te rog, să mergi până acolo ca să îmi iei un Nurofen?" Sau a trebuit să iei ceva dar nu ai putut să ieși pentru că nu îl poți lăsa singur pe Bebe în casă și a trebuit să suni o prietenă: "Te rog, poți să mă ajuți...?"',
  'Dezvoltarea urbană și tehnologică au ca și efect advers faptul că prietenii și cunoștințele / vecinii de încredere - sunt din ce în ce mai rari iar timpul liber este din ce în ce mai mic. Informațiile sunt din ce în ce mai multe și mai amestecate.',
  'Vogo family vine cu o soluție la aceste provocări, oferind un prieten real (nu virtual, nu robot) în persoana unui consultant alocat ție, pe care îl poți căuta prin intermediul platformei pe domeniul de interes și care îți va răspunde telefonic, pe WhatsApp, prin email etc.',
  'Cum funcționează? Vezi în diagrama de mai jos modul în care îmbinăm tehnologia avansată cu acțiunile personale astfel încât să obținem cele mai bune recomandări pentru membrii comunității noastre.',
  'Consultanții noștri care te vor ajuta au acces la:',
  '- informații verificate și catalogate, pe care le pot accesa imediat în librăria de cunoștințe / "knowledge library"',
  '- "lessons learned" - acces la informații multiple astfel încât te vor preveni să faci alegeri greșite; îți vor da toate informațiile necesare. Desigur, decizia îți aparține.',
  '- furnizori de produse și servicii verificați, validați, disponibili în orice locație și la orice oră din zi și din noapte.',
  'Vino în familia Vogo! Bucură-te de experiența VOGO. Apelează la prieteni și împărtășește-ți experiențele cu noi, pentru a ne ajuta între noi! Împreună ne este mai bine.',
  'În prima etapă, Vogo colectează recomandări și reviewuri din principalele surse de date (Google, Facebook, Tripadvisor etc) împreună cu seturi de date publice provenite de la organisme oficiale din domeniile HoReCa, turism, auto, ambasade și consulate, autorități, asigurători, financiar, judiciar - legal etc.',
  'În etapa 2 are loc procesul de sortare prin seturi filtrate de date pentru a identifica tipare și relații care pot ajuta la rezolvarea cerințelor de utilitate prin analiza datelor. Tehnicile și instrumentele de data mining ajută soluția să prezică tendințele viitoare și să ia decizii susținute pe date temeinice - sistem suport de decizie.',
  'Exploatarea datelor este o parte cheie a analizei datelor și una dintre disciplinele de bază în știința datelor, care utilizează tehnici avansate de analiză pentru a găsi informații utile în seturile de date. La un nivel mai granular, data mining este un pas în procesul de descoperire a cunoștințelor în bazele de date (KDD), o metodologie de știință a datelor pentru colectarea, procesarea și analiza datelor. Exploatarea datelor și KDD sunt uneori menționate în mod interschimbabil, dar sunt văzute mai frecvent ca lucruri distincte.',
  'Procesul de extragere a recomandărilor se bazează pe implementarea eficientă a colectării, depozitării și procesării datelor. Exploatarea datelor poate fi folosit'
];
