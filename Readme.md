<div align="center">

<h1>Meduza VIP</h1>

<p>
  <img src="https://img.shields.io/badge/Python-3.12+-blue?style=for-the-badge&logo=python">
  <img src="https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20Termux-informational?style=for-the-badge">
  <img src="https://img.shields.io/badge/Type-Stripe%20Charge%20$1-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Threads-Multithreaded-important?style=for-the-badge">
</p>

<p><strong>Stripe Charge $1 (Non-SK) Card Checker v1.4</strong></p>

<img src="https://raw.githubusercontent.com/KianSantang777/stripechk/refs/heads/main/2.png" width="600" alt="Stripe Checker Preview">

</div>

<hr>

<h2>Overview</h2>

<p>
<strong>Stripe Checker</strong> is a Python-based tool designed to validate credit cards by performing a
<strong>$1 Stripe charge (pre-authorization)</strong> using a
<strong>publishable key (pk_live)</strong>, without requiring a Stripe Secret Key (SK).
</p>

<p>
Each card is processed by creating or attaching a payment method and attempting a small charge.
Cards that return a successful response are marked as <strong>LIVE</strong>, while failed attempts
are marked as <strong>DECLINED</strong>.
</p>

<hr>

<h2>Key Features</h2>

<ul>
  <li>Stripe $1 charge using publishable key (Non-SK)</li>
  <li>Multi-threaded processing (1–5 threads)</li>
  <li>Optional proxy support</li>
  <li>Proxyless operation supported</li>
  <li>Automatic saving of live cards</li>
  <li>UTF-8 input file support</li>
  <li>Cross-platform compatibility</li>
</ul>

<hr>

<h2>System Requirements</h2>

<ul>
  <li>
    Python 3.12 or newer  
    (<a href="https://www.python.org/downloads/release/python-3120/" target="_blank">
    Download Python 3.12.0
    </a>)
  </li>
  <li>pip (Python package manager)</li>
  <li>Git (optional, for cloning the repository)</li>
</ul>

<hr>

<h2>Screenshot</h2>

<p align="center">
  <img src="https://raw.githubusercontent.com/KianSantang777/stripechk/refs/heads/main/1.png" width="700" alt="Stripe Checker Screenshot">
</p>

<hr>

<h2>Installation</h2>

<h3>Termux (Android)</h3>

<pre><code>pkg update -y
pkg install git curl python -y
curl -fsSL https://raw.githubusercontent.com/KianSantang777/stripechk/main/install.sh | bash
</code></pre>

<h3>Linux / Ubuntu</h3>

<pre><code>sudo apt update -y
sudo apt install git curl python3 python3-pip -y
curl -fsSL https://raw.githubusercontent.com/KianSantang777/stripechk/main/install.sh | bash
</code></pre>

<h3>Windows (CMD / PowerShell)</h3>

<ol>
  <li>Download and install Python 3.12.0:
    <a href="https://www.python.org/downloads/release/python-3120/" target="_blank">
      https://www.python.org/downloads/release/python-3120/
    </a>
  </li>
  <li>Download the repository as a ZIP file</li>
  <li>Extract the ZIP archive</li>
  <li>Open the project folder in Command Prompt or PowerShell</li>
  <li>Install dependencies:
    <pre><code>python -m pip install -r requirements.txt</code></pre>
  </li>
  <li>Run the application:
    <pre><code>python card.py</code></pre>
  </li>
</ol>

<hr>

<h2>Usage</h2>

<pre><code>python card.py -f &lt;file&gt; [-p &lt;proxy&gt;] [-t &lt;threads&gt;] --run
</code></pre>

<h3>Examples</h3>

<pre><code>python card.py -f cards.txt --run
python card.py -f cards.txt -t 5 --run
python card.py -f cards.txt -p http://127.0.0.1:8080 --run
python card.py -f cards.txt -p user:pass@1.2.3.4:8080 -t 3 --run
</code></pre>

<hr>

<h2>Command Line Options</h2>

<table>
  <tr>
    <th>Option</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>-h, --help</td>
    <td>Display the help message</td>
  </tr>
  <tr>
    <td>-f, --file</td>
    <td>Path to the input file (UTF-8 text format)</td>
  </tr>
  <tr>
    <td>-p, --proxy</td>
    <td>Proxy server (optional)</td>
  </tr>
  <tr>
    <td>-t, --threads</td>
    <td>Number of threads (1–5, default: 5)</td>
  </tr>
  <tr>
    <td>--run</td>
    <td>Start the checking process</td>
  </tr>
</table>

<hr>

<h2>Output</h2>

<p>
All successfully charged cards are automatically saved to:
</p>

<pre><code>livecard.txt</code></pre>

<p>Output format:</p>

<pre><code>cc|mm|yy|cvv|succeeded|scheme|type|country|bank</code></pre>

<hr>

<h2>Author</h2>

<p>
<strong>Kian Santang DEV</strong><br>
GitHub: <a href="https://github.com/KianSantang777">https://github.com/KianSantang777</a><br>
Telegram: <a href="https://t.me/xqndrs66">@xqndrs66</a>
</p>

<hr>

<h2>Disclaimer</h2>

<p>
This project is provided strictly for educational and testing purposes.
</p>

<p>
The author assumes no responsibility for misuse, illegal activity, or any resulting damages.
Use this software responsibly and in compliance with applicable laws.
</p>
