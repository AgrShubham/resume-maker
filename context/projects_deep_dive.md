# Deep-Dive Technical Project Dossiers

## 1. KioskDrop Enterprise & Mobile (Full-Stack, IoT & Mobile Systems Showcase)
- **Domain:** Enterprise SaaS, Distributed Concurrency, Cryptography, Mobile (Expo / React Native), FinOps.
- **Repositories & Live Links:**
  - Web & API (`main`, `experimental`, `docker`, `vercel-serverless` branches): https://github.com/AgrShubham/kioskdrop-enterprise
  - Mobile & Unified Workspace (`/mobile` + Next.js backend): https://github.com/AgrShubham/kioskdrop-mobile
  - Live Web Portal (Vercel Serverless + Neon Postgres): https://kioskdrop-enterprise.vercel.app/
  - Release Download (`kioskdrop-mobile` v1.0.0): `kioskdrop-enterprise.apk`
- **Tech Stack:** Next.js 14.2 (`App Router`), React 18.3, TypeScript 5.6, Expo SDK 58 / React Native 0.88 / React 19.3, NativeWind, TanStack Query, Zustand, Zod, Prisma ORM 6.4 (SQLite WAL / Neon PostgreSQL), Server-Sent Events (`react-native-sse`), Vitest, Jest + RNTL, Docker.
- **Period:** Oct 2026 – Nov 2026
- **Key Technical Problems & Solutions:**
  1. *Concurrent Bay Double-Booking:* Multiple employees simultaneously requesting the last USB-C/HDMI kit on a floor risk race-condition double reservations under standard read-then-write flows.
     **Solution:** Implemented conditional atomic bay updates (`prisma.lockerCompartment.updateMany` asserting `state: "STOCKED_AVAILABLE"` with `count === 1` check + exponential jitter retry), verified under a **20-worker parallel concurrency test** (`test/concurrency.test.ts`).
  2. *Zero-Trust Locker Security & Custody Auditability:* Naive OTP comparisons leak timing side-channels, and physical shared dongles risk BadUSB keystroke-injection attacks or unlogged shrinkage.
     **Solution:** Used salted HMAC-SHA256 PINs compared via `crypto.timingSafeEqual`, 5-attempt brute-force lockout (`HTTP 423`), USB VID/PID + 5V/3A return probing with BadUSB foreign device quarantine (`HTTP 409`), and an immutable SHA-256 hash-chained `CustodyLog`.
  3. *Statutory Duty Float Drift & Cross-Client Real-Time Sync:* Floating-point math fails statutory tax audits, and polling causes stale locker state across web kiosks and mobile phones.
     **Solution:** Built an integer-paise Indian Customs Duty Engine (`1%` Landing Charges + `20%` BCD + `10%` SWS + `18%` IGST = `44.40%` total duty with zero IEEE 754 drift), Zaggle/Happay FinOps & ERP adapters (SAP/Oracle/Zoho), ServiceNow/Zendesk webhook replay, and persistent SSE telemetry (`/api/telemetry/stream`) using HMAC Bearer auth in `expo-secure-store`.
- **Verification:** **39/39** Vitest backend/API/concurrency tests (7 suites) and **24/24** Jest/RNTL mobile tests (5 suites) passing.

---

## 2. MiniLedger (Fintech Mobile Ledger & Backend API)
- **Domain:** Fintech Backend, PostgreSQL Data Modeling, Cross-Platform Mobile.
- **Repository:** https://github.com/AgrShubham/MiniLedger
- **Tech Stack:** Node.js 20, Express 4.21, TypeScript 5.7, PostgreSQL 16 (Docker), Prisma ORM 5.22, Zod, JWT + HMAC-SHA256 OTP, Multer, Expo SDK 58 / React Native 0.88, TanStack Query, `expo-secure-store`, Jest + Supertest.
- **Period:** Oct 2026
- **Key Technical Problems & Solutions:**
  1. *Floating-Point Currency Drift & Timezone Overdue Bugs:* Standard JS numbers corrupt ledger totals (`0.1 + 0.2 !== 0.3`), and UTC timestamps falsely flip due dates across local timezones.
     **Solution:** Stored all monetary values in PostgreSQL as integer minor units (`amountMinor`), computed financial summaries via SQL database `aggregate._sum`, stored `dueDate` as date-only `@db.Date` enforcing `status = PENDING && dueDate < today`, and injected a deterministic clock abstraction (`clock.ts`) for testability.
  2. *Duplicate Repayments & Receipt Upload Security:* Double-taps on mobile risk double-repaying a loan, and user-supplied receipt filenames risk path traversal.
     **Solution:** Guarded repayments with an atomic conditional `prisma.loan.updateMany` (`status: 'PENDING'`) distinguishing `404 Not Found` from `409 Conflict` (`ALREADY_REPAID`), added HMAC-SHA256 rate-limited OTP + JWT auth, and enforced strict MIME allowlisting + UUID filenames for Multer multipart uploads.
- **Verification:** Comprehensive Jest + Supertest integration suite executing against an isolated `miniledger_test` PostgreSQL database.

---

## 3. Remote Trackpad & Gamepad Pro (Flagship Systems Showcase)
- **Domain:** Systems Programming, Mobile Native, Real-Time Networking, Windows OS APIs.
- **Repository:** https://github.com/AgrShubham/Remote-trackpad-app
- **Release Downloads (`v1.0.0`):**
  - Windows Daemon: `RemoteMouseServer.exe` (27.5 MB standalone PyInstaller)
  - Android APK: `app-release.apk` (48.5 MB signed)
- **Tech Stack:** React Native 0.76, TypeScript, Python 3.11, UDP Sockets, WebSocket, Win32 `SendInput` (`user32.dll`), Android SDK 34.
- **Period:** Sep 2026 – Present
- **Key Technical Problems & Solutions:**
  1. *TCP Head-of-Line Blocking:* Standard WebSockets or TCP streams queue packets when packet loss occurs. If a touch packet suffers a 20ms Wi-Fi delay, all subsequent cursor deltas wait in the buffer, creating a noticeable freeze followed by a sudden jump.
     **Solution:** Architected an asynchronous UDP datagram stream over Port 5002. Discarded frames are safely ignored as fresh touch vectors arrive immediately. Cursor latency plummeted to **<1ms**.
  2. *Driverless Input Injection:* Traditional virtual gamepad/mouse tools require custom kernel drivers (`.sys`), prompting security warnings and triggering anti-cheat bans.
     **Solution:** Injected inputs into user-space Win32 `SendInput` API via ctypes/Python, providing zero-configuration execution.
  3. *Capacitive Digitizer Drift:* Touchscreens emit microscopic electrical noise (0.05px) when fingers rest stationary.
     **Solution:** Implemented an adaptive deadband threshold (`0.1px`) and kinetic velocity ballistics (`v_smooth = v_raw * (1.0 + min(2.5, v_raw * 0.6))`) with smoothing bypass on high-velocity flicks.

---

## 4. Shree Mewa (Production E-Commerce & Gifting Platform)
- **Domain:** Production Web Architecture, E-Commerce, UX Engineering.
- **Repository:** https://github.com/AgrShubham/ShreeMewa
- **Live Boutique:** https://shree-mewa.vercel.app/
- **Tech Stack:** React 19, TypeScript 5.8, Tailwind CSS v4, Vite 6, `React.lazy`, Web Share API, Schema.org JSON-LD, Vercel Analytics & Speed Insights, GA4.
- **Period:** Sep 2026 – Present
- **Key Technical Problems & Solutions:**
  1. *Cart Abandonment on Bespoke Gifting:* High-ticket wedding and corporate gift hampers (₹25,000+) face near 100% cart abandonment on standard credit card checkouts because clients demand personalized consultations.
     **Solution:** Replaced generic carts with an automated WhatsApp Concierge ordering pipeline that serializes chosen hamper weights, delivery tiers, and custom customer notes into a formatted deep-link directly to boutique owners.
  2. *Offline Procurement Catalogs:* Corporate procurement heads need printable PDF lookbooks for board approvals.
     **Solution:** Built a dedicated print stylesheet (`@media print`) and client-side print engine, producing formatted physical/PDF lookbooks on demand.

---

## 5. Remote Trackpad Web (Browser-Based Input Server)
- **Domain:** WebSockets, Browser APIs, Web Audio API, Zero-Install Architecture.
- **Repository:** https://github.com/AgrShubham/Remote_trackpad_web
- **Tech Stack:** Python 3.9+, Flask, Flask-SocketIO, JavaScript (ES6+), Web Audio API, Pynput.
- **Period:** Nov 2025 – Sep 2026
- **Key Technical Problems & Solutions:**
  1. *iOS Safari Vibration Restriction:* Safari blocks `navigator.vibrate()` on web pages for security reasons, preventing users from receiving haptic feedback when pressing virtual mechanical keys.
     **Solution:** Synthesized acoustic tactile feedback using the browser Web Audio API: twin audio oscillators generate an instant 1750Hz sharp snap followed by a 220Hz bottom-out clack with microsecond decay, delivering universal physical feedback across both iPhone and Android.
  2. *Event Flooding:* Emitting WebSocket events on raw `touchmove` triggers 120Hz packet flooding on high-refresh phones.
     **Solution:** Batched delta vectors using `requestAnimationFrame`, cutting WebSocket bandwidth by **40%** while maintaining smooth 60fps tracking.
