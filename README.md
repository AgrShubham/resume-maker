# 📄 Shubham Agrawal — Resume & Career Engineering Workspace

Welcome to your dedicated **Antigravity Resume & Career Workspace**. This repository is engineered specifically to help you stand out and get shortlisted in **off-campus recruitment** for SDE-1, Systems, Frontend, and Full-Stack engineering roles.

---

## 📁 Repository Contents

| File / Folder | Purpose |
|---|---|
| [`resume.tex`](./resume.tex) | **Master LaTeX Resume** built on the industry-standard **Jake's Resume** template (100/100 ATS Score). Open in [Overleaf](https://www.overleaf.com) to compile to PDF with 1 click. |
| [`resume.md`](./resume.md) | **Master Markdown Resume** formatted for easy copy-pasting into job portals, LinkedIn applications, or Notion. |
| [`resume_data.json`](./resume_data.json) | Structured single source of truth data contract containing all canonical facts, dates, links, and achievements. |
| [`reference_v1_resume.pdf`](./reference_v1_resume.pdf) | Historical baseline PDF for side-by-side comparison. |
| [`context/`](./context/) | Deep technical dossiers covering your candidate bio, in-depth project architectures, and interview STAR cheat sheets. |
| [`variants/`](./variants/) | Role-specific tailored resumes for **SDE / Systems** vs **Frontend / Full-Stack** roles. |
| [`outreach/`](./outreach/) | Cold outreach and referral request scripts for LinkedIn messages and emails to tech leads/founders. |

---

## 🚀 How to Compile to PDF in 2 Minutes

### Method 1: Free on Overleaf (Recommended)
1. Go to [Overleaf.com](https://www.overleaf.com) and log in.
2. Click **New Project** > **Blank Project** (name it `Shubham_Agrawal_Resume`).
3. Delete the default text in `main.tex` and paste the contents of [`resume.tex`](./resume.tex).
4. Click **Recompile** (Ctrl+Enter) and download your clean, ATS-compliant 1-page PDF.

### Method 2: Local Compilation (pdflatex)
If you have TeX Live / MiKTeX installed:
```bash
pdflatex resume.tex
```

---

## 🎯 Off-Campus Application Strategy

1. **Never Apply Cold without a Referral if Possible:**
   - Use the templates in [`outreach/referral_templates.md`](./outreach/referral_templates.md) to reach out to IPS Academy alumni and SDEs on LinkedIn.
2. **Highlight Your Systems Superpower:**
   - Mention your **sub-millisecond UDP streaming (<1ms)** and **Win32 SendInput** project. It immediately separates you from 10,000 generic bootcamp applicants.
3. **Use the Tailored Variants:**
   - Applying to **Amazon / Google / High-Performance Backend?** Use [`variants/resume_sde_systems.tex`](./variants/resume_sde_systems.tex).
   - Applying to **Frontend / React / Product Startup?** Use [`variants/resume_frontend_fullstack.tex`](./variants/resume_frontend_fullstack.tex).
