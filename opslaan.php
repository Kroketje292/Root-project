<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $message = $_POST["message"];

    // Het volledige pad naar de specifieke map
    $opslagmap = "user_data/";

    // Zorg ervoor dat de map bestaat, anders maak deze aan
    if (!file_exists($opslagmap)) {
        mkdir($opslagmap, 0755, true);
    }

    // Het volledige pad naar het opslagbestand
    $opslagbestand = $opslagmap . "gegevens.txt";

    // Opslaan van gegevens in het opslagbestand
    file_put_contents($opslagbestand, "$name, $email, $message\n", FILE_APPEND);

    // Bevestiging voor de gebruiker
    echo "Bedankt, $name! Je gegevens zijn opgeslagen.";
}
?>
