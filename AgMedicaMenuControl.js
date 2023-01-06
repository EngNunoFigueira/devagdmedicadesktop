function hideMenu()
{
    if(agendaData.visible==true || agendaCalendar.visible==true || homeDelete.visible ==true || medicFolders.visible == true || listOfPatient.visible==true || sendEmailSmsCall.visible==true)
    {
      listOfPatient.visible=false
      agendaCalendar.visible=false
      homeDelete.visible=false
      medicFolders.visible =false
      agendaData.visible=false
      headAgenda.visible=false
      sendEmailSmsCall.visible=false
      head.visible=true
      attGeral.visible=true
      consulta.visible=true
      exames.visible=true
      resultados.visible=true
      visitas.visible=true

    }
    else
    {
        homePageMenuOptions.visible=false
        xSizeMenu=0
        head.x=0
        attGeralLegeng.x=0
    }

}
function showMenu()
{
    if( xSizeMenu==0)
    {
        homePageMenuOptions.visible=true
        headAgenda.visible=false
        medicFolders.visible=false
        homeDelete.visible=false
        listOfPatient.visible=false
        sendEmailSmsCall.visible=false
        head.visible=true

        attGeral.visible=true
        consulta.visible=true
        exames.visible=true
        resultados.visible=true
        visitas.visible=true


        xSizeMenu=index.width/10
        head.x=20
        attGeralLegeng.x=index.width/10
        //console.log("Mostrando  xSizeMenu==0")
    }
    headAgenda.visible=false
    head.visible=true
    //console.log("Mostrando o Menu")
}

function showAgenda()
{
   head.visible=false
   agendaCalendar.visible=false
   medicFolders.visible=false
   homeDelete.visible=false
   listOfPatient.visible=false
    sendEmailSmsCall.visible=false
   agendaData.visible=true
   headAgenda.visible=true
}

function showCalendar()
{
   attGeral.visible=false
   consulta.visible=false
   exames.visible=false
   resultados.visible=false
   head.visible=false
   agendaData.visible=false
   headAgenda.visible=false
   medicFolders.visible=false
   homeDelete.visible=false
   listOfPatient.visible=false
    sendEmailSmsCall.visible=false
   agendaCalendar.visible=true
}

 function showMedicFolders()
 {
     attGeral.visible=false
     consulta.visible=false
     exames.visible=false
     resultados.visible=false
     head.visible=false
     agendaData.visible=false
     headAgenda.visible=false
     agendaCalendar.visible=false
     homeDelete.visible=false
     listOfPatient.visible=false
     sendEmailSmsCall.visible=false
     medicFolders.visible=true
 }
 function showDelete()
 {
     attGeral.visible=false
     consulta.visible=false
     exames.visible=false
     resultados.visible=false
     head.visible=false
     agendaData.visible=false
     headAgenda.visible=false
     agendaCalendar.visible=false
     listOfPatient.visible=false
     sendEmailSmsCall.visible=false
     medicFolders.visible=false
     homeDelete.visible=true
 }

function showListaPatients()
{
    attGeral.visible=false
    consulta.visible=false
    exames.visible=false
    resultados.visible=false
    head.visible=false
    agendaData.visible=false
    headAgenda.visible=false
    agendaCalendar.visible=false
    homeDelete.visible=false
    sendEmailSmsCall.visible=false
    medicFolders.visible=false
    listOfPatient.visible=true

}

function showEmialSmsCallOptions()
{
    attGeral.visible=false
    consulta.visible=false
    exames.visible=false
    visitas.visible=false
    resultados.visible=false
    head.visible=false
    agendaData.visible=false
    headAgenda.visible=false
    agendaCalendar.visible=false
    homeDelete.visible=false
    medicFolders.visible=false
    listOfPatient.visible=false
    sendEmailSmsCall.visible=true

}
