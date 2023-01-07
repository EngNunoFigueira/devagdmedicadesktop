let dataObjLength = 0
var locale= Qt.locale()
var currentDate = new Date()
let indexToRemove =1000
var modelItemToUpdate = {
id_:"",
counter:"",
code: "",
status: "",
serviceType: "",
openTime: "",
closeTime:""
}

/*..................................................................................
. Theses couples of functions, are used to get the data from Restfull API server   .
. and fill the QML LISTVIEW with theses information                                .
....................................................................................*/

function updateListViewModelF(request) {
  var dataObj
  var appendToList
  var registersDuplicated=0
  try {
      dataObj = JSON.parse(request.responseText)
      if((dataObjLength === dataObj.message.length))
      {
          console.log("not found a new service");
          console.log("dataObjLength is equal = " + dataObjLength);
      }
      else if( dataObj.message.length === 0)
      {
          console.log("the queue is empty");
      }
      else
      {
         for(var i = 0; i < dataObj.message.length; i++)
         {
           if((dataObj.message[i].serviceType==="Exames") || (dataObj.message[i].serviceType==="Exame Medico"))
            {
              registersDuplicated=0;
              for(var j = 0; j < modelExames.count; j++){
                  if( modelExames.get(j).code===dataObj.message[i].code ) {
                     registersDuplicated=100
                  }
              }
              if(registersDuplicated===0){
              appendToList = {
                 _id:dataObj.message[i]._id,
                  counter: dataObj.message[i].counter,
                  code: dataObj.message[i].code,
                  status: dataObj.message[i].status,
                  serviceType: dataObj.message[i].serviceType,
                  openTime: dataObj.message[i].openTime,
                  closeTime: dataObj.message[i].closeTime
             }
             modelExames.append(appendToList);
            }
           }
          if((dataObj.message[i].serviceType==="ATT Geral") || (dataObj.message[i].serviceType==="Att Geral"))
           {
             registersDuplicated=0;
             for(var jj = 0; jj < modelAttGeral.count; jj++){
                  if( modelAttGeral.get(jj).code===dataObj.message[i].code ) {
                     registersDuplicated=100;
                  }
              }
              if(registersDuplicated===0){
                appendToList = {
                 _id:dataObj.message[i]._id,
                  counter: dataObj.message[i].counter,
                  code: dataObj.message[i].code,
                  status: dataObj.message[i].status,
                  serviceType:dataObj.message[i].serviceType,
                  openTime: dataObj.message[i].openTime,
                  closeTime: dataObj.message[i].closeTime }

             modelAttGeral.append(appendToList);
             }
           }
           if((dataObj.message[i].serviceType==="Consultas") || (dataObj.message[i].serviceType==="Consulta"))
           {
             registersDuplicated=0
             for(var jjj = 0; jjj < modelConsulta.count; jjj++){
                if(modelConsulta.get(jjj).code===dataObj.message[i].code) {
                    registersDuplicated=100
                }
              }
              if(registersDuplicated===0){
                appendToList = {
                 _id:dataObj.message[i]._id,
                  counter: dataObj.message[i].counter,
                  code: dataObj.message[i].code,
                  status: dataObj.message[i].status,
                  serviceType:dataObj.message[i].serviceType,
                  openTime: dataObj.message[i].openTime,
                  closeTime: dataObj.message[i].closeTime }

             modelConsulta.append(appendToList);
            }
          }
        if(dataObj.message[i].serviceType==="Resultados")
         {
            registersDuplicated=0
            for(var jjjj = 0; jjjj < modelResultados.count; jjjj++){
                  if(modelResultados.get(jjjj).code===dataObj.message[i].code) {
                     registersDuplicated=100;
                  }
            }
              if(registersDuplicated===0){
                appendToList = {
                 _id:dataObj.message[i]._id,
                  counter: dataObj.message[i].counter,
                  code: dataObj.message[i].code,
                  status: dataObj.message[i].status,
                  serviceType: dataObj.message[i].serviceType,
                  openTime: dataObj.message[i].openTime,
                  closeTime: dataObj.message[i].closeTime }

             modelResultados.append(appendToList);
            }
         }
        if((dataObj.message[i].serviceType==="Visita Medica") || (dataObj.message[i].serviceType==="Visita"))
         {
            registersDuplicated=0
            for(var nvisitas = 0; nvisitas < modelVisitas.count; nvisitas++){
                  if(modelVisitas.get(nvisitas).code===dataObj.message[i].code) {
                     registersDuplicated=100;
                  }
            }
              if(registersDuplicated===0){
                appendToList = {
                 _id:dataObj.message[i]._id,
                  counter: dataObj.message[i].counter,
                  code: dataObj.message[i].code,
                  status: dataObj.message[i].status,
                  serviceType: dataObj.message[i].serviceType,
                  openTime: dataObj.message[i].openTime,
                  closeTime: dataObj.message[i].closeTime }

             modelVisitas.append(appendToList);
            }
         }
       }
       //refresh the size of object Message
       dataObjLength = dataObj.message.length + 1
      }
     }
 catch(e)
  {
     console.log("ERROR... " + e)
  }
}

function apiGetData() {
    var request = new XMLHttpRequest();
    request.open('GET', "http://10.10.10.90:5000/admins/", /* async = */ false)
    request.responseType ="json";
    request.send();
    if(request.status===200){
       updateListViewModel(request, modelAttGeral)
    }
    else {
        console.log("error " + request.status)
    }
}

function apiGetExamesData() {
    var request = new XMLHttpRequest();
    request.open('GET', "http://10.10.10.90:5000/registers/", /* async = */ false);
    request.responseType ="json";
    request.send();
    if(request.status===200){
       updateListViewModelF(request, modelExames);
    }
    else {
        console.log("error " + request.status);
    }
}

/*..................................................................................
. Theses couples of functions are used to implement the algoritm that update       .
. the data on the server using as the Restfull API interface                       .
....................................................................................*/
function getTimeStamp()
{
  var date= new Date(year, month, day, hours, minutes, seconds, milliseconds)
  date.currentDate.getDate()
  date.currentDate.getHours()
  date.currentDate.getMinutes()
  date.currentDate.getSeconds()
  return date.currentDate.getHours() + " " + date.currentDate.getHours()+":"+ date.currentDate.getMinutes()+ date.currentDate.getSeconds()
}

function refreshListViewModel(modelName, index)
{
  modelName.remove(index)
}

function getModelCurrentItem(item, modelName)
{
  indexToRemove = item.currentIndex;
  modelItemToUpdate = {
            _id:     modelName.get(item.currentIndex)._id,
            code:    modelName.get(item.currentIndex).code,
            counter: modelName.get(item.currentIndex).counter,
            status: "called",
            serviceType: modelName.get(item.currentIndex).serviceType,
            openTime: modelName.get(item.currentIndex).openTime,
            closeTime:currentDate.toLocaleDateString("hh:mm:ss.zzz")
         };
}

function apiPutTicketStatus()
{
 var json = JSON.stringify(modelItemToUpdate)
 const url="http://10.10.10.90:5000/registers/"+modelItemToUpdate._id
 console.log("this is the URI "+ url)
 console.log("Ticket Status: "+modelItemToUpdate.status)

 var request = new XMLHttpRequest();
 request.open("PUT", url, true);
 request.setRequestHeader('Content-type', 'application/json; charset=UTF-8');
 request.onload = function () {
                 var users = JSON.parse(request.responseText);
                 if (request.readyState === 4 && request.status === "200")
                  { console.table(users); }
                 else
                  { console.error(users); }
              }
 request.send(json);
}


/*..................................................................................
. Theses couples of functions are used to manager the Utentes registers like agenda .
....................................................................................*/


function loadUtenteRegister()
{
    console.log("ONLY AVAIBLE IN FUTURE RELEASE")
}

function loadCalendarDays()
{
    console.log("ONLY AVAIBLE IN FUTURE RELEASE")
}
