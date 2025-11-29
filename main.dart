<code>  
// Rabari Samaj - Simple Info App (Expanded)  
// Single-file Flutter app (lib/main.dart)  
// Replace your project's lib/main.dart with this file and run `flutter run`.  
// NOTE: Add dependency in pubspec.yaml:  
//   url_launcher: ^6.1.12  
// And run `flutter pub get`.  import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(RabariApp());

class RabariApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Rabari Samaj',
theme: ThemeData(
primaryColor: Color(0xFF800000), // Maroon
colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFD4AF37)), // Gold
fontFamily: 'NotoSans',
),
home: MainPage(),
);
}
}

class MainPage extends StatefulWidget {
@override
_MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
int _selectedIndex = 0;

static final List<Widget> _screens = <Widget>[
NewsScreen(),
RulesScreen(),
OriginScreen(),
JobsScreen(),
SakhaScreen(),
MarriageScreen(),
TempleScreen(),
];

void _onItemTapped(int index) {
setState(() {
_selectedIndex = index;
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Rabari Samaj'),
centerTitle: true,
),
body: _screens[_selectedIndex],
bottomNavigationBar: BottomNavigationBar(
type: BottomNavigationBarType.fixed,
currentIndex: _selectedIndex,
onTap: _onItemTapped,
selectedItemColor: Color(0xFFD4AF37),
unselectedItemColor: Colors.grey[600],
items: const <BottomNavigationBarItem>[
BottomNavigationBarItem(icon: Icon(Icons.article), label: 'સમાસાર'),
BottomNavigationBarItem(icon: Icon(Icons.rule_folder), label: 'કાયદા'),
BottomNavigationBarItem(icon: Icon(Icons.history_edu), label: 'ઉત્પત્તિ'),
BottomNavigationBarItem(icon: Icon(Icons.work), label: 'નોકરી'),
BottomNavigationBarItem(icon: Icon(Icons.format_list_numbered), label: '120 સાખ'),
BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'બેસણું'),
BottomNavigationBarItem(icon: Icon(Icons.temple_hindu), label: 'મંદિર'),
],
),
);
}
}

// ------------------ 1) News (સમાસાર) ------------------
class NewsScreen extends StatelessWidget {
final List<Map<String, String>> news = [
{
'title': 'Samaj Meeting at Bhavan',
'date': '28 Nov 2025',
'content': 'Annual meeting will discuss samaj activities and upcoming festival plans.'
},
{
'title': 'Festival Mela Photos Uploaded',
'date': '15 Nov 2025',
'content': 'Photos from the recent mela are available in Gallery.'
},
];

@override
Widget build(BuildContext context) {
return ListView(
padding: EdgeInsets.all(12),
children: [
Text('સમાસાર', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
...news.map((n) => Card(
child: ListTile(
leading: Icon(Icons.article_outlined),
title: Text(n['title']!),
subtitle: Text(n['date']!),
onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetail(n))),
),
))
],
);
}
}

class NewsDetail extends StatelessWidget {
final Map<String, String> news;
NewsDetail(this.news);

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(news['title']!)),
body: Padding(
padding: EdgeInsets.all(16),
child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Text(news['date']!, style: TextStyle(color: Colors.grey[700])),
SizedBox(height: 12),
Text(news['content'] ?? ''),
]),
),
);
}
}

// ------------------ 2) Rules (કાયદા) ------------------
class RulesScreen extends StatelessWidget {
final Map<String, String> rules = {
'Marriage Rules': '1) Matching gotra rules ...
2) Consent process ...',
'General Conduct': 'Respect elders, participate in samaj events, follow cleanliness rules',
};

@override
Widget build(BuildContext context) {
return ListView(
padding: EdgeInsets.all(12),
children: [
Text('કાયદા', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
...rules.entries.map((e) => Card(
child: ListTile(
title: Text(e.key),
subtitle: Text(e.value),
isThreeLine: true,
),
))
],
);
}
}

// ------------------ 3) Origin / History (ઉત્પત્તિ) ------------------
class OriginScreen extends StatelessWidget {
final String originText = '''
રબારી સમાજની ઉત્પત્તિ અને ઇતિહાસ:

રબારી સમાજ પરંપરાગત પશુપાલક સમાજ છે. તેઓ ગાય-ભેંસ અને અન્ય પશુઓ સાથે સંકળાયેલા રહ્યા છે. પ્રદેશ અને ઐતિહાસિક પરિસ્થિતિઓ મુજબ રબારી સમાજના રહેઠાણમાં ફેરફાર થયા.

(આટલી જગ્યામાં તમે વધારે વર્ણન, પરિવારચિત્રો અને તસવીરો ઉમેરી શકો.)
''';

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: EdgeInsets.all(12),
child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Text('રબારી સમાજ નું ઉત્પત્તિ', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network('https://picsum.photos/800/300?image=60')),
SizedBox(height: 10),
Text(originText),
]),
);
}
}

// ------------------ 4) Jobs (નોકરી માહિતી) ------------------
class JobsScreen extends StatelessWidget {
final List<Map<String, String>> jobs = [
{
'title': 'Primary School Teacher (Taluka)',
'qual': 'B.Ed required',
'lastDate': '10 Dec 2025',
'apply': 'https://example.com/apply'
},
{
'title': 'Clerical Staff (Gram Panchayat)',
'qual': '10+2',
'lastDate': '05 Dec 2025',
'apply': 'https://example.com/apply2'
},
];

@override
Widget build(BuildContext context) {
return ListView.builder(
padding: EdgeInsets.all(12),
itemCount: jobs.length,
itemBuilder: (context, i) {
final job = jobs[i];
return Card(
child: ListTile(
title: Text(job['title']!),
subtitle: Text('${job['qual']} • Last Date: ${job['lastDate']}'),
trailing: ElevatedButton(
child: Text('Apply'),
onPressed: () async {
final url = Uri.parse(job['apply']!);
if (await canLaunchUrl(url)) {
await launchUrl(url, mode: LaunchMode.externalApplication);
} else {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot open link')));
}
},
),
),
);
},
);
}
}

// ------------------ 5) 120 Sakha (120 સાખ) ------------------
class SakhaScreen extends StatefulWidget {
@override
_SakhaScreenState createState() => _SakhaScreenState();
}

class _SakhaScreenState extends State<SakhaScreen> {
final List<String> sakhas = [
// Example entries — please replace/add full 120 names as required
'Achala', 'Bhadaka', 'Bhutka', 'Chotaliya', 'Dabhai', 'Dantala', 'Eka', 'Fagda', 'Gadhavi', 'Gala',
'Hadia', 'Ishwar', 'Jakhala', 'Kakadiya', 'Lakhani', 'Mankad', 'Nandaniya', 'Odhav', 'Pipaliya', 'Qureshi',
'Rathod', 'Sahotra', 'Thakor', 'Udeshi', 'Vaghasiya', 'Wagh', 'Xavier', 'Yadav', 'Zalavadi'
// Continue until 120 — replace these sample names with real 120 sakha names
];

List<String> filtered = [];

@override
void initState() {
super.initState();
filtered = List.from(sakhas);
}

void _search(String q) {
setState(() {
filtered = sakhas.where((s) => s.toLowerCase().contains(q.toLowerCase())).toList();
});
}

@override
Widget build(BuildContext context) {
return Column(children: [
Padding(
padding: EdgeInsets.all(12),
child: TextField(
onChanged: _search,
decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search 120 સાખ...', border: OutlineInputBorder()),
),
),
Expanded(
child: ListView.builder(
padding: EdgeInsets.all(12),
itemCount: filtered.length,
itemBuilder: (context, i) => Card(
child: ListTile(title: Text(filtered[i])),
),
),
)
]);
}
}

// ------------------ 6) Marriage / Seating (બેસણું) ------------------
class MarriageScreen extends StatelessWidget {
final String marriageInfo = '''
બેસણું / લગ્ન માહિતી:

1. લગ્ન માટે જરૂરી દસ્તાવેજો:



જરૂરી ઓળખપત્ર

જામીન અથવા નિવાસ પુરાવો


2. બેસણું નિયમો:



સમુહ અને ગોઠવણી નિયમોનું પાલન


(આ જગ્યા પર તમે form ફીલ્ડ અને વ્યક્તગત એપ્લિકેશન ફંક્શનેલિટી ઉમેરવા શકો છો.)
''';

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
padding: EdgeInsets.all(12),
child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Text('બેસણું (Marriage Info)', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
SizedBox(height: 10),
Text(marriageInfo),
SizedBox(height: 12),
ElevatedButton.icon(
icon: Icon(Icons.file_present),
label: Text('Apply for Marriage / Seating'),
onPressed: () {
// Placeholder: open a form screen or external link
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Apply form will open (to be implemented)')));
},
)
]),
);
}
}

// ------------------ 7) Temple Directory (મંદિર) ------------------
class TempleScreen extends StatelessWidget {
final List<Map<String, String>> temples = [
{'name': 'Main Samaj Temple', 'address': 'Samaj Bhavan, Village', 'timings': '6:00 AM - 9:00 PM', 'phone': '+91 98765 43210'},
{'name': 'Shree Ranchhodji Temple', 'address': 'Near Bus Stand', 'timings': '5:00 AM - 8:00 PM', 'phone': '+91 91234 56789'},
];

@override
Widget build(BuildContext context) {
return ListView.builder(
padding: EdgeInsets.all(12),
itemCount: temples.length,
itemBuilder: (context, i) {
final t = temples[i];
return Card(
child: ListTile(
leading: Icon(Icons.temple_hindu),
title: Text(t['name']!),
subtitle: Text('${t['address']}
Timings: ${t['timings']}'),
isThreeLine: true,
trailing: IconButton(
icon: Icon(Icons.map),
onPressed: () async {
// Example: open Google Maps search
final query = Uri.encodeComponent(t['address']!);
final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
if (await canLaunchUrl(url)) {
await launchUrl(url, mode: LaunchMode.externalApplication);
} else {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cannot open maps')));
}
},
),
),
);
},
);
}
}

// ------------------ End of File ------------------

</code>