# AI CHAT
# 🤖 AI Chat App (Flutter + Firebase + Groq AI)

A powerful AI Chat Application built with **Flutter**, **Firebase**, and **Groq API (LLaMA 3)**.  
This app provides real-time chat with AI, authentication, cloud storage, and a smooth modern UI experience.

---

## ✨ Features

### 🔐 Authentication System
- Email & Password Sign Up / Login
- Google Sign-In integration
- Facebook Login support
- Firebase Authentication secure system
- User session management

---

### 🎨 UI/UX Design
- 🌙 Dark Mode support
- ☀️ Light Mode support
- Modern ChatGPT-style UI
- Smooth animations & responsive design
- Clean and minimal chat bubbles

---

### 💬 AI Chat System
- 🤖 Groq API integration (LLaMA 3 model)
- Real-time AI responses
- ChatGPT-like conversation flow
- Typing indicator (AI is thinking...)
- Auto scroll to latest message

---

### ☁️ Backend & Database
- Firebase Firestore for chat storage
- Real-time message syncing
- Chat history saved per user
- Secure cloud database structure

---

### 💾 Local Storage
- SharedPreferences used for:
  - User session persistence
  - Theme preference (Dark/Light)
  - Local app settings

---

### 🏗 Architecture
- MVVM Architecture pattern
- Clean separation of:
  - Models 📦
  - Views 🖥️
  - ViewModels / Controllers 🎮
- Scalable and maintainable code structure

---

### 📦 Packages Used

- 🔥 firebase_auth
- ☁️ cloud_firestore
- 🔑 google_sign_in
- 🌐 http (for Groq API)
- 💾 shared_preferences
- 🎨 google_fonts
- ⚡ get (state management)
- ⏳ loading animations (optional)
- 🧠 Groq API integration

---

## 🚀 App Flow

1. User signs up / logs in (Email, Google, Facebook)
2. Home screen shows chat history
3. User starts new conversation
4. Message sent → stored in Firestore
5. Groq AI responds in real-time
6. Chat saved automatically per user
7. Theme switches dynamically (Dark/Light)

---

## 🧠 AI Engine

Powered by:
- **Groq API**
- Model: `LLaMA 3.1 8B Instant`

Fast, intelligent, and lightweight AI responses.

---

## 📱 Screens Included

- 🔐 Login Screen
- 📝 Sign Up Screen
- 🏠 Home Screen (Chat List)
- 💬 Chat Screen (AI Conversation)
- ⚙️ Profile Screen (optional)
- 🚪 Logout System

---

## 🔥 Highlights

- ⚡ Fast & responsive UI
- 🔐 Secure authentication system
- 🤖 AI-powered chat experience
- ☁️ Cloud-based storage (Firestore)
- 📱 Mobile-first design
- 🏗 Scalable architecture (MVVM)

---

## 📸 Screenshots
 <img width="720" height="1600" alt="Image" src="https://github.com/user-attachments/assets/0d196562-2ce2-4eef-bc45-f050a229638c" />
<img width="720" height="1600" alt="Image" src="https://github.com/user-attachments/assets/42b3cdb5-6b48-4f0d-a465-e2d0527ac38a" />

<img width="720" height="1600" alt="Image" src="https://github.com/user-attachments/assets/ab8aee1c-47ce-442e-9107-7c997315bd3d" />
<img width="720" height="1600" alt="Image" src="https://github.com/user-attachments/assets/6444fc08-4561-4731-b72a-d50d6b029eb0" />

<img width="720" height="1600" alt="Image" src="https://github.com/user-attachments/assets/00a5fd3c-54c0-45cf-bbfd-8b47dbab9610" />

---

## 🛠 Setup Instructions

```bash
git clone https://github.com/your-username/ai_chat.git
cd ai_chat
flutter pub get
flutter run
 
