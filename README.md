# Uitprobeersel
Simple web server. Download and install one of the scripts in the script(s) folder and run it on a Linux (Ubuntu) or Windows server machine.

# For Ubuntu
Copy the script to your ubuntu machine. <br>

Make sure you give the script the correct permissions <br>
*Example*: ***sudo chmod 777 install-webserver(Ubuntu-only)*** <br>

Execute the script as root <br>
*Example*: ***sudo ./install-webserver(Ubuntu-only)*** <br>

This script can also be used to update the website if changes have been made <br>

<button onclick="copyToClipboard('sudo chmod 777 install-webserver(Ubuntu-only)')">Copy chmod command</button>
<button onclick="copyToClipboard('sudo ./install-webserver(Ubuntu-only)')">Copy execute command</button>

# For Windows server
The "Install-website-for-Windows" script exclusively handles the installation of the website content and does NOT include the installation of a web server.
You can do this by following these steps:
- Open the IIS manager (if installed. Otherwise install IIS first)
- Go to sites and click on add website
- Give the site a name and add the physical path of the website contents you just downloaded via the script (for example: C:\Website\uitprobeersel)
- Make sure you disable or remove the default website. Having both websites active on the same port wil cause conflicts.


<script>
function copyToClipboard(text) {
  const textArea = document.createElement('textarea');
  textArea.value = text;
  document.body.appendChild(textArea);
  textArea.select();
  document.execCommand('copy');
  document.body.removeChild(textArea);
  alert('Command copied to clipboard!');
}
</script>
