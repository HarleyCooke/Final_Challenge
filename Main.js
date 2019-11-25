
var Authenticate = [];
var UserCheck = [];
var MemberList = {};
var currentUser = '';
var CoffeeDatesList = [];

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
    fillMemberList();
}

function MyDates() {
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


function getCoffeeDates() {
    $('#posts').DataTable( {
        ajax: {
            url: 'https://diplomaapi.azurewebsites.net/api/CoffeeDates',
            "dataSrc": function (d) {       
                return d
            }
        },
        columns:[
            {data: 'Venue'},
            {data: 'Date'},
            {data: 'Time'},
            {data: 'Cost'},
            {data: 'MemberID'},
        ],
        "aoColumnDefs": [ {
        }],
        "bLengthChange": false,
        "iDisplayLength": 15,
        "dom": '<"pull-left"f><"pull-right"l>tip'
      },
    );
 
}



function createCoffeeDate() {
    var CoffeeDate = [{}];
    CoffeeDate.Venue = (document.getElementById('Venue').value)
    CoffeeDate.Date = (document.getElementById('Date').value)
    CoffeeDate.Time = (document.getElementById('Time').value)
    CoffeeDate.Cost = (document.getElementById('Cost').value)
    CoffeeDate.MemberID = (document.getElementById('select').value)
    JSON.stringify(CoffeeDate);
    console.log(CoffeeDate);

    $.ajax({
        type: "POST",
        url: "https://diplomaapi.azurewebsites.net/api/CoffeeDates",
        cache: false,
        data: {Venue: CoffeeDate.Venue, Date: CoffeeDate.Date, Time: CoffeeDate.Time, Cost: CoffeeDate.Cost,
               MemberID: CoffeeDate.MemberID},
        success: function(data){
           console.log("Sucess" + data);
    }
});

}


function fillMemberList() {
    var select = document.getElementById('select');
    for(index in UserCheck) {
        select.options[select.options.length] = new Option(UserCheck[index], index);
    }
}