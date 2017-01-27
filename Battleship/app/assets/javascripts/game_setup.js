$(document).ready(function() {

  var boardFunctionality = function(){
    var board_id = $("#board-id").html();
    var direction = "horizontal";
    $("#toggle-button").on("click", function(){
      if (direction === "horizontal"){
        direction = "vertical";
      }
      else{
        direction = "horizontal";
      }
    });

    $('.ship').on("click", function(){
      event.preventDefault();
      $currentShip = $(this);
      shipName = $(this).html();
      console.log(shipName);
      size = $(this).attr('value');
    });

    $('#grid .cell').on("mouseenter", function() {
      $("#warning").html("");
      $mousePosition = $(this);
      $currentPosition = $mousePosition;

      $('.ship-shadow').removeClass("ship-shadow");

      if (direction === "horizontal") {
        for (var i = 0 ; i <= size-1; i++){
          if($currentPosition.hasClass("ship-placed")){
            $(".ship-shadow").removeClass("ship-shadow");
            $("#warning").html("Invalid Position");
          }
          else {
            if($currentPosition.is("td")){
              $currentPosition.addClass("ship-shadow");
              $currentPosition = $currentPosition.prev();
            }
            else {
              $(".ship-shadow").removeClass("ship-shadow");
              $("#warning").html("Invalid Position");
            }
          }
        }
      }

      else if (direction === "vertical") {
        sibIndex= $currentPosition.parent().children();
        indexNum = sibIndex.index($currentPosition);
        for (var i = 0 ; i <= size-1; i++) {
          if($currentPosition.hasClass("ship-placed")){
           $(".ship-shadow").removeClass("ship-shadow");
           $("#warning").html("Invalid Position");
         }
          else {
            if($currentPosition.is("td")){
              $currentPosition.addClass("ship-shadow");
              $currentPosition = $currentPosition.parent().prev();
              // console.log($currentPosition);
              $currentPosition = $($currentPosition.children().get(indexNum));
            }
            else{
              $(".ship-shadow").removeClass("ship-shadow");
              $("#warning").html("Invalid Position");
            }
          }
        }
      }
    });

  $(".cell").on("click", function(){
    $allShips= $(".ship-shadow");
    $allShips.addClass("ship-placed");
    $allShips.removeClass("ship-shadow");
    $currentShip.hide();
    createShip(shipName, size, $mousePosition.html(), direction, board_id);
    size = null;
      });
    };

  boardFunctionality();

  $("#ready-button").on("click", function(){
    $('#shot-board .cell').on("mouseenter", function() {
      $("#warning").html("");
      $mousePosition = $(this);
      $('.shot-shadow').removeClass("shot-shadow");
      $(this).addClass("shot-shadow")
    });
    $("#shot-board .cell").on("click", function(){
      event.preventDefault();
      $mousePosition = event.target;
      console.log(event.target);
      console.log($(this))
      location= $mousePosition.html();
      console.log(location)

    });
  });
});
var createShip = function(name, size, position, direction, board_id){
  $.ajax({
    url: "/boards/" + board_id +"/ships",
    method: "POST",
    data: {name: name, size: size, position: position, direction: direction },
  })
  .done(function(response) {
    console.log(response);
  });
}



