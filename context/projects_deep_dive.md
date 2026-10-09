# Deep-Dive Technical Project Dossiers

## 1. Remote Trackpad & Gamepad Pro (Flagship Systems Showcase)
- **Domain:** Systems Programming, Mobile Native, Real-Time Networking, Windows OS APIs.
- **Repository:** https://github.com/AgrShubham/Remote-trackpad-app
- **Release Downloads:**
  - Windows Daemon: `RemoteMouseServer.exe` (27MB standalone PyInstaller)
  - Android APK: `app-release.apk` (48MB signed)
- **Tech Stack:** React Native 0.76, TypeScript, Python 3.11, UDP Sockets, WebSocket, Win32 `SendInput` (`user32.dll`), Android SDK.
- **Key Technical Problems & Solutions:**
  1. *TCP Head-of-Line Blocking:* Standard WebSockets or TCP streams queue packets when packet loss occurs. If a touch packet suffers a 20ms Wi-Fi delay, all subsequent cursor deltas wait in the buffer, creating a noticeable freeze followed by a sudden jump.  
     **Solution:** Architected an asynchronous UDP datagram stream over Port 5002. Discarded frames are safely ignored as fresh touch vectors arrive immediately. Cursor latency plummeted to **<1ms**.
  2. *Driverless Input Injection:* Traditional virtual gamepad/mouse tools require custom kernel drivers (`.sys`), prompting security warnings and triggering anti-cheat bans.  
     **Solution:** Injected inputs into user-space Win32 `SendInput` API via ctypes/Python, providing zero-configuration execution.
  3. *Capacitive Digitizer Drift:* Touchscreens emit microscopic electrical noise (0.05px) when fingers rest stationary.  
     **Solution:** Implemented an adaptive deadband threshold (0.1px) and exponential moving average (EMA) smoothing curve that bypasses smoothing on high-velocity flicks.

---

## 2. Shree Mewa (Production E-Commerce & Gifting Platform)
- **Domain:** Production Web Architecture, E-Commerce, UX Engineering.
- **Repository:** https://github.com/AgrShubham/ShreeMewa
- **Tech Stack:** React 19, TypeScript 5.8, Tailwind CSS v4, Vite 6, Web Share API, Schema.org JSON-LD.
- **Key Technical Problems & Solutions:**
  1. *Cart Abandonment on Bespoke Gifting:* High-ticket wedding and corporate gift hampers (₹25,000+) face near 100% cart abandonment on standard credit card checkouts because clients demand personalized consultations.  
     **Solution:** Replaced generic carts with an automated WhatsApp Concierge ordering pipeline that serializes chosen hamper boxes, laser monogram text, nut grades, and greeting cards into a formatted, encrypted deep-link directly to boutique owners.
  2. *Offline Procurement Catalogs:* Corporate procurement heads need printable PDF lookbooks for board approvals.  
     **Solution:** Built a dedicated print stylesheet (`@media print`) and client-side print engine, producing formatted physical/PDF lookbooks on demand.

---

## 3. Remote Trackpad Web (Browser-Based Input Server)
- **Domain:** WebSockets, Browser APIs, Web Audio API, Zero-Install Architecture.
- **Repository:** https://github.com/AgrShubham/remote_mouse
- **Tech Stack:** Python 3.9+, Flask, Flask-SocketIO, JavaScript (ES6+), Web Audio API, Pynput.
- **Key Technical Problems & Solutions:**
  1. *iOS Safari Vibration Restriction:* Safari blocks `navigator.vibrate()` on web pages for security reasons, preventing users from receiving haptic feedback when pressing virtual mechanical keys.  
     **Solution:** Synthesized acoustic tactile feedback using the browser Web Audio API: twin audio oscillators generate an instant 1750Hz sharp snap followed by a 220Hz bottom-out clack with microsecond decay, delivering universal physical feedback across both iPhone and Android.
  2. *Event Flooding:* Emitting WebSocket events on raw `touchmove` triggers 120Hz packet flooding on high-refresh phones.  
     **Solution:** Batched delta vectors using `requestAnimationFrame`, aligning emissions with 60fps browser rendering cycles.
