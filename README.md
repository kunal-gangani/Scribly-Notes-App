# ✒️ Scribly - Notes App

> *Where thoughts become timeless.*

Scribly is a powerful, elegant, and beautifully themed notes application built with **Flutter** and **Firebase**. Designed to be minimalist yet feature-rich, Scribly offers a smooth writing experience with dark mode aesthetics and essential note-taking features.

---

## 🚀 Features

✅ **Create, Read, Update, Delete (CRUD)** notes  
✅ **Like/Favorite Notes** for quick access to important thoughts  
✅ **Firebase Firestore** integration for real-time cloud sync  
✅ **GetX** for efficient state management  
✅ **Responsive UI** with `flutter_screenutil` for all screen sizes  
✅ **Beautiful dark theme** with neon-accented design  
✅ **Liked Notes Page** to view only your favorite notes  
✅ **Timestamps** to track note creation time  
✅ **Delete confirmation & snackbars** for smooth UX  
✅ **Clean architecture** using controllers and helper classes  

---

## 📸 Screenshots

| Home Page | Liked Notes | Edit Note |
|----------|-------------|-----------|
| ![Home](https://user-images.githubusercontent.com/yourhome.png) | ![Liked](https://user-images.githubusercontent.com/yourliked.png) | ![Edit](https://user-images.githubusercontent.com/youredit.png) |

---

## 🧠 Tech Stack

- **Flutter** 🐦
- **Firebase Firestore** 🔥
- **GetX** ⚙️
- **ScreenUtil** 📱

---

## 📁 Folder Structure

```bash
lib/
├── Controller/           # GetX Controllers
├── Firebase/             # Firebase Helper methods
├── Model/                # Note Model
├── Pages/                # UI Pages (Home, AddNote, LikedNotes)
├── Widgets/              # Custom widgets
├── main.dart             # App entry point
```

---

## 🛠 Setup Instructions

1. **Clone the repo**
```bash
git clone https://github.com/kunal-gangani/Scribly-Notes-App.git
cd Scribly-Notes-App
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Configure Firebase**
- Set up Firebase project
- Add `google-services.json` (Android) or `GoogleService-Info.plist` (iOS)
- Enable Firestore in Firebase Console

4. **Run the app**
```bash
flutter run
```

---

## 📌 TODO (Optional Enhancements)

- [ ] Search notes functionality
- [ ] Categories & tags for notes
- [ ] Cloud backup & user authentication
- [ ] Rich text editor for formatting

---

## ✍️ Author

Made with ❤️ by [Kunal Gangani](https://github.com/kunal-gangani)  
> The pen is mightier when powered by Flutter.

---

## 🌟 Support
If you like the project, give it a star ⭐ and share it with your dev friends!

---

## 📃 License

MIT License. Feel free to use and modify.

---
