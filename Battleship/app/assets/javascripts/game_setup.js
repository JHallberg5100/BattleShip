$(document).ready(function() {

  var boardFunctionality = function(){
    var direction = "horizontal"
    $("#toggle-button").on("click", function(){
      if( direction === "horizontal"){
        direction = "vertical";
      }
      else{
        direction = "horizontal";
      }
    })

    $('a').on("click", function(){
      event.preventDefault();
      $currentShip = $(this)
      size = $(this).attr('href');
      });

      $('.cell').on("mouseenter", function() {
        $("#warning").html("");
        $mousePosition = $(this);
        $currentPosition = $mousePosition

        $('.ship-shadow').removeClass("ship-shadow");
        if (direction === "horizontal"){
          for (var i = 0 ; i <= size-1; i++){

              if($currentPosition.is("td")){
                $currentPosition.addClass("ship-shadow");
                $currentPosition = $currentPosition.prev();
              }
              else{
              $(".ship-shadow").removeClass("ship-shadow");
                $("#warning").html("Invalid Position");
            }}}
          else {
            sibIndex= $currentPosition.parent().children();
            indexNum = sibIndex.index($currentPosition);
            for (var i = 0 ; i <= size-1; i++){
              if($currentPosition.is("td")){
              $currentPosition.addClass("ship-shadow");
              $currentPosition = $currentPosition.parent().prev();
              // console.log($currentPosition);
              $currentPosition = $($currentPosition.children().get(indexNum));
            }
            else{
              $(".ship-shadow").removeClass("ship-shadow");
              $("#warning").html("Invalid Position");

            }}
          }
      });
      $(".cell").on("click", function(){
        $allShips= $(".ship-shadow");
        $allShips.addClass("ship-placed");
        $allShips.removeClass("ship-shadow")
      });
    };
  boardFunctionality();
});