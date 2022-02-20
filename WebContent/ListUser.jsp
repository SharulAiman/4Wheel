<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    table {
      font-family: "Lato","sans-serif";
      margin-bottom: 3em;
      border-collapse:collapse;
      width: 100%;
    }

    td {
      text-align: center;     
      width: 10em;                    
      padding: 1em;
    }       
    
    .table_th {
      text-align: center;
      padding: 1em;
      background-color: #e8503a;
      color: white;
      border: 1px solid;
    }
    
    tr {    
      border: 1px solid;  
      height: 1em;
    }
    
    table tr:nth-child(even) {
      background-color: #eee;
    }
  </style>
<script>
window.onload = function () {
    var request = new XMLHttpRequest();
    request.open("GET", "https://car-microservice.herokuapp.com/display", true);
    request.onload = function () {
      var car_obj = JSON.parse(this.response);

      var table = document.createElement('table');

      for (var i = 0; i < car_obj.length; i++) {
        var row = table.insertRow(i);
        if (i === 0) {
          row.style.fontWeight = 'bold';
          var cell1 = row.insertCell(0).innerHTML = 'IC';
          var cell2 = row.insertCell(1).innerHTML = 'Name';
          var cell3 = row.insertCell(2).innerHTML = 'Phone Number';
          var cell4 = row.insertCell(3).innerHTML = 'Email';
          var cell5 = row.insertCell(4).innerHTML = 'Address';
          var cell6 = row.insertCell(5).innerHTML = 'Post Code';
          var cell7 = row.insertCell(6).innerHTML = 'City';

          cell1.innerHTML = car_obj[i].CustIc;
          cell2.innerHTML = car_obj[i].CustName;
          cell3.innerHTML = car_obj[i].CustPhoneNum;
          cell4.innerHTML = car_obj[i].CustEmail;
          cell5.innerHTML = car_obj[i].CustAddress;
          cell6.innerHTML = car_obj[i].CustPostcode;
          cell7.innerHTML = car_obj[i].CustCity;
        }
        else {
          var cell1 = row.insertCell(0);
          var cell2 = row.insertCell(1);
          var cell3 = row.insertCell(2);
          var cell4 = row.insertCell(3);
          var cell5 = row.insertCell(4);
          var cell6 = row.insertCell(5);
          var cell7 = row.insertCell(6);

          cell1.innerHTML = car_obj[i].CustIc;
          cell2.innerHTML = car_obj[i].CustName;
          cell3.innerHTML = car_obj[i].CustPhoneNum;
          cell4.innerHTML = car_obj[i].CsutEmail;
          cell5.innerHTML = car_obj[i].CustAddress;
          cell6.innerHTML = car_obj[i].CustPostCode;
          cell7.innerHTML = car_obj[i].CustCity;
        }
      }
      document.getElementById('table_id').appendChild(table);
    };
    request.send();
  }
</script>
</head>
<body>
<div id="table_id"></div>
</body>
</html>
