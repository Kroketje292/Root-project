# Uitprobeersel
Simple web server. Download and install one of the scripts in the script(s) folder and run it on a Linux (Ubuntu) or Windows server machine.

# For Ubuntu
Execute the script as root <br>
Example: sudo ./install-webserver(Ubuntu-only)

# For Windows server
The "Install-website-for-Windows" script exclusively handles the installation of the website content and does NOT include the installation of a web server.
This can be done by following these steps:
- Open the IIS manager (if installed. Otherwise install IIS first)
- Go to sites and click on add website
- Give the site a name and add the physical path of the website contents you just downloaded via the script (for example: C:\Website\uitprobeersel)
- Make sure you disable or remove the default website. Having both websites active on the same port wil cause conflicts.
