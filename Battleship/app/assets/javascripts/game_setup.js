$(document).ready(function() {

  var boardFunctionality = function(){
    var board_id = $("#board-id").html()
    var direction = "horizontal"
    $("#toggle-button").on("click", function(){
      if (direction === "horizontal"){
        direction = "vertical";
      }
      else{
        direction = "horizontal";
      }
    })

    $('.ship').on("click", function(){
      event.preventDefault();
      $currentShip = $(this)
      shipName = $(this).html();
      console.log(shipName)
      size = $(this).attr('value');
    });

    $('.cell').on("mouseenter", function() {
      $("#warning").html("");
      $mousePosition = $(this);
      $currentPosition = $mousePosition

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
    $allShips.removeClass("ship-shadow")
    $currentShip.hide();
    createShip(shipName, size, $mousePosition.html(), direction, board_id)
    size = null;
      });
    };

  boardFunctionality();
});

var createShip = function(name, size, position, direction, board_id){
  $.ajax({
    url: "/boards/" + board_id +"/ships",
    method: "POST",
    data: {name: name, size: size, position: position, direction: direction },
  })
  .done(function(response) {
    console.log(response);
  })
}


