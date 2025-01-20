// Het te raden getal
let numberGuesser = 5;

// Vraag de gebruiker om een getal te raden
let numberGuessed = parseInt(prompt("Raad het getal (1 tot en met 10)"), 10);

// Blijf vragen totdat het geraden getal correct is
while (numberGuessed !== numberGuesser) {
    if (numberGuessed > numberGuesser) {
        console.log("Het getal is lager");
    } else if (numberGuessed < numberGuesser) {
        console.log("Het getal is hoger");
    }
    // Vraag opnieuw
    numberGuessed = parseInt(prompt("Probeer het opnieuw"), 10);
}

// Gefeliciteerd als het geraden is
console.log("Gefeliciteerd! Je hebt het juiste getal geraden.");
