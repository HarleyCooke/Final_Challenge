
var Authenticate = [];
var UserCheck = [];
var MemberList = {};
var currentUser = '';
var CoffeeDatesList = [];
var Details = [];
var date;
var time;
var Venue;
var id;

function logIn() {
    $('#container').css("display", 'block');
    $.ajax({
        type: "GET",
        url: "https://diplomaapi.azurewebsites.net/api/Members",
        cache: false,
        success: function(data){
            data.forEach(element => {
                Authenticate.push(element.UserName + element.Password);
     });
            data.forEach(element => {
                UserCheck.push(element.UserName);

      });
    }
 });
}

function CreateOpen() {
    MemberList = [];
    $('#CofeeForm').css("display", 'block');
    $('#coffeeCards').css("display", 'none');
    // fillMemberList();
}

function MyGames() {
    $('#coffeeCards').css("display", 'block');
    $('#CofeeForm').css("display", 'none');
    getCoffeeDates();
}

function submitCheck() {
    var User = document.getElementById('User').value
    var Pass = document.getElementById('Pass').value
    currentUser = User;
    var Auth = User+Pass;
        if (Authenticate.includes(Auth)) {
            $('#container').css("display", 'none');
            $('.buttons').css("display", 'block');
        } else {
            alert("Login Failed");
        }
}

function newUser() {
    var User = document.getElementById('User').value
    var Pass = document.getElementById('Pass').value
        if (UserCheck.includes(User)) {
            alert("Username Already Taken");
        } else {
            $.ajax({
                type: "POST",
                url: "https://diplomaapi.azurewebsites.net/api/Members",
                cache: false,
                data: {UserName : User, Password: Pass},
                success: function(data){
                   console.log("Sucess" + data);
            }
        });
        $('#container').css("display", 'none');
        $('.buttons').css("display", 'block');
    }
}

function addCost() {
    date = '';
    time = '';
    Venue = '';
    id = '';
    MemberList = [];
    fillMemberList2();

    $('#CofeeFormUpdate').css("display", 'block');
    var oTable = document.getElementById('posts');
    var rowLength = oTable.rows.length;  
    for (i = 1; i < rowLength; i++){
       var oCells = oTable.rows.item(i).cells;
       var cellLength = oCells.length;
      for(var j = 0; j < cellLength; j++){
              var cellVal = oCells.item(j).innerHTML;
              Details.push(cellVal);
           }
    }

    console.log(Details);
    id = Details[0];
    Venue = Details[1];
    date = Details[2];
    time = Details[3];

}

function deleteGame() {
    id = '';
    var oTable = document.getElementById('posts');
    var rowLength = oTable.rows.length;  
    for (i = 1; i < rowLength; i++){
       var oCells = oTable.rows.item(i).cells;
       var cellLength = oCells.length;
      for(var j = 0; j < cellLength; j++){
              var cellVal = oCells.item(j).innerHTML;
              Details.push(cellVal);
           }
    }

    id = Details[0];
    $.ajax({
        type: "DELETE",
        url: `https://diplomaapi.azurewebsites.net/api/GameDetails/${id}`,
        success: function(){
           console.log("Sucess");
    }
});

}



function getCoffeeDates() {
    $('#posts').DataTable( {
        ajax: {
            url: 'https://diplomaapi.azurewebsites.net/api/GameDetails',
            "dataSrc": function (d) {       
                return d
            }
        },
        columns:[
            {data: 'GameDetailsID'},
            {data: 'Venue'},
            {data: 'Date'},
            {data: 'Time'},
            {data: 'MemeberPaid'},
            {data: 'Cost'},
            {
                data: null,
                render: function ( data, type, row ) {
                    return '<button id="" class="button is-link" onclick="addCost();">Add Cost</button>';
                }
            },
            {
                data: null,
                render: function ( data, type, row ) {
                    return '<button id="" class="button is-link" onclick="deleteGame();">Delete</button>';
                }
            }
        ],
        createdRow: function (data, row){
            $(data).attr('GameDetailsID', row.ID)
        },
        "aoColumnDefs": [ {
        }],
        "bLengthChange": false,
        "iDisplayLength": 15,
        "dom": '<"pull-left"f><"pull-right"l>tip'
      },
    );
 
}


function updateCoffeeDate() {
    var GameDetails = [{}];
    GameDetails.Venue = Venue
    GameDetails.Date = date
    GameDetails.Time = time
    GameDetails.MemberPaid = (document.getElementById('selectUpdate').value)
    GameDetails.Cost = (document.getElementById('CostUpdate').value)
    JSON.stringify(GameDetails);
    console.log(GameDetails);

    $.ajax({
        type: "POST",
        dataType: 'json',
        url: `https://diplomaapi.azurewebsites.net/api/GameDetails/${id}`,
        headers: {"X-HTTP-Method-Override": "PUT"},
        data: {Venue: GameDetails.Venue, Date: GameDetails.Date, Time: GameDetails.Time, MemeberPaid: GameDetails.MemberPaid,
               Cost: GameDetails.Cost},
        success: function(data){
           console.log("Sucess" + data);
    }
});
$.ajax({
    type: "DELETE",
    url: `https://diplomaapi.azurewebsites.net/api/GameDetails/${id}`,
    success: function(){
       console.log("Sucess");
}
});

}

function createCoffeeDate() {
    var GameDetails = [{}];
    GameDetails.Venue = (document.getElementById('Venue').value)
    GameDetails.Date = (document.getElementById('Date').value)
    GameDetails.Time = (document.getElementById('Time').value)
    GameDetails.Cost = '';
    GameDetails.MemberPaid = ''
    JSON.stringify(GameDetails);
    console.log(GameDetails);

    $.ajax({
        type: "POST",
        url: "https://diplomaapi.azurewebsites.net/api/GameDetails",
        cache: false,
        data: {Venue: GameDetails.Venue, Date: GameDetails.Date, Time: GameDetails.Time, MemeberPaid: GameDetails.MemberPaid,
               Cost: GameDetails.Cost},
        success: function(data){
           console.log("Sucess" + data);
    }
});

}


// function fillMemberList() {
//     var select = document.getElementById('select');
//     for(index in UserCheck) {
//         select.options[select.options.length] = new Option(UserCheck[index], index);
//     }
// }

function fillMemberList2() {
    var select = document.getElementById('selectUpdate');
    for(index in UserCheck) {
        select.options[select.options.length] = new Option(UserCheck[index], index);
    }
}