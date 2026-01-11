<div align="center">

<h1>Stripe Checker</h1>

<p>
  <img src="https://img.shields.io/badge/Python-3.12+-blue?style=for-the-badge&logo=python">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20Termux-informational?style=for-the-badge">
  <img src="https://img.shields.io/badge/Type-Stripe%20PreAuth-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Threads-Multithreaded-important?style=for-the-badge">
</p>

<p>
  <a href="https://github.com/KianSantang777/stripechk">
    <img src="https://img.shields.io/github/stars/KianSantang777/stripechk?style=for-the-badge">
  </a>
  <a href="https://github.com/KianSantang777/stripechk">
    <img src="https://img.shields.io/github/forks/KianSantang777/stripechk?style=for-the-badge">
  </a>
  <a href="https://github.com/KianSantang777/stripechk">
    <img src="https://img.shields.io/github/last-commit/KianSantang777/stripechk?style=for-the-badge">
  </a>
  <a href="https://github.com/KianSantang777/stripechk">
    <img src="https://img.shields.io/github/repo-size/KianSantang777/stripechk?style=for-the-badge">
  </a>
</p>

<img src="https://raw.githubusercontent.com/KianSantang777/stripechk/refs/heads/main/2.png" alt="Stripe Checker Preview" width="600">

<p><strong>Stripe Pre-Authorization Card Checker</strong></p>

<hr>

</div>

<h2>Overview</h2>

<p>
<strong>Stripe Checker</strong> is a high-performance Python-based tool that uses the Stripe API with a live publishable key (<code>pk_live</code>) to validate credit cards.
</p>

<p>
The checker works by attempting to attach each card as a payment method. If the operation succeeds, the card is marked as <strong>LIVE</strong>.
</p>

<p>
This tool is designed to be fast, lightweight, multi-threaded, and easy to use across multiple platforms.
</p>

<hr>

<h2>Features</h2>

<ul>
  <li>Proxyless (no proxy required)</li>
  <li>Multi-threaded for high-speed checking</li>
  <li>Automatically saves live cards to <code>livecard.txt</code></li>
  <li>Cross-platform support:
    <ul>
      <li>Windows (CMD / PowerShell)</li>
      <li>Linux</li>
      <li>Ubuntu</li>
      <li>Termux (Android)</li>
    </ul>
  </li>
</ul>

<hr>

<h2>Screenshot</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/KianSantang777/stripechk/refs/heads/main/1.png" alt="Screenshot" width="700">
</p>

<hr>

<h2>Requirements</h2>

<ul>
  <li>Python 3.12.0 or newer</li>
  <li>pip (Python package manager)</li>
  <li>Git (optional, for cloning repository)</li>
</ul>

<hr>

<h2>Installation</h2>

<h3>Termux / Linux / Ubuntu</h3>

<pre><code>termux-setup-storage
apt update &amp;&amp; apt upgrade -y
apt install git python python2 nano -y
git clone https://github.com/KianSantang777/stripechk.git
cd stripechk
chmod +x install.sh
./install.sh
</code></pre>

<h3>Windows</h3>

<ol>
  <li>Download ZIP:<br>
    <a href="https://github.com/KianSantang777/stripechk/archive/refs/heads/main.zip">
      https://github.com/KianSantang777/stripechk/archive/refs/heads/main.zip
    </a>
  </li>
  <li>Extract the ZIP file</li>
  <li>Open the folder in CMD or PowerShell</li>
  <li>Install dependencies:
    <pre><code>python -m pip install -r requirements.txt</code></pre>
  </li>
  <li>Run the program:
    <pre><code>python card.py</code></pre>
  </li>
</ol>

<hr>

<h2>How It Works</h2>

<ol>
  <li>The tool uses a Stripe <code>pk_live</code> key</li>
  <li>For each card, it attempts to create or attach a payment method</li>
  <li>If Stripe returns success, the card is marked as <strong>LIVE</strong></li>
  <li>If Stripe returns an error, the card is marked as <strong>DECLINED</strong></li>
  <li>All live cards are saved automatically to:
    <pre><code>livecard.txt</code></pre>
  </li>
</ol>

<hr>

<h2>Author</h2>

<p>
<strong>KianSantang DEV</strong><br>
Project Repository:<br>
<a href="https://github.com/KianSantang777/stripechk">
https://github.com/KianSantang777/stripechk
</a>
</p>

<hr>

<h2>Contact</h2>

<p>
<a href="mailto:berandalan.cyber@outlook.com">
  <img src="https://img.shields.io/badge/Email-berandalan.cyber@outlook.com-blue?style=for-the-badge&logo=gmail">
</a>
</p>

<p>
<a href="https://t.me/xqndrs66">
  <img src="https://img.shields.io/badge/Telegram-@xqndrs66-blue?style=for-the-badge&logo=telegram">
</a>
</p>

<hr>

<h2>Disclaimer</h2>

<p>
This tool is provided for educational and testing purposes only.
</p>

<p>
The author is not responsible for any misuse of this software.
</p>
