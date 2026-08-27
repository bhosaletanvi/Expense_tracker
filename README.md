# 💰 ExpenseWise – Expense Tracker

ExpenseWise is a Flutter-based expense tracking application designed to help users manage and monitor their daily expenses through a simple and user-friendly interface.

The application uses **Firebase Authentication** to provide secure user registration and email/password login.

---

## 📱 Features

### 🔐 User Authentication

* User registration using email and password.
* User login using Firebase Authentication.
* Form validation for email and password.
* Handles invalid login and registration errors.
* Secure logout functionality.
* Authentication-based navigation.

### 💸 Expense Management

* View daily expenses.
* Display total expenses for each day.
* Display individual expense details.
* Show expense place/category and amount.
* Organized expense cards for easy viewing.

### 🎨 User Interface

* Clean and modern Flutter UI.
* Responsive design.
* Teal-based application theme.
* Card-based expense presentation.
* Simple and easy-to-use navigation.

---

## 🛠️ Technologies Used

| Technology                  | Purpose                     |
| --------------------------- | --------------------------- |
| **Flutter**                 | Application development     |
| **Dart**                    | Programming language        |
| **Firebase Authentication** | User registration and login |
| **Firebase Core**           | Firebase integration        |
| **Material UI**             | Application interface       |

---

## 🏗️ Project Structure

```text
expense_wise/
│
├── lib/
│   ├── main.dart
│   ├── loginpage.dart
│   ├── registerPage.dart
│   ├── page2.dart
│   ├── DayList.dart
│   └── firebase_options.dart
│
├── web/
│   └── Web application configuration
│
├── pubspec.yaml
├── firebase.json
└── README.md
```

---

## 🔥 Firebase Authentication

ExpenseWise uses Firebase Authentication for managing user accounts.

### Registration Flow

```text
User enters Email + Password
            ↓
      Form Validation
            ↓
Firebase createUserWithEmailAndPassword()
            ↓
      Account Created
            ↓
        Login Page
```

### Login Flow

```text
User enters Email + Password
            ↓
      Form Validation
            ↓
Firebase signInWithEmailAndPassword()
            ↓
      Authentication
            ↓
       ┌────┴────┐
       ↓         ↓
    Success     Error
       ↓         ↓
     Page2    Error Message
```

### Logout Flow

```text
User clicks Logout
        ↓
FirebaseAuth.signOut()
        ↓
    Login Page
```

---

## 🔑 Authentication Implementation

### Create Account

Firebase Authentication is used to create a new account:

```dart
await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: emailcontroller.text.trim(),
  password: passwordcontroller.text.trim(),
);
```

### Login

Existing users can log in using:

```dart
await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailcontroller.text.trim(),
  password: passwordcontroller.text.trim(),
);
```

### Logout

Users can sign out using:

```dart
await FirebaseAuth.instance.signOut();
```

---

## ✅ Form Validation

The application validates user input before communicating with Firebase.

### Email Validation

* Checks whether the email field is empty.
* Checks whether the entered email contains `@`.
* Displays an appropriate validation message.

### Password Validation

* Checks whether the password is empty.
* Requires a minimum password length of 6 characters.

Example:

```text
Empty Email
    ↓
Please enter your email

Invalid Email
    ↓
Please enter a valid email

Empty Password
    ↓
Please enter your password

Password < 6 characters
    ↓
Password must be at least 6 characters
```

---

## 🖥️ Application Screens

### 1. Registration Page

Allows new users to create an account using:

* Email
* Password

### 2. Login Page

Allows registered users to log in using their Firebase credentials.

### 3. Expense Dashboard

Displays the user's expense information and daily expense summaries.

### 4. Daily Expense Page

Displays:

* Day number
* Total expense
* Individual expenses
* Expense location/place
* Expense amount

---

## 🚀 Getting Started

### Prerequisites

Before running the project, install:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Google Chrome for Flutter Web
* A Firebase account

Check Flutter installation:

```bash
flutter doctor
```

---

## 📥 Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-username/expense_wise.git
```

### 2. Navigate to the project

```bash
cd expense_wise
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Configure Firebase

The project uses Firebase for authentication.

Make sure your Firebase project is configured and the Firebase configuration file is available.

### 5. Run the application

For Web:

```bash
flutter run -d chrome
```

---

## 🔥 Firebase Setup

To configure Firebase for your own project:

### Step 1

Create a project in Firebase Console.

### Step 2

Enable:

**Authentication → Sign-in method → Email/Password**

### Step 3

Configure Firebase with FlutterFire:

```bash
flutterfire configure
```

Select the Firebase project and configure the required platform.

### Step 4

Install Firebase packages:

```bash
flutter pub add firebase_core
flutter pub add firebase_auth
```

### Step 5

Initialize Firebase in `main.dart`:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

---

## 📂 Main Files

### `main.dart`

Initializes Firebase and starts the Flutter application.

### `registerPage.dart`

Handles:

* Email input
* Password input
* Form validation
* Firebase account creation

### `loginpage.dart`

Handles:

* Email input
* Password input
* Firebase authentication
* Login error handling
* Navigation to the main application

### `page2.dart`

Contains the main expense application interface.

### `DayList.dart`

Displays individual day expense information including total expenses and expense details.

### `firebase_options.dart`

Contains Firebase configuration generated by FlutterFire.

---

## 🔒 Security

Firebase Authentication is responsible for handling user credentials.

The application does not manually store passwords in a local `Map` or list. Authentication requests are handled through Firebase Authentication APIs.

---

## 🔮 Future Enhancements

The project can be extended with:

* ☁️ Firebase Firestore for storing expenses.
* 👤 User profile management.
* 📊 Expense analytics and charts.
* 📅 Monthly and yearly expense reports.
* 🔎 Expense search and filtering.
* 🏷️ Expense categories.
* 💰 Budget management.
* 🔔 Budget notifications.
* 📈 Spending statistics.
* 🌙 Dark mode.
* 📤 Export expenses to PDF/CSV.
* 🔄 Cloud synchronization across devices.

---

## 🎯 Learning Outcomes

Through this project, the following concepts were practiced:

* Flutter application development.
* Dart programming.
* Stateful and stateless widgets.
* Form handling and validation.
* Navigation between Flutter screens.
* Firebase project configuration.
* Firebase Authentication.
* Asynchronous programming using `Future` and `async/await`.
* Exception handling with `FirebaseAuthException`.
* Responsive UI design.

---

## 👩‍💻 Developer

**Tanvi Ramdas Bhosale**

B.Tech Computer Science Engineering Student

---

## 📄 License

This project is developed for educational and learning purposes.
