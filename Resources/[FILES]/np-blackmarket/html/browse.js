$(function() {
    $(".firefox-browser").hide();
    $(".system-actions").hide();
    $(".blackmarket-browser").hide();
    // FIREFOX

    $("#firefox-button").click(function() {
        $(".firefox-browser").hide(0);
        $(".firefox-browser").fadeIn(100);
        $(".system-actions").hide();
        $(".blackmarket-browser").hide();

        dragElement(document.getElementById("firefox-browser"));

        function dragElement(elmnt) {
        var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        if (document.getElementById("firefox-header")) {
            document.getElementById("firefox-header").onmousedown = dragMouseDown;
        } else {
            elmnt.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
        }
    });
    $("#close-firefox").click(function() {
        $(".firefox-browser").fadeOut(100);
    });
    $("#close-firefox-2").click(function() {
        $(".firefox-browser").fadeOut(100);
    });
    $("#system-actions-trigger").click(function() {
        $(".system-actions").fadeIn();
    });
    $("#close-actions-menu").click(function() {
        $(".system-actions").fadeOut();
    });

    function LoadingPurchase(){
      alert('HELLO')
    }

    // blackmarket

    $("#blackmarket-trigger").click(function() {
      $(".firefox-browser").hide();
        $(".blackmarket-browser").fadeIn(300);
        dragElement(document.getElementById("blackmarket-browser"));

        function dragElement(elmnt) {
        var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
        if (document.getElementById("blackmarket-browser")) {
            document.getElementById("blackmarket-browser").onmousedown = dragMouseDown;
        } else {
            elmnt.onmousedown = dragMouseDown;
        }

        function dragMouseDown(e) {
            e = e || window.event;
            e.preventDefault();
            pos3 = e.clientX;
            pos4 = e.clientY;
            document.onmouseup = closeDragElement;
            document.onmousemove = elementDrag;
        }

        function elementDrag(e) {
            e = e || window.event;
            e.preventDefault();
            pos1 = pos3 - e.clientX;
            pos2 = pos4 - e.clientY;
            pos3 = e.clientX;
            pos4 = e.clientY;
            elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
            elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
        }

        function closeDragElement() {
            document.onmouseup = null;
            document.onmousemove = null;
        }
        }
    });
    $("#blackmarket-info-close").click(function() {
        $(".blackmarket-info").hide();
    });
    $("#blackmarket-close").click(function() {
        $(".blackmarket-browser").fadeOut(100);
    });
    $("#close-blackmarket-2").click(function() {
        $(".blackmarket-browser").fadeOut(100);
    });
    $("#last-page").click(function() {
        $(".firefox-browser").show();
        $(".system-actions").hide();
        $(".blackmarket-browser").hide();
    });

    $("#firefox-refresh").click(function() {
        $(".firefox-browser").fadeOut(50);
        $(".firefox-browser").fadeIn(50);
    });
    
    $("#blackmarket-refresh").click(function() {
        $(".blackmarket-browser").fadeOut(50);
        $(".blackmarket-browser").fadeIn(50);
    });

    // CLOSE COMPLETE UI
    function close(){
      $(".blackmarket-body").delay(2500).fadeIn();
      $("#processTXT").delay(2500).fadeOut();
      $(".loader").delay(2500).fadeOut();
      setTimeout(() => {  
        $.post('http://np-blackmarket/exit', JSON.stringify({}));
       }, 2900);

    }
    
    $("#close").click(function () {
      $.post('http://np-blackmarket/exit', JSON.stringify({}));
      return
    });

    // Blackmarket ORDERS

    $("#blackmarket-1-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "heistlaptop3",
          price: 20000,
          amount: 1
      }))
    });
    $("#blackmarket-2-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "methtable",
          price: 100000,
          amount: 1
      }))
    });
    $("#blackmarket-3-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "Gruppe6Card",
          price: 10000,
          amount: 1
      }))
    });
    $("#blackmarket-4-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "thermite",
          price: 2500,
          amount: 1
      }))
    });
    $("#blackmarket-5-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "craftbench",
          price: 50000,
          amount: 1
      }))
    });
    $("#blackmarket-6-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "coke50g",
          price: 20000,
          amount: 1
      }))
    });
    $("#blackmarket-7-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "heistlaptop3",
          price: 5000,
          amount: 1
      }))
    });
    $("#blackmarket-8-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "-1075685676",
          price: 10000,
          amount: 1
      }))
    });
    $("#blackmarket-9-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "thermal_charge",
          price: 15000,
          amount: 1
      }))
    });
    $("#blackmarket-10-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "453432689",
          price: 4000,
          amount: 1
      }))
    });
    $("#blackmarket-11-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "highgradefemaleseed",
          price: 1000,
          amount: 5
      }))
    });
    $("#blackmarket-12-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "electronickit",
          price: 5000,
          amount: 1
      }))
    });
    $("#blackmarket-13-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "oxy",
          price: 5000,
          amount: 30
      }))
    });
    $("#blackmarket-14-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "advlockpick",
          price: 5000,
          amount: 25
      }))
    });
    $("#blackmarket-15-order").click(function() {
      $('.blackmarket-body').hide();
      $('#processTXT').show();
      $(".loader").show();
      close()
      $.post('http://np-blackmarket/order', JSON.stringify({
          item: "craftbench",
          price: 50000,
          amount: 1
      }))
   });
});

// DATE SPAN
var d = new Date();
var weekday = new Array(7);
weekday[0] =  "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";
var n = weekday[d.getDay()];
var today = new Date();
var time = today.getHours() + ":" + today.getMinutes()
$("#current-time").html(time);
$("#current-day").html(n);