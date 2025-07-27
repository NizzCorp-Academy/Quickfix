# 🐞 Bug Tracker Application

A Flutter app to track and manage software bugs efficiently using **Firebase** as the backend and **BLoC** for state management.

![GitHub Repo stars](https://img.shields.io/github/stars/NizzCorp-Academy/Bug-Tracker?style=social)
![Platform](https://img.shields.io/badge/Platform-Flutter-blue)
![License](https://img.shields.io/github/license/NizzCorp-Academy/Bug-Tracker)
![Status](https://img.shields.io/badge/status-active-brightgreen)

📎 Website: https://github.com/NizzCorp-Academy/Quickfix

🌐 GitHub Repo: https://github.com/NizzCorp-Academy/Quickfix
---

## 🚀 Features

- 🔐 Firebase Authentication (Email/Password)  
- 📝 Add, edit, and delete bugs  
- 👤 Assign bugs to developers  
- 🧮 Filter bugs by status, severity, and date  
- 🔎 View bug details and fix logs  
- 📊 Bug-fixing statistics and streak tracking  
- 🔔 Push Notifications using Firebase Messaging  

---

## 🧑‍💻 Usage Guide

### 1. Register/Login
Create an account using email/password or log in if already registered.

### 2. Dashboard / Bug List
View bugs assigned to you, along with:
- 🏷️ Title  
- ⚠️ Severity  
- ✅ Status  
- 👨‍💻 Assigned Developer  

### 3. Adding a New Bug
Tap ➕ to:
- Add **Title**
- Describe **Bug**
- Select **Assigned Developer**
- Set **Severity** (Low/Medium/High)
- Choose **Status** (New, In Progress, Fixed)
- 🔒 Save to Firestore

### 4. Editing a Bug
- Tap bug → View details  
- Tap ✏️ Edit → Update status or reassign

### 5. Filtering Bugs
Filter using:
- 🟢 Status: New, Fixed, In Progress  
- 🔴 Severity: Low, Medium, High  

### 6. Status and Streaks
Access from **Drawer > Report**  
- View bug fix count  
- Track daily/weekly fix streaks  

---

## 🛠️ Tech Stack

| Technology     | Description                      |
|----------------|----------------------------------|
| ![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white) | Cross-platform UI toolkit |
| ![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white) | Programming language       |
| ![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black) | Backend (Firestore, Auth, Messaging) |
| ![BLoC](https://img.shields.io/badge/BLoC%20Pattern-42A5F5?logo=bloc&logoColor=white) | State management pattern   |

---
This project is part of a student project at NizzCorp Academy and is open for educational and demo purposes. All projects in this repository are intended for educational purposes only. Use or reuse of any code, design, or documentation must include proper attribution.

**Please respect the intellectual contributions and efforts of all collaborators and contributors.**