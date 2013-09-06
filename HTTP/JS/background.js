var numberStars = Math.floor((Math.random() * 100) + 101);
var moonsMovement;

function GenerateStars() {
    for (var i = 0; i < numberStars; i++) {
        var star = document.createElement('div');
        star.setAttribute("id", "star-" + i);
        star.setAttribute("class", "star");
        document.getElementById("stars").appendChild(star);
        StarSize("star-" + i);
        StarLocation("star-" + i);
    }

    TwinkleStars();
}

function StarSize(star) {
    var size = Math.floor((Math.random() * 5) + 1);
    document.getElementById(star).style.width = size + "px";
    document.getElementById(star).style.height = size + "px";
}

function StarLocation(star) {
    var left = (Math.random() * 100).toFixed(2);
    var top = (Math.random() * 100).toFixed(2);
    document.getElementById(star).style.left = left + "%";
    document.getElementById(star).style.top = top + "%";
}

function TwinkleStars() {
    var twinklingStars = ["", "", "", "", ""];
    setInterval(function() {ApplyTwinkle(twinklingStars[0]);}, 800);
    setInterval(function() {ApplyTwinkle(twinklingStars[1]);}, 900);
    setInterval(function() {ApplyTwinkle(twinklingStars[2]);}, 1000);
    setInterval(function() {ApplyTwinkle(twinklingStars[2]);}, 1100);
    setInterval(function() {ApplyTwinkle(twinklingStars[2]);}, 1200);
}

function ApplyTwinkle(star) {
    star = "star-" + Math.floor(Math.random() * numberStars);
    if (document.getElementById(star) != null) {
        document.getElementById(star).setAttribute("class", "star twinkle");
        setTimeout(function() {RemoveTwinkle(star);}, 500);
    }
}

function RemoveTwinkle(star) {
    if (document.getElementById(star) != null) {
        document.getElementById(star).setAttribute("class", "star");
    }
}

function GenerateMoon() {
    //Determine size and location
    var left = ((Math.random() * 101) - 10).toFixed(2);
    var top = ((Math.random() * 101) - 10).toFixed(2);
    var size = Math.floor((Math.random() * 21) + 20);

    //Change size from % to px
    size = document.height * size / 100;

    document.getElementById("moon").style.left = left + "%";
    document.getElementById("moon").style.top = top + "%";
    document.getElementById("moon").style.height = size + "px";
    document.getElementById("moon").style.width = size + "px";

    ShadingTheMoon();

    var vertical = 0;
    var horizontal = 0;
    if (top <= 40) {
        vertical = 2;
    } else if (top >= 60) {
        vertical = 0;
    } else {
        vertical = 0;
    }
    if (left <= 40) {
        horizontal = 2;
    } else if (left >= 60) {
        horizontal = 0;
    } else {
        horizontal = 0;
    }

    moonsMovement = setInterval(function() {MovingTheMoon(vertical, horizontal);}, 800);
}

function ShadingTheMoon() {
    //This function will need to add some random shading to the moon, giving it some texture.
}

function MovingTheMoon(vertical, horizontal) {
    if (vertical == 0) {
        document.getElementById("moon").style.top = document.getElementById("moon").style.top.slice(0, -1) - 0.05 + "%";
    } else if (vertical == 2) {
        document.getElementById("moon").style.top = document.getElementById("moon").style.top.slice(0, -1) + 0.05 + "%";
    }
    if (horizontal == 0) {
        document.getElementById("moon").style.left = document.getElementById("moon").style.left.slice(0, -1) - 0.05 + "%";
    } else if (horizontal == 2) {
        document.getElementById("moon").style.left = document.getElementById("moon").style.left.slice(0, -1) + 0.05 + "%";
    }

    if (document.getElementById("moon").style.left.slice(0, -1) >= 100 || document.getElementById("moon").style.left.slice(0, -1) <= -40 ||
        document.getElementById("moon").style.top.slice(0, -1) >= 100 || document.getElementById("moon").style.top.slice(0, -1) <= -40) {
        clearInterval(moonsMovement);
    }
}

function GenerateBackground() {
    GenerateStars();
    GenerateMoon();
}