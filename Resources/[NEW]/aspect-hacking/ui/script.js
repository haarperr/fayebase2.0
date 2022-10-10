let incorrectsubmission = 0
let successpass = 0
let allowedpass = false

let bankusername = ""
let bankpassword = ""

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
        $('.container-firsthack').hide();
        $.post('http://aspect-hacking/closenui', JSON.stringify({}));
    }
};

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'starthack') {
        bankusername = `${data.username}`
        bankpassword = `${data.password}`
        $('.container-firsthack').fadeIn();
        incorrectsubmission = 0;
        successpass = 0;
        allowedpass = false;
	}
})

let wordselection = ['Alpha', 'Bravo', 'Charlie', 'Delta', 'Echo', 'Foxtrot', 'Golf' , 'Hotel', 'India', 'Juliett', 'Kilo', 'Lima', 'Mike', 'November', 'October', 'Papa', 'Quebec', 'Romeo', 'Sierra', 'Tango', 'Uniform', 'Victor', 'Whiskey', 'Xray', 'Yankee', 'Zulu']

function enterdatabase() {
    var username = document.getElementById("usernameinput").value;
    var password = document.getElementById("passwordinput").value;

    if (username == bankusername && password == bankpassword && username !== "") {
        $('.stage-one').fadeOut();
        $('.stage-two').fadeIn();

        document.getElementById("stage1button").style.backgroundColor = "#373f36";
        document.getElementById("stage2button").style.backgroundColor = "#40693b";
        stage2active();
    } else {
        $.post('http://aspect-hacking/incorrectdata', JSON.stringify({}));
        $('.container-firsthack').fadeOut();
    }
}

let hackingsequenceanswer = ""

function stage2active() {
    move();
    // Generate 4 Random Numbers
    var num1 = Math.floor(Math.random() * 12) + 1;
    var num2 = Math.floor(Math.random() * 12) + 1;
    var num3 = Math.floor(Math.random() * 12) + 1;
    var num4 = Math.floor(Math.random() * 12) + 1;

    // Display 4 Random Numbers
    document.getElementById("hackingoutputwords").innerHTML = num1 + " , " + num2 + " , " + num3 + " , " + num4;

    // Generate 12 random words and assign to values
    var worddisplay1 = wordselection[Math.floor(Math.random() * 25) + 1];
    var worddisplay2 = wordselection[Math.floor(Math.random() * 25) + 1];
    var worddisplay3 = wordselection[Math.floor(Math.random() * 25) + 1];
    var worddisplay4 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay5 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay6 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay7 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay8 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay9 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay10 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay11 = wordselection[Math.floor(Math.random() * 25) + 1];
    // var worddisplay12 = wordselection[Math.floor(Math.random() * 25) + 1];

    var displayedwords = [worddisplay1,worddisplay2,worddisplay3,worddisplay4]

    document.getElementById("display1").innerHTML = "[1] " + worddisplay1;
    document.getElementById("display2").innerHTML = "[2] " + worddisplay2;
    document.getElementById("display3").innerHTML = "[3] " + worddisplay3;
    document.getElementById("display4").innerHTML = "[4] " + worddisplay4;
    // document.getElementById("display5").innerHTML = "[5] " + worddisplay5;
    // document.getElementById("display6").innerHTML = "[6] " + worddisplay6;
    // document.getElementById("display7").innerHTML = "[7] " + worddisplay7;
    // document.getElementById("display8").innerHTML = "[8] " + worddisplay8;
    // document.getElementById("display9").innerHTML = "[9] " + worddisplay9;
    // document.getElementById("display10").innerHTML = "[10] " + worddisplay10;
    // document.getElementById("display11").innerHTML = "[11] " + worddisplay11;
    // document.getElementById("display12").innerHTML = "[12] " + worddisplay12;

    var answerhere = (displayedwords[num1-1]+" "+displayedwords[num2-1]+" "+displayedwords[num3-1]+" "+displayedwords[num4-1])
    hackingsequenceanswer = answerhere
}


function hackinganswer() {
    var answer = document.getElementById("inputanswerhack").value;

    if (answer.toUpperCase() == hackingsequenceanswer.toUpperCase()) {
        $('.stage-success').fadeIn();
        allowedpass = true;
        document.getElementById("inputanswerhack").value = "";
        setTimeout(function(){
            successpass = successpass+1;

            if (successpass == 3) {
                $('.stage-two').fadeOut();
                $('.stage-success').fadeOut();
                $('.stage-three').fadeIn();
                document.getElementById("stage2button").style.backgroundColor = "#373f36";
                document.getElementById("stage3button").style.backgroundColor = "#40693b";
            }
            setTimeout(function(){
                $('.stage-success').fadeOut();
                allowedpass = false;
                stage2active()
            }, 3000);
        }, 3000);

    } else {
        incorrectsubmission = incorrectsubmission+1;

        if (incorrectsubmission == 3) {
            $('.stage-failure').fadeIn();
            setTimeout(function(){
                $('.container-firsthack').fadeOut();
                $('.stage-failure').fadeOut();
                $.post('http://aspect-hacking/failure', JSON.stringify({}));
                $('.stage-two').fadeOut();
                $('.stage-one').fadeIn();
            }, 3000);
        }

    }
}

function injecttrojan() {
    $('.container-firsthack').fadeOut();
    $('.stage-three').fadeOut();
    document.getElementById("stage3button").style.backgroundColor = "#373f36";
    document.getElementById("stage1button").style.backgroundColor = "#40693b";
    $.post('http://aspect-hacking/hackingsuccessfull', JSON.stringify({}));
}

function move() {
    var elem = document.getElementById("myBar");   
    var width = 1;
    var id = setInterval(frame, 55);
    function frame() {
      if (width >= 100) {
            clearInterval(id);
            if (allowedpass == false) {
                $('.stage-failure').fadeIn();
                setTimeout(function(){
                $('.container-firsthack').fadeOut();
                $.post('http://aspect-hacking/failure', JSON.stringify({}));
                $('.stage-failure').fadeOut();
                $('.stage-two').fadeOut();
                $('.stage-one').fadeIn();
                }, 3000);
            }
      } else {
        width=width+0.5; 
        elem.style.width = width + '%'; 
        if (allowedpass == true) {
            clearInterval(id);
        }
      }
    }
  }