#import "@preview/ats-friendly-resume:0.1.1": *

// =========================
// Custom Date Format
// =========================

#let custom-dates(start-date, end-date) = {
  if end-date == "" {
    start-date
  } else {
    [
      #start-date
      #h(2pt)
      #text(size: 7pt, weight: "bold")[-]
      #h(2pt)
      #end-date
    ]
  }
}

// =========================
// Personal Information
// =========================

#let name = "Shubham Agrawal"
#let email = "shubhamagrawal.code@gmail.com"
#let phone = "+91 8825388041"
#let linkedin = "linkedin.com/in/shubham-agrawal-dev"
#let github = "github.com/AgrShubham"

#show: resume.with(
  author: name,
  author-position: center,
  email: email,
  phone: phone,
  linkedin: linkedin,
  github: github,
  personal-info-position: center,
  color-enabled: false,
  text-color: "#000080",
  font: "lato",
  paper: "a4",
  author-font-size: 18pt,
  font-size: 8.7pt,
  lang: "en",
)

// ==========================================
// Full Justification & Layout Spacing Rules
// ==========================================

#set par(justify: true, leading: 0.52em)
#show list.item: set par(justify: true)
#set list(spacing: 4.8pt)

// =========================
// Technical Skills
// =========================

== Technical Skills

- *Languages*: TypeScript, JavaScript (ES6+), Python, Java, SQL, C
- *Frontend & Mobile*: React.js (React 19), Next.js, React Native, Tailwind CSS (v4), Vite, HTML5 Canvas, Web Audio API
- *React Architecture*: Component Architecture, Custom Hooks, State Management, Props & Context API, Virtual DOM, Error Boundaries
- *Backend & Networking*: Node.js, Express, RESTful APIs, WebSockets (Socket.IO), UDP Sockets, Flask, Postman
- *Developer Tools & Testing*: Git, GitHub, Chrome DevTools, Google Lighthouse, Android Studio, VS Code, Linux

// =========================
// Work Experience
// =========================

== Work Experience

#work(
  company: "Amnesea",
  role: "Frontend Web Development Intern",
  dates: custom-dates("May 2023", "Jul 2023"),
  location: "Remote",
)
- Developed 15+ modular React and Tailwind CSS components from UI mockups, building responsive, accessible web pages across mobile and desktop viewports.
- Integrated backend RESTful API endpoints, handling asynchronous data fetching, loading states, and graceful client-side error boundaries.
- Improved initial page-load performance by ~35% (audited via Google Lighthouse) through image asset compression, script deferral, and component lazy-loading.
- Resolved cross-browser layout and styling bugs across Chrome, Safari, and Firefox; collaborated with senior developers via GitHub pull request reviews and daily standups.

// =========================
// Featured Projects
// =========================

== Featured Projects

#project(
  name: "Shree Mewa — Commercial Boutique & Gifting E-Commerce Store",
  dates: custom-dates("Sep 2026", "Present"),
  tech-used: "React 19 | TypeScript 5.8 | Tailwind CSS v4 | Vite 6 | Web Share API",
  url: "github.com/AgrShubham/ShreeMewa",
)
- Architected and deployed a commercial web application for a premier luxury gifting boutique, translating complex bespoke packaging workflows into an interactive, mobile-responsive UI.
- Built a custom React state-driven hamper builder with real-time price calculation, dynamic box finish selection, and laser monogram personalization preview.
- Eliminated cart abandonment on custom hampers (Rs. 25,000+) by engineering an automated WhatsApp concierge checkout funnel encoding configurations into deep-links.
- Optimized frontend asset delivery with Vite 6 and Tailwind CSS v4, achieving near-instant initial render (under 0.8s) and smooth 60fps micro-interactions.
- Built a client-side digital lookbook print engine using custom CSS \@media print stylesheets, enabling instant generation of formatted offline PDF procurement catalogs.

#project(
  name: "Remote Trackpad & Gamepad Pro — Turn Smartphone into PC Trackpad & Gamepad",
  dates: custom-dates("Sep 2026", "Present"),
  tech-used: "React Native | TypeScript | Python 3.11 | Android SDK | UDP Sockets | Win32 API",
  url: "github.com/AgrShubham/Remote-trackpad-app",
)
- Engineered a cross-platform mobile application using *React Native* turning Android devices into a customizable trackpad, 3-mode gamepad (Xbox/PS), and keyboard.
- Eliminated TCP head-of-line blocking by architecting a custom UDP datagram streaming pipeline over Port 5002 with *under 1ms execution latency* into Win32 APIs.
- Engineered mathematical velocity ballistics with 0.1px deadband filtering, eliminating touchscreen digitizer jitter while enabling single-pixel precision.
- Architected configurable UI layouts with real-time deadband tuning (5%--30%), sensitivity controls (0.5x--2.5x), and tactile haptic vibration modulation.

#project(
  name: "Remote Trackpad Web — Turn Smartphone Browser into PC Mouse",
  dates: custom-dates("Nov 2025", "Sep 2026"),
  tech-used: "JavaScript (ES6+) | Web Audio API | WebSockets | Socket.IO | Flask | Pynput",
  url: "github.com/AgrShubham/Remote_trackpad_web",
)
- Engineered a zero-installation mobile web application enabling smartphone browsers on local Wi-Fi to control desktop cursor navigation with real-time WebSocket sync.
- Synthesized real-time tactile acoustic feedback using the *Web Audio API* (1750Hz snap + 220Hz clack), bypassing iOS Safari native vibration restrictions.
- Synchronized client touch events using requestAnimationFrame batching, eliminating layout thrashing and cutting WebSocket bandwidth by 40% while maintaining 60fps tracking.
- Implemented multi-touch gesture recognition for 2-finger inertial scrolling, virtual drag-and-drop, and desktop media control shortcuts.

// =========================
// Education
// =========================

== Education

#edu(
  institution: "Institute of Engineering and Science, IPS Academy",
  location: "Indore, India",
  degree: "Bachelor of Technology in Computer Science & Engineering",
  dates: custom-dates("Sep 2021", "May 2025"),
)
- *Coursework*: Data Structures & Algorithms, Object-Oriented Programming (OOP), DBMS, Operating Systems, Computer Networks

// =========================
// Honors & Certifications
// =========================

== Honors & Certifications

- *2nd Position (Runner-up)*: Udaan 2024 CSI (Computer Society of India) National Project Exhibition
- *React.js Essential Training* (LinkedIn Learning): Component lifecycle, custom hooks, state architecture, virtual DOM reconciliation
- *AWS Academy Graduate — Cloud Foundations*: EC2 Compute, S3 Storage, IAM Security, VPC Architecture
- *AWS Academy Graduate — Machine Learning Foundations*: Machine Learning Pipelines, Computer Vision, AWS SageMaker
