# Otobix - Car Wash Service App

A modern Flutter mobile application for car wash services, providing users with an easy way to book car washing appointments and track their vehicle maintenance.

## 🚗 Features

### Authentication System
- **User Login/Register** with email and password
- **Remember Me** functionality for automatic login
- **Secure data storage** using SharedPreferences
- **Session management** with automatic redirect

### Dashboard
- **Welcome card** with user statistics
- **Quick actions** for booking and tracking
- **Service catalog** with pricing and duration
- **Recent activities** tracking
- **Modern UI** with gradient designs and smooth animations

### Services Offered
- **Exterior Wash** - ₺50 (30 min)
- **Interior & Exterior Wash** - ₺80 (45 min)
- **Detailed Cleaning** - ₺150 (2 hours)

## 🛠️ Technical Stack

- **Framework**: Flutter 3.7.0+
- **Language**: Dart
- **State Management**: SharedPreferences for local storage
- **UI Components**: Material Design with custom styling
- **Fonts**: Google Fonts (Roboto, Pacifico)
- **Icons**: Font Awesome Flutter

## 📱 Screenshots

### Login Screen
- Clean and modern login interface
- Email and password validation
- Remember me checkbox
- Error handling with user-friendly messages

### Dashboard
- Personalized welcome message
- Service statistics (monthly/total washes)
- Quick action buttons for booking and tracking
- Service list with pricing
- Recent activity feed

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.7.0 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator / Android Emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/otobix.git
   cd otobix/MobilApp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Test Credentials
For testing purposes, you can use any email and password combination:
- **Email**: `test@gmail.com`
- **Password**: `123456`

## 📁 Project Structure

```
lib/
├── components/
│   └── View/
│       ├── Button/
│       ├── Card/
│       └── TextField/
├── Constants/
│   ├── AppColor_constants.dart
│   └── AppString_constants.dart
├── Pages/
│   ├── Dashboard/
│   │   └── dashboard_page.dart
│   ├── Login-Register/
│   │   ├── Login_Page.dart
│   │   └── Register_Page.dart
│   └── Splash/
│       └── splash_screen.dart
├── services/
│   └── auth_service.dart
├── Homepage.dart
└── main.dart
```

## 🔧 Configuration

### Dependencies
The app uses the following key dependencies:
- `shared_preferences: ^2.2.2` - Local data storage
- `google_fonts: ^6.2.1` - Custom fonts
- `font_awesome_flutter: ^10.8.0` - Icons
- `page_transition: ^2.2.1` - Smooth page transitions

## 🎨 Design Features

- **Modern UI/UX** with gradient backgrounds
- **Responsive design** for different screen sizes
- **Smooth animations** and transitions
- **Consistent color scheme** (Blue theme)
- **User-friendly navigation**

## 🔐 Security

- **Local data encryption** for stored credentials
- **Session management** with automatic logout
- **Input validation** for user data
- **Error handling** with user feedback

## 📈 Future Enhancements

- [ ] Real API integration
- [ ] Push notifications
- [ ] Payment gateway integration
- [ ] User profile management
- [ ] Service history
- [ ] Rating and review system
- [ ] Multi-language support

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Developer

**Otobix Team**
- Car wash service mobile application
- Built with Flutter and Dart
- Modern, user-friendly interface

## 📞 Support

For support and questions, please contact:
- Email: support@otobix.com
- Website: www.otobix.com

---

**Made with ❤️ using Flutter**
