# Nifty Options Tracker

A Flutter application that lets users sign in, search for NSE Nifty options, and watch live market data update in real time over a WebSocket connection to the Upstox broker API.

## Broker

This app uses **Upstox** for both the option search REST API and the live market data WebSocket feed.

Upstox provides a free analytics API token for reading market data, supports instrument search and a protobuf-based WebSocket feed for real-time ticks. No OAuth app registration is required — only an Upstox account with the F&O segment activated.

### How to get the Upstox analytics token

1. Create an Upstox account at [upstox.com](https://upstox.com).
2. Activate the derivatives (F&O) segment on your account.
3. Wait 24 hours after activation — this is required before you can generate an analytics token.
4. Go to the [Upstox Developer Portal](https://account.upstox.com/developer/apps) and generate an analytics access token.
5. Copy the token — you will add it to the `.env` file.

## Setup

### Prerequisites

- Flutter SDK (3.13.0 or later)
- A Firebase project with Authentication enabled (Google Sign-In and Email/Password providers)
- An Upstox developer account with a valid access token

### Environment configuration

1. Copy the example environment file:

```bash
cp .env.example .env
```

2. Fill in your values in `.env`:

```
UPSTOX_ANALYTICS_ACCESS_TOKEN=your_upstox_access_token_here
UPSTOX_BASE_URL=https://api.upstox.com
```

The `.env` file is gitignored and loaded at app startup via `flutter_dotenv`.

### Firebase configuration

The app uses Firebase Auth for authentication. Platform-specific Firebase config files are already included for the project (`google-services.json` for Android, `GoogleService-Info.plist` for iOS/macOS). If you are setting up your own Firebase project:

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Enable **Google Sign-In** and **Email/Password** as sign-in providers under Authentication.
3. Run `flutterfire configure` to generate `firebase_options.dart` and platform config files.

### Run the app

```bash
cd frontend
flutter pub get
flutter run
```

## Authentication

Authentication is handled by **Firebase Auth** with two sign-in methods:

- **Google Sign-In** — uses the `google_sign_in` package to authenticate with Google, then signs into Firebase with the Google credential.
- **Email and password** — login and registration are separate screens. Registration requires a password with at least 6 characters, one uppercase letter, one number, and one special character. After registration, the user is redirected to the login screen to sign in.

Session persistence is handled by Firebase Auth automatically. On app startup, `AuthController` validates the saved session by calling `user.reload()` and listens to `authStateChanges()` for real-time auth state updates. If the session is invalid or the user is disabled, the app redirects to the login screen.

Logout is available from the app bar on the search screen.

## App structure

The app follows a **feature-based MVC structure** using **Provider** for state management.

```
lib/
├── main.dart
├── firebase_options.dart
├── core/
│   ├── errors/          # Custom exception classes (AuthException, UpstoxApiException)
│   ├── routes/          # Named route definitions
│   └── theme/           # Material 3 theme configuration
├── features/
│   ├── auth/
│   │   ├── controller/  # AuthController (ChangeNotifier)
│   │   └── view/        # Login screen and register screen
│   ├── home/
│   │   ├── controller/  # OptionSearchController (ChangeNotifier)
│   │   ├── model/       # SearchOptionModel
│   │   └── view/        # Search screen with AppTemplate, result cards, empty/error states
│   └── option_details/
│       ├── controller/  # OptionDetailsController (ChangeNotifier)
│       ├── model/       # OptionDetailsMarketData
│       └── view/        # Detail screen, LTP card, quote cards, activity cards
├── services/
│   ├── auth_service.dart               # Firebase Auth operations
│   ├── upstox_search_data_service.dart # Upstox REST search API
│   └── upstox_web_socket_service.dart  # Upstox WebSocket live feed
├── shared/
│   └── widgets/
│       ├── template.dart  # Shared UI shell (app bar, logo, logout)
│       └── authgate.dart  # Auth state gate widget
└── generated/             # Protobuf-generated Dart files for Upstox feed
```

## Shared UI shell (template.dart)

`template.dart` defines `AppTemplate`, a reusable Scaffold wrapper that provides:

- An app bar with a candlestick chart logo icon, a screen title, and a sign-out action
- A back button when navigating to sub-screens (e.g., option detail)
- Consistent spacing and layout via `SafeArea`

Both the search screen and the option detail screen wrap themselves in `AppTemplate` inside their `build` method, keeping the same pattern across screens.

## Option search

The search screen lets users search for NSE F&O option contracts (CE and PE) using the Upstox `/v2/instruments/search` REST API.

- Search input is debounced by 450ms to avoid excessive API calls
- Requires at least 2 characters before making a request
- Results are cached for 30 seconds to avoid redundant requests
- Stale responses are discarded using a request ID counter — if the user types a new query before the previous response arrives, the old response is ignored
- Each result card shows the trading symbol, expiry date, strike price, and option type (CE/PE)

## Live market data

When the user taps a search result, the app opens the option detail screen and connects to the Upstox WebSocket feed:

1. The app requests an authorized WebSocket URL from the Upstox `/v3/feed/market-data-feed/authorize` endpoint.
2. It opens a WebSocket connection to the authorized URL.
3. It sends a subscription request for the selected instrument in full mode.
4. Incoming binary messages are decoded using protobuf-generated Dart classes (`FeedResponse`).
5. The decoded data is converted into an `OptionDetailsMarketData` object and passed to the controller, which notifies the UI.

The detail screen displays:

- **Last traded price (LTP)** with change amount and percentage since previous close
- **Best bid** — price and quantity
- **Best ask** — price and quantity
- **Open price** and **previous close**
- **Lot size** (from search data)
- **Volume** and **open interest**
- **Total bid quantity** and **total ask quantity**

All values update in real time as new ticks arrive from the WebSocket.

### WebSocket lifecycle

- The WebSocket connection opens when the detail screen mounts (`initState`).
- When the user navigates back, `dispose` calls `disconnectOptionData()` which closes the WebSocket and cancels the subscription.
- If the connection drops, the controller retries automatically up to 3 times with escalating delays (2s, 6s, 10s).
- A manual retry button is also shown on connection errors.

## Error handling

- **Auth errors** — Firebase error codes are mapped to user-friendly messages via `FirebaseAuthFailure.fromCode()` and `GoogleSignInFailure.fromCode()`.
- **Upstox HTTP errors** — all status codes (400, 401, 403, 404, 405, 406, 410, 429, 500, 503) are mapped to specific user-facing messages via `UpstoxApiException.fromStatusCode()`. Rate limiting (429) has its own `UpstoxRateLimitException` subclass.
- **Token expiry** — a 401 response surfaces "Your Upstox access token is missing, invalid, or expired" on both the search and detail screens. The user must replace the expired token in the `.env` file and restart the app. Upstox analytics tokens are valid for one year, so this is rare in practice.
- **Network errors** — `SocketException` and `http.ClientException` are caught and shown as connectivity messages.
- **WebSocket errors** — stream errors, unexpected disconnects, and decoding failures are wrapped in typed `UpstoxWebSocketException` (a subclass of `UpstoxApiException`) with user-friendly messages. The controller catches these by type and triggers the auto-retry mechanism.

## Dependencies

| Package | Purpose |
|---|---|
| `provider` | State management via ChangeNotifier |
| `firebase_core` | Firebase initialization |
| `firebase_auth` | Email/password and credential-based authentication |
| `google_sign_in` | Google Sign-In flow |
| `flutter_dotenv` | Load environment variables from `.env` |
| `http` | HTTP client for Upstox REST API |
| `web_socket_channel` | WebSocket client for Upstox live feed |
| `protobuf` | Decode Upstox protobuf binary messages |
| `fixnum` | 64-bit integer support used by protobuf-generated code for timestamps and quantities |
