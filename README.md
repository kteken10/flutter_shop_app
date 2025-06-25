# 🛍️ **Flutter Multi-Vendor E-Commerce App**

This project is a **mobile e-commerce platform** built with **Flutter** and powered by a **Flask backend**, supporting **multiple vendors** and designed for **scalability and real-world use cases**.

---

## ⚙️ **Features Overview**

### 📱 Frontend – Flutter
- 🚀 Smooth **onboarding experience**
- 🔐 **User authentication** (Sign up & Login)
- 🏠 **Dynamic home screen** with real-time product listing
- 🛒 **Product details page** with full info (title, price, description, etc.)
- 📦 **Category-based navigation** *(in progress)*
- 💳 **Shopping cart and checkout** *(coming soon)*

### 🧠 Backend – Flask + ORM
- 🔌 **RESTful API** to manage:
  - 🛍️ Products
  - 🧾 Categories
  - 🎯 Promotions
  - 👥 Users
- 🧱 Structured with **extensibility in mind** for:
  - 🧑‍💼 Vendor accounts
  - 🧾 Order & Inventory management
  - 💵 Payment gateway integration

---

## 🛠️ **Tech Stack**

| Layer       | Technology                    |
|-------------|-------------------------------|
| Frontend    | Flutter (Dart)                |
| Backend     | Flask (Python)                |
| Database    | PostgreSQL / SQLite (ORM)     |
| API Format  | REST                          |
| State Mgmt  | setState / Provider *(temp)*  |

---

## 🚀 **Getting Started**

### ✅ Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Python 3.10+ with `pip`

---

### 💻 Installation Steps

#### Backend

```bash
# Clone the backend repo (if separated)
cd backend/
python -m venv env
source env/bin/activate  # or .\env\Scripts\activate on Windows
pip install -r requirements.txt
python app.py  # or flask run
```

#### Frontend

```bash
# Clone the frontend repo
cd flutter_frontend/
flutter pub get
flutter run
```

---

## 📸 **App Screenshots Preview**

<p align="center">
  <kbd>
    <img src="assets/screens/onboarding.gif" width="280" />
    <br><em>Onboarding</em>
  </kbd>
  &nbsp;&nbsp;&nbsp;
  <kbd>
    <img src="assets/screens/home.png" width="280" />
    <br><em>Home – Dynamic Product Grid</em>
  </kbd>
</p>

<p align="center">
  <kbd>
    <img src="assets/screens/details.png" width="280" />
    <br><em>Product Detail View</em>
  </kbd>
  &nbsp;&nbsp;&nbsp;
  <kbd>
    <img src="assets/screens/auth.png" width="280" />
    <br><em>Login & Registration</em>
  </kbd>
</p>

---

## 🧩 **Project Architecture**

```
ecommerce_app/
│
├── frontend/ (Flutter)
│   ├── lib/
│   ├── assets/
│   └── pubspec.yaml
│
├── backend/ (Flask)
│   ├── app.py
│   ├── models/
│   └── routes/
│
└── database/
    └── schema.sql / migrations/
```

---

## 🤝 **Contributing**

Feel free to fork the project, submit issues, or suggest new features. Pull requests are welcome.

---

## 📜 License

Licensed under the **MIT License**. See [LICENSE](LICENSE) for more info.

---

## 📞 Contact

📧 Email: dissangfrancis@yahoo.com  
🌐 Portfolio: [dissangkevin.online](https://dissangkevin.online)  
🐙 GitHub: [github.com/kteken10](https://github.com/kteken10)

---

## 🏷️ Tags

`#Flutter` `#Flask` `#FullStackDev` `#EcommerceApp` `#MultiVendor` `#MobileDevelopment` `#Dart` `#PythonAPI`