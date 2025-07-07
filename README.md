Digital Score Card – Flutter App
This project is a Digital Score Card App built using Flutter for Clean Train Station Inspection. It replicates the official format of the CTS (Clean Train Station) inspection scorecard and annexures like A-1 and A-2.

📱 Features
•	• Input fields for Station Name and Inspection Date
•	• Score input for cleanliness parameters (0–10)
•	• Remarks entry for each parameter
•	• Required field validation with * indicator
•	• Data submission as JSON to mock API (https://httpbin.org/post)
•	• Navigation to: Passed Train Score Card, Annexure A-1 Score Card, Staff & Train Consumables, Penalty Schedule (Annexure A-2)
•	• Intuitive UI with colored action buttons
📦 Tech Stack

• Framework: Flutter 3.32
• State Management: Provider
• HTTP Requests: http package
• Mock API: https://httpbin.org/post

🚧 Folder Structure

lib/
├── models/
│   └── form_data.dart
├── providers/
│   └── form_provider.dart
├── screens/
│   ├── form_screen.dart
│   ├── cts_score_grid_screen.dart
│   ├── annexure_a1_score_screen.dart
│   ├── train_consumables_screen.dart
│   └── penalty_schedule_screen.dart
├── widgets/
│   └── score_input.dart
└── main.dart

▶️ How to Run

1. Clone the repo:
   git clone https://github.com/AKSHAYA154089/digital_score_card_updated.git
   cd digital_score_card_updated

2. Install dependencies:
   flutter pub get

3. Run the app:
   flutter run -d chrome

📹 Submission

• UI Demo:
 https://drive.google.com/file/d/1o5VtDpd4UFs2KD3uszdlcs9I-DptYe_9/view?usp=drivesdk
• Tech Walkthrough: https://drive.google.com/file/d/1DllFbczqH5WdF2Lv6o9S1sFiyogIeufG/view?usp=drivesdk
• GitHub Repo: https://github.com/AKSHAYA154089/digital_score_card_updated
🙋‍♀️ Author
Esani Aiswarya Akshaya
GitHub: https://github.com/AKSHAYA154089
📄 License
This project is submitted as part of the Flutter Internship Assignment at Sarva Suvidhan Pvt. Ltd.
