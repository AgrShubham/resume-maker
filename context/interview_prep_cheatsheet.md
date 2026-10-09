# Technical Interview Preparation Cheatsheet

Use these structured **STAR (Situation, Task, Action, Result)** narratives when interviewing for off-campus SDE, Systems, and Frontend roles:

---

## Story 1: "Tell me about a challenging technical problem you solved."
- **Situation:** While building *Remote Trackpad & Gamepad Pro*, early prototypes running over standard WebSockets suffered from micro-stutters and cursor jumps when Wi-Fi fluctuated.
- **Task:** Achieve sub-millisecond cursor latency with zero buffer bloat, matching Apple's Magic Trackpad feel without requiring users to install third-party kernel drivers.
- **Action:**
  1. Profiled network packets and identified TCP head-of-line blocking as the culprit.
  2. Decoupled the architecture into a hybrid model: kept stateful clicks and keys on TCP WebSockets, but shifted raw cursor coordinate vectors to asynchronous **UDP datagrams over Port 5002**.
  3. Tuned an exponential moving average (EMA) smoothing filter with a 0.1px deadband threshold to prevent touchscreen digitizer wobble.
  4. Injected cursor events into Windows user-space via Win32 `SendInput` (`user32.dll`).
- **Result:** Cut cursor latency from ~45ms down to **<1ms**, eliminating packet queue jumps and delivering 60fps tracking with zero external drivers.

---

## Story 2: "How do you approach real-world client requirements vs textbook coding?"
- **Situation:** Building the *Shree Mewa* digital platform for a luxury ceremonial dry fruits boutique.
- **Task:** The owner wanted an e-commerce platform, but initial data showed customers never completed raw credit-card checkout for customized ₹25,000+ hamper orders online without speaking to store managers.
- **Action:**
  1. Rather than forcing standard Stripe/Razorpay checkouts, designed an **automated WhatsApp Concierge Funnel**.
  2. Serialized custom selections (laser monogramming, box finishes, nut assortments) into structured WhatsApp deep-link payloads.
  3. Implemented a client-side print engine (`@media print`) for corporate procurement officers needing physical approval sheets.
- **Result:** Accelerated high-ticket client lead conversion and eliminated custom hamper cart abandonment.

---

## Core Technical Questions & Answers

### Q: Why UDP instead of TCP for mouse movement?
**A:** TCP guarantees delivery and in-order packet arrival through ACKs and retransmissions. If packet #4 is lost, packets #5, #6, and #7 are held in the receiver buffer (head-of-line blocking). For real-time cursor streaming, a delayed coordinate from 50ms ago is useless because the user's hand has already moved. UDP drops late packets without waiting, ensuring the screen always displays the freshest cursor position with sub-millisecond latency.

### Q: How did you implement Web Audio feedback for iOS?
**A:** iOS Safari disables the Vibration API (`navigator.vibrate`) for security policies. Using the browser's `AudioContext`, I synthesized dual oscillator frequencies: a 1750Hz sine wave mimicking the tactile snap of a Cherry MX switch, followed immediately by a damped 220Hz square wave simulating the key bottoming out on the keyboard plate.
