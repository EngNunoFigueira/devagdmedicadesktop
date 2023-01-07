import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.4

import "agMedica.js" as ActionsManager
import "AgMedicaMenuControl.js" as MenuController

Window {
    id: index
    width: 1920
    height: 1030
    visible: true
    title: "AGENDA MÉDICA"
    //QML TIMER
    Timer {
        id: timerRefreshModels
        interval: 120000
        running: true
        repeat: true
        onTriggered: {
            ActionsManager.apiGetExamesData()
        }
    }
    //QMLPROPERTY
    property int xSizeMenu: index.width / 15
    property int eventDay: 10

    // HOME PAGE
    Rectangle {
        id: head
        width: index.width
        height: index.height / 15
        color: "#0A2239"
        x: 20
        y: 0

        Image {
            id: refreshIcon
            x: index.width - 70
            y: 5
            source: "../icons8-actualizar-30.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showMenu()
                }
            }
        }
        Text {
            id: attGeralLegeng
            anchors.verticalCenter: parent.verticalCenter
            x: xSizeMenu
            y: 0
            Text {
                font.pointSize: 10
                font.bold: false
                text: " Att. Geral"
                color: "white"
            }
        }
        Text {
            id: consultaLegeng
            anchors.verticalCenter: parent.verticalCenter
            x: index.width / 4.8 //310
            y: 0
            Text {
                font.pointSize: 10
                font.bold: false
                text: " Consultas"
                color: "white"
            }
        }
        Text {
            id: examesLegeng
            anchors.verticalCenter: parent.verticalCenter
            x: index.width / 2.9 //520
            y: 0
            Text {
                font.pointSize: 10
                font.bold: false
                text: " Exames"
                color: "white"
            }
        }
        Text {
            id: resultadoLegeng
            anchors.verticalCenter: parent.verticalCenter
            x: index.width / 2 //690
            y: 0
            Text {
                font.pointSize: 10
                font.bold: false
                text: " Resultados"
                color: "white"
            }
        }
        Text {
            id: visitasLegeng
            anchors.verticalCenter: parent.verticalCenter
            x: index.width / 1.5
            y: 0
            Text {
                font.pointSize: 10
                font.bold: false
                text: " Visitas"
                color: "white"
            }
        }
    }
    // HOME PAGE BUTTOM UPDATE + IMAGE REFRESH  + INPUT TEXTBOX + BOTTOM UTENTE CODE
    Rectangle {
        id: headAgenda
        width: index.width
        height: index.height / 15
        visible: false
        color: "#0A2239"
        x: 20
        y: 0
        Image {
            id: backTohome
            x: index.width - 70
            y: 5
            source: "../icons8-actualizar-30.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showMenu()
                }
            }
        }
        TextInput {
            x: index.width / 15
            y: 4
            text: "Insira código de utente"
            color: "white"
        }
        Button {
            id: headAgendaButton
            width: 100
            text: "Entrar"
            x: index.width / 5.1 //260
            y: 4
            onClicked: ActionsManager.loadUtenteRegister()
        }
    }
    // HOME PAGE  MENU SPACE
    Rectangle {
        id: spanAfterMenu
        width: index.width
        height: index.height
        color: "white"
        x: index.width / 100
        y: 40
    }
    //HOME PAGE MENU BUTTONS
    Rectangle {
        id: homePageMenuOptions
        width: index.width / 16
        height: index.height
        color: "#1B262C"
        x: 0
        y: 0
        visible: true
        Image {
            id: iconMenu
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: 40
            source: "../icons8-menu-64.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.hideMenu()
                }
            }
        }
        Image {
            id: contact
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: 140
            source: "../icons8-contacts-48.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showAgenda()
                }
            }
        }
        Image {
            id: calendar
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: 230
            source: "../icons8-calendar-48.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showCalendar()
                }
            }
        }
        Image {
            id: openFolder
            width: index.width / 25
            height: index.width / 25
            x: 25
            y: 320
            source: "../icons8-opened-folder-48.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showMedicFolders()
                }
            }
        }
        Image {
            id: patient
            width: index.width / 25
            height: index.width / 25
            x: 25
            y: 410
            source: "../patient-icon.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showListaPatients()
                }
            }
        }
        Image {
            id: correoMessage
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: 500
            source: "../correo.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showEmialSmsCallOptions()
                }
            }
        }
        Image {
            id: trash
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: 600
            source: "../icons8-trash-48.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    MenuController.showDelete()
                }
            }
        }
        Image {
            id: settings
            width: index.width / 25
            height: index.width / 25
            x: 20
            y: index.width / 2.0
            source: "../icons8-settings-48.png"
        }
        // Text { font.family: "Helvetica"; font.italic: true ;font.pointSize:20;font.bold: true ;text: " menu..."; color: "white"}
        Component.onCompleted: ActionsManager.apiGetExamesData()
    }

    // HOME PAGE DATA LISVIEW
    // ATT GERAL
    Rectangle {
        id: attGeral
        width: index.width / 10
        height: index.height
        x: xSizeMenu
        y: 40

        ListModel {
            id: modelAttGeral
            ListElement {
                counter: 0
                code: ""
                status: ""
                serviceType: ""
                openTime: ""
                closeTime: ''
            }
        }
        ListView {
            id: listAttGeral
            width: (300 / 3)
            height: index.height
            y: 20
            model: modelAttGeral
            delegate: Component {
                Item {
                    width: parent.width
                    height: 20
                    Column {
                        spacing: 15
                        Text {
                            font.pointSize: 10
                            style: Text.Sunken
                            styleColor: "#AAAAAA"
                            text: code
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: listAttGeral.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                color: '#E8F0FF'
                radius: 5
                Text {
                    anchors.centerIn: parent
                    color: 'black'
                    text: ""
                }
                Image {
                    id: phoneCall
                    width: 20
                    height: 20
                    x: 100
                    source: "../telephone-symbol-button.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ActionsManager.refreshListViewModel(
                                        modelAttGeral,
                                        ActionsManager.indexToRemove)
                            ActionsManager.apiPutTicketStatus()
                        }
                    }
                }
            }
            focus: true
            //onCurrentItemChanged: console.log(modelAttGeral.get(listAttGeral.currentIndex).code + ' selected')
            onCurrentItemChanged: {
                ActionsManager.getModelCurrentItem(listAttGeral, modelAttGeral)
            }
        }
    }
    // CONSULTAS
    Rectangle {
        id: consulta
        width: index.width / 590
        height: index.height
        x: index.width / 5.1
        y: 40
        ListModel {
            id: modelConsulta
            ListElement {
                counter: 0
                code: ""
                status: ""
                serviceType: ""
                openTime: ""
                closeTime: ''
            }
        }
        ListView {
            id: listConsultas
            width: (300 / 3)
            height: index.height
            x: 30
            y: 20
            model: modelConsulta
            delegate: Component {
                Item {
                    width: parent.width
                    height: 20
                    Column {
                        spacing: 15
                        Text {
                            font.pointSize: 10
                            style: Text.Sunken
                            styleColor: "#AAAAAA"
                            text: code
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: listConsultas.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                color: '#E8F0FF'
                radius: 5
                Text {
                    anchors.centerIn: parent
                    //text: 'Hello ' + model.get(listConsultas.currentIndex).CodigoUtente
                    color: 'white'
                }
                Image {
                    id: telephoneConsult
                    width: 20
                    height: 20
                    x: 100
                    source: "../telephone-symbol-button.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ActionsManager.refreshListViewModel(
                                        modelConsulta,
                                        ActionsManager.indexToRemove)
                            ActionsManager.apiPutTicketStatus()
                        }
                    }
                }
            }
            focus: true
            //onCurrentItemChanged: { //console.log(model.get(listConsultas.currentIndex).Medico + ' selected') }
            onCurrentItemChanged: {
                ActionsManager.getModelCurrentItem(listConsultas, modelConsulta)
            }
        }
    }

    // EXAMES
    Rectangle {
        id: exames
        width: index.width / 384
        height: index.height
        x: index.width / 3.4 //439
        y: 40
        ListModel {
            id: modelExames
            ListElement {
                counter: 0
                code: ""
                status: ""
                serviceType: ""
                openTime: ""
                closeTime: ''
            }
        }
        ListView {
            id: listExames
            width: (300 / 3)
            height: index.height
            x: 100
            y: 20
            model: modelExames
            delegate: Component {
                Item {
                    width: 79
                    height: 25
                    Column {
                        spacing: 15
                        Text {
                            font.pointSize: 10
                            style: Text.Sunken
                            styleColor: "#AAAAAA"
                            text: code
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: listExames.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                color: '#E8F0FF'
                radius: 5
                Text {
                    anchors.centerIn: parent
                }
                Image {
                    id: successCheck
                    width: 25
                    height: 25
                    x: 78
                    source: "../mic.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ActionsManager.refreshListViewModel(
                                        modelExames,
                                        ActionsManager.indexToRemove)
                            ActionsManager.apiPutTicketStatus()
                        }
                    }
                }
            }
            focus: true
            onCurrentItemChanged: {
                ActionsManager.getModelCurrentItem(listExames, modelExames)
            }
        }
    }
    // RESULTADOS
    Rectangle {
        id: resultados
        width: index.width - 424
        height: index.height
        x: index.width / 2.1 //650
        y: 40
        ListModel {
            id: modelResultados
            ListElement {
                counter: 0
                code: ""
                status: ""
                serviceType: ""
                openTime: ""
                closeTime: ''
            }
        }
        ListView {
            id: listResultados
            width: (300 / 3)
            height: index.height
            x: 60
            y: 20
            model: modelResultados
            delegate: Component {
                Item {
                    width: parent.width
                    height: 20
                    Column {
                        spacing: 15
                        Text {
                            font.pointSize: 10
                            style: Text.Sunken
                            styleColor: "#AAAAAA"
                            text: code
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: listResultados.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                color: '#E8F0FF'
                radius: 5
                Text {
                    anchors.centerIn: parent
                }
                Image {
                    id: telephone
                    width: 20
                    height: 20
                    x: 100
                    source: "../telephone-symbol-button.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ActionsManager.refreshListViewModel(
                                        modelResultados,
                                        ActionsManager.indexToRemove)
                            ActionsManager.apiPutTicketStatus()
                        }
                    }
                }
            }
            focus: true
            onCurrentItemChanged: {
                ActionsManager.getModelCurrentItem(listResultados,
                                                   modelResultados)
            }
            //onCurrentItemChanged: console.log(modelResultados.get(listResultados.currentIndex).code + ' selected')
        }
    }
    // VISITAS
    Rectangle {
        id: visitas
        width: index.width - 424
        height: index.height
        x: index.width / 1.6
        y: 40
        ListModel {
            id: modelVisitas
            ListElement {
                counter: 0
                code: ""
                status: ""
                serviceType: ""
                openTime: ""
                closeTime: ''
            }
        }
        ListView {
            id: listVisitas
            width: (300 / 3)
            height: index.height
            x: 60
            y: 20
            model: modelVisitas
            delegate: Component {
                Item {
                    width: parent.width
                    height: 20
                    Column {
                        spacing: 15
                        Text {
                            font.pointSize: 10
                            style: Text.Sunken
                            styleColor: "#AAAAAA"
                            text: code
                        }
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: listVisitas.currentIndex = index
                    }
                }
            }
            highlight: Rectangle {
                color: '#E8F0FF'
                radius: 5
                Text {
                    anchors.centerIn: parent
                }
                Image {
                    id: chamarVisita
                    width: 20
                    height: 20
                    x: 100
                    source: "../telephone-symbol-button.png"
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            ActionsManager.refreshListViewModel(
                                        modelVisitas,
                                        ActionsManager.indexToRemove)
                            ActionsManager.apiPutTicketStatus()
                        }
                    }
                }
            }
            focus: true
            onCurrentItemChanged: {
                ActionsManager.getModelCurrentItem(listVisitas, modelVisitas)
            }
        }
    }

    // PAGE AGENDA FOR UTENTES
    Column {
        id: agendaData
        width: parent.width
        height: parent.height
        x: index.width / 15
        y: parent.height / 20
        visible: false

        spacing: 1

        Rectangle {
            id: agendaBI
            width: parent.width
            height: parent.height / 5
            color: "lightblue"

            Image {
                id: fotoprofileutente
                width: parent.width / 10
                height: parent.height / 1
                source: "../profileUtente.png"
            }
            Label {
                x: 170
                y: 5
                text: "Nome:"
                font.pixelSize: 16
                //font.italic: true
                font.bold: true
            }
            Text {
                id: agendaName
                x: 225
                y: 7
                text: "Márcia Cristina de Oliveira Boio"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
            Label {
                x: 170
                y: 40
                text: "Apelido:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                id: agendaSurmane
                x: 238
                y: 40
                text: "Oliveira Boio"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }

            Label {
                x: 680
                y: 5
                text: "Data de Nascimento:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                id: agendaAge
                x: 840
                y: 7
                text: "27-05-1939"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
            //second line:
            Label {
                x: 170
                y: 73
                text: "Morada:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                id: agendaAddress
                x: 235
                y: 75
                text: "Morro da luz R. Manuel Conegas nº 23C"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
            Label {
                x: 680
                y: 40
                text: "Telefone:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                id: agendaPhone
                x: 756
                y: 42
                text: "5685686552"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
            // third line
            Label {
                x: 170
                y: 110
                text: "E-mail:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                id: agendaEmail
                x: 230
                y: 110
                text: "marcia_viera@hotmail.com"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
            Label {
                x: 680
                y: 110
                text: "Profissão:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                x: 760
                y: 112
                id: agendaProfession
                text: "Professor"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }

            Label {
                x: 680
                y: 80
                text: "Estado civil:"
                font.pixelSize: 16
                font.bold: true
            }
            Text {
                x: 775
                y: 82
                id: agendaMarrigeState
                text: "Casado"
                font.family: "Helvetica"
                font.pointSize: 10
                color: "black"
            }
        }
        Rectangle {
            id: agendaLabel
            width: parent.width
            height: parent.height / 10
            color: "gold"
            Text {
                id: agendaMedica
                width: parent.width
                x: 50
                y: 15
                text: "AGENDA MÉDICA DO UTENTE"
                font.family: "Helvetica"
                font.pointSize: 24
                color: "blue"
            }

            Row {
                x: parent.width / 1.3
                y: 15
                spacing: 10
                Button {
                    iconSource: "./registration02.png"
                    width: 65
                    height: 65
                    onClicked: {
                        flipableAgenda.nRegister = true
                        //novaMarcacaoNaAgendaDoUtente.visible= true
                    }
                }

                Button {
                    iconSource: "./buttonSave02.png"
                    width: 60
                    height: 60
                    onClicked: {
                        flipableAgenda.nRegister = false
                        //novaMarcacaoNaAgendaDoUtente.visible= false
                    }
                }
            }
        }
        // UTENTE AGENDA REMARK DATA............................................
        Flipable {
            id: flipableAgenda
            width: parent.width
            height: parent.height
            property bool nRegister: false

            front: Rectangle {
                id: agendaOptions
                width: parent.width
                height: parent.height
                color: "#14213D"

                // Tipo de Servico agendado
                Label {
                    y: 8
                    text: "Tipo de Serviço:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 170
                    y: 10
                    id: agendaUtenteEvento
                    text: "consulta geral"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }

                // Data
                Label {
                    y: 48
                    text: "Data de Realização:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 209
                    y: 51
                    id: agendaUtenteData
                    text: "29-10-2020"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }

                // Hora
                Label {
                    y: 88
                    text: "Hora Marcada:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 153
                    y: 92
                    id: agendaUtenteHora
                    text: "10h15"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }

                // Local
                Label {
                    y: 128
                    text: "Local:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 66
                    y: 131
                    id: agendaUtenteLocal
                    text: "Hospital Universitario"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }
                //Dr(a)/Enfermeiro
                Label {
                    x: 756
                    y: 8
                    text: "Dr(a)/Enfermeiro/Analista de Lab"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                // Nome
                Label {
                    x: 756
                    y: 48
                    text: "Nome:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 830
                    y: 50
                    id: agendaUtenteEquipaMedicaNome
                    text: "Eveys Zwenbi"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }
                // Apelido
                Label {
                    x: 756
                    y: 88
                    text: "Apelido:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 850
                    y: 88
                    id: agendaUtenteEquipaMedicaApelido
                    text: "Ekuvango"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }
                // Telefone
                Label {
                    x: 756
                    y: 128
                    text: "Telemóvel:"
                    font.pixelSize: 22
                    color: "green"
                    font.bold: true
                }
                Text {
                    x: 877
                    y: 128
                    id: agendaUtenteEquipaMedicaTelefone
                    text: "559 3455 435"
                    font.family: "Helvetica"
                    font.pointSize: 14
                    color: "white"
                }
            }
            back: Rectangle {
                id: novaMarcacaoNaAgendaDoUtente
                anchors.centerIn: agendaOptions.agendaUtenteEquipaMedicaTelefone
                width: parent.width / 4.5 // working like a height
                height: parent.height / 1.5 // working like a width
                //x:0.50
                y: 1
                opacity: 1
                color: "transparent"
                visible: true

                Label {
                    y: 8
                    text: "Especialidade"
                    font.pixelSize: 24
                    color: "green"
                    font.bold: false
                }
                ComboBox {
                    id: getServiceType
                    editable: true
                    x: 3
                    y: 40
                    width: 300
                    model: ListModel {
                        id: nomeServicos
                        ListElement {
                            text: "Clínica Geral"
                        }
                        ListElement {
                            text: "Pediátriaa"
                        }
                        ListElement {
                            text: "Medicina Interna"
                        }
                        ListElement {
                            text: "Ginecologia"
                        }
                        ListElement {
                            text: "Genética Médica"
                        }
                        ListElement {
                            text: "Revisão Médica"
                        }
                        ListElement {
                            text: "Ginecologia-Obstetrícia"
                        }
                    }
                    onAccepted: {
                        if (find(editText) === -1) {
                            model.append({
                                             "text": editText
                                         })
                        }
                    }
                }

                // Data
                Label {
                    y: 98
                    text: "Data de Realização"
                    font.pixelSize: 24
                    color: "green"
                    font.bold: false
                }
                TextField {
                    id: getDate
                    x: 3
                    y: 130
                    width: 225
                    placeholderText: ("...formato MM-DD-AAAA...")
                }

                // Hora
                Label {
                    y: 180
                    text: "Hora"
                    font.pixelSize: 24
                    color: "green"
                    font.bold: false
                }
                TextField {
                    id: getHour
                    x: 3
                    y: 210
                    width: 225
                    placeholderText: ("...formato HH:MM...")
                }

                // Local
                Label {
                    y: 251
                    text: "Local"
                    font.pixelSize: 24
                    color: "green"
                    font.bold: false
                }
                ComboBox {
                    id: getAddress
                    x: 3
                    y: 290
                    editable: true
                    width: 300
                    model: ListModel {
                        id: nomeClinicas
                        ListElement {
                            text: "Clínica San Pablo"
                        }
                        ListElement {
                            text: "Clínica Ave Maria"
                        }
                        ListElement {
                            text: "Clínica S. Jesus"
                        }
                        ListElement {
                            text: "Centro Externo"
                        }
                        ListElement {
                            text: "Hospital Público"
                        }
                        ListElement {
                            text: "Hospital Parceiro"
                        }
                    }
                    onAccepted: {
                        if (find(editText) === -1) {
                            model.append({
                                             "text": editText
                                         })
                        }
                    }
                }

                // Equipa Medica
                Label {
                    y: 337
                    text: "Médico(a)"
                    font.pixelSize: 24
                    color: "green"
                    font.bold: false
                }
                ComboBox {
                    id: getMedico_a
                    editable: true
                    x: 3
                    y: 380
                    width: 300
                    model: ListModel {
                        id: nomeMedicos
                        ListElement {
                            text: "Dra Lukievo"
                        }
                        ListElement {
                            text: "Dra Huembi"
                        }
                        ListElement {
                            text: "Yves Mumbi"
                        }
                        ListElement {
                            text: "Dr Serigo Etuvalala"
                        }
                    }
                    onAccepted: {
                        if (find(editText) === -1) {
                            model.append({
                                             "text": editText
                                         })
                        }
                    }
                }
            }

            transform: Rotation {
                id: rotationElement
                origin.x: flipableAgenda.width / 9
                origin.y: flipableAgenda.height / 9
                //origin.z:flipableAgenda.width/2
                axis.x: 0
                axis.y: 1
                axis.z: 0
                angle: flipableAgenda.nRegister ? 180 : 0

                Behavior on angle {

                    NumberAnimation {
                        duration: 500
                    }
                }
            }
        }
    }
    // HOME PAGE CALENDAR
    Column {
        id: agendaCalendar
        width: parent.width
        height: parent.height
        x: index.width / 17
        visible: false
        spacing: 1

        Rectangle {
            id: headCalendar
            width: parent.width
            height: parent.height
            visible: true
            color: "#0A2239"

            ListModel {
                id: dailyAgenda
                ListElement {
                    Patient: "Neusa Olivera"
                    Tratiment: "Fertilidade assistida"
                    dateHour: "10-10-2020 12h20"
                    duration: "1h30"
                    doctor: "Daniel Makiesse"
                    attention: "auxiliar na preparação"
                    Number: 1
                }
                ListElement {
                    Patient: "Óscar Etuvalelo"
                    Tratiment: "Revisão da cirugia"
                    dateHour: "10-10-2020  14h00"
                    duration: "1h00"
                    doctor: "Noqui Yetu"
                    attention: "informar sobre o tratamento"
                    Number: 4
                }
                ListElement {
                    Patient: "Yuri Etuva"
                    Tratiment: "retirar os pontos da ferida"
                    dateHour: "10-10-2020 18h10"
                    duration: "30 min"
                    doctor: "Jorge Ngueve"
                    attention: "N.A"
                    Number: 2
                }
                ListElement {
                    Patient: "Rogerio Bié"
                    Tratiment: "revisão anual"
                    dateHour: "10-10-2020 11h00"
                    duration: "50 min"
                    doctor: "Paula Abuhyla"
                    attention: "recolher os exames de urina"
                    Number: 1
                }
                ListElement {
                    Patient: "Patricia Wimbi"
                    Tratiment: "ginecologia"
                    dateHour: "10-10-2020 08h30"
                    duration: "1h30"
                    doctor: "Ana Kuendy"
                    attention: "recolher previamente os exames"
                    Number: 3
                }
            }
            TableView {
                anchors.fill: parent
                TableViewColumn {
                    role: "Patient"
                    title: "Paciente"
                    width: 250
                }
                TableViewColumn {
                    role: "Tratiment"
                    title: "Tratamento"
                    width: 250
                }
                TableViewColumn {
                    role: "dateHour"
                    title: "Data e hora"
                    width: 200
                }
                TableViewColumn {
                    role: "duration"
                    title: "Duração"
                    width: 100
                }
                TableViewColumn {
                    role: "doctor"
                    title: "Médico/Médica"
                    width: 300
                }
                TableViewColumn {
                    role: "attention"
                    title: "Recomendação"
                    width: 300
                }
                TableViewColumn {
                    role: "Number"
                    title: "Consulta/Número"
                    width: 300
                }
                model: dailyAgenda
                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        height: textItem.implicitHeight * 1.2
                        width: textItem.implicitWidth
                        color: "lightsteelblue"
                        Text {
                            id: textItem
                            anchors.fill: parent
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: styleData.textAlignment
                            anchors.leftMargin: 12
                            text: styleData.value
                            elide: Text.ElideRight
                            color: textColor
                            renderType: Text.NativeRendering
                        }
                        Rectangle {
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: 1
                            anchors.topMargin: 1
                            width: 1
                            color: "#ccc"
                        }
                    }
                }
            }
        }
    }

    // CALENDAR DISPLAY

    // HOME PAGE FOLDER
    Column {
        id: medicFolders
        width: parent.width
        height: parent.height
        x: index.width / 17
        visible: false
        spacing: 1

        Rectangle {
            id: medicFoldersRegisters
            width: parent.width
            height: index.height
            visible: true
            color: "white"

            Image {
                id: medicFoldersLogo
                anchors.centerIn: parent
                //x:600
                //y:5
                source: "../medical-icon-png-28.jpg"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        showMenu()
                    }
                }
            }
        }
    }

    // HOME ENVELOP ICON - FUNCTION SEND EMAIL, SMS & PHONE CALL
    Row {
        id: sendEmailSmsCall
        width: parent.width
        height: parent.height
        x: index.width / 17
        visible: false
        spacing: 1

        Column {
            id: sendEmailSmsCallButtons
            width: parent.width
            height: parent.height
            x: index.width / 17
            Rectangle {
                id: emailSmsCalls
                width: parent.width
                height: parent.height / 5
                color: "white"
                border.color: "#F8F4F1"
                border.width: 5
                radius: 10

                // EMAIL
                Rectangle {
                    id: writeEmail
                    width: 60
                    height: 60
                    color: "grey"
                    y: 20
                    x: 450
                    Image {
                        id: emailSendICon
                        anchors.centerIn: parent
                        source: "../email.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                showMenu()
                            }
                        }
                    }
                }

                Label {
                    text: "E-mail..."
                    font.pixelSize: 14
                    font.italic: true
                    color: "steelblue"
                    y: 90
                    x: writeEmail.x - 10
                }

                // WHATSAPP
                Rectangle {
                    id: whatsapp
                    width: 60
                    height: 60
                    color: "grey"
                    y: 20
                    x: writeEmail.x + 200
                    Image {
                        id: whatsappIcon
                        anchors.centerIn: parent
                        source: "../whatsapp.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                showMenu()
                            }
                        }
                    }
                }

                Label {
                    text: "Whatsapp..."
                    font.pixelSize: 14
                    font.italic: true
                    color: "steelblue"
                    y: 90
                    x: whatsapp.x - 10
                }

                // PHONE CALL
                Rectangle {
                    id: phone
                    width: 60
                    height: 60
                    color: "grey"
                    y: 20
                    x: writeEmail.x + 400
                    Image {
                        id: phoneICon
                        anchors.centerIn: parent
                        source: "../call.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                showMenu()
                            }
                        }
                    }
                }

                Label {
                    text: "Chamada Telef"
                    font.pixelSize: 14
                    font.italic: true
                    color: "steelblue"
                    y: 90
                    x: phone.x - 10
                }

                // SMS
                Rectangle {
                    id: smsMessage
                    width: 60
                    height: 60
                    color: "grey"
                    y: 20
                    x: writeEmail.x + 600
                    Image {
                        id: smsICon
                        anchors.centerIn: parent
                        source: "../chat.png"
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                showMenu()
                            }
                        }
                    }
                }

                Label {
                    text: "Sms message"
                    font.pixelSize: 14
                    font.italic: true
                    color: "steelblue"
                    y: 90
                    x: smsMessage.x - 10
                }

                //                Image {
                //                    id: envelopIcon
                //                    anchors.centerIn: parent
                //                    //x:600
                //                    //y:5
                //                    source: "../medical-icon-png-28.jpg"
                //                    MouseArea{
                //                        anchors.fill: parent
                //                        onClicked: {
                //                            showMenu()
                //                        }
                //                    }
                //                }
                //                Button {
                //                    id: writeEmail
                //                    width: 100
                //                    text: "Send Email"
                //                    x: index.width / 5.1 //260
                //                    y: 5

                //                    ColorAnimation {
                //                        from: "white"
                //                        to: "black"
                //                        duration: 200
                //                    }
                //                    onClicked: ActionsManager.loadUtenteRegister()
                //                }
            }
            Rectangle {
                id: messageLayout
                width: parent.width
                height: parent.height / 2.5
                color: "#B3A2B9"
                border.color: "white"
                border.width: 5
                radius: 10

                // Text Input Email Address
                Label {
                    text: "Email :"
                    font.pixelSize: 18
                    font.italic: true
                    color: "black"
                    y: 40
                    x: emailAddress.x - 60
                }
                Rectangle {
                    id: emailAddress
                    width: parent.width
                    height: 25
                    x: 100
                    y: 40
                    border.color: "black"
                    border.width: 1

                    TextInput {
                        id: insertEmail
                        anchors.fill: parent
                        // anchors.margins: 4
                    }
                }
                // Input Input Email Summary
                Label {
                    text: "Assunto :"
                    font.pixelSize: 18
                    font.italic: true
                    color: "black"
                    y: emailAddress.y + 40
                    x: emailAddress.x - 80
                }
                Rectangle {
                    id: emailSummary
                    width: parent.width
                    height: 25
                    y: emailAddress.y + 40
                    x: emailAddress.x
                    border.color: "black"
                    border.width: 1

                    TextInput {
                        id: insertSummary
                        anchors.fill: parent
                        anchors.margins: 4
                    }
                }
                // Write Email Message Body
                Rectangle {
                    id: emailBody
                    width: parent.width
                    height: 120 //messageLayout.height
                    y: emailSummary.y + 40
                    x: emailAddress.x
                    border.color: "black"
                    border.width: 1

                    TextArea {
                        id: bodyMessage
                        anchors.fill: parent
                    }
                }

                // Send the E-mail
                Rectangle {
                    id: bFinishEmial
                    width: parent.width
                    height: 25
                    y: emailBody.y + 110
                    x: emailAddress.x

                    Button {
                        id: finishEmail
                        text: "Enviar E-mail"
                        anchors.centerIn: parent
                        anchors.fill: parent

                        ColorAnimation {
                            from: "white"
                            to: "black"
                            duration: 200
                        }
                        onClicked: ActionsManager.loadUtenteRegister()
                    }
                }
            }
        }
        Column {
            id: mailText
            Rectangle {
                id: messageToSendBoby
                //width: parent.width - 200
                //height: index.height - 200
                color: "red"
            }
        }
    }

    // HOME PAGE PATIENT
    Column {
        id: listOfPatient
        width: parent.width
        height: parent.height
        x: index.width / 17
        visible: false
        spacing: 1

        Rectangle {
            id: patientProfiles
            width: parent.width
            height: index.height
            visible: true
            color: "white"

            ListModel {
                id: patientNames
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "432"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Rui Santos"
                    room: "989"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Miriam Muller"
                    room: "665"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Emilio Gallego"
                    room: "880"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Makieze Opaya"
                    room: "123"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Caraias Zau"
                    room: "342"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Mulevo Nvunda"
                    room: "7687"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Patricia Martinho"
                    room: "745"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "658"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Rui Santos"
                    room: "01"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Miriam Muller"
                    room: "020"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Emilio Gallego"
                    room: "031"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Makieze Opaya"
                    room: "04"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Caraias Zau"
                    room: "015"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Mulevo Nvunda"
                    room: "016"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Patricia Martinho"
                    room: "047"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Neusa Olivera"
                    room: "087"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Rui Santos"
                    room: "019"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Miriam Muller"
                    room: "101"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Emilio Gallego"
                    room: "103"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Makieze Opaya"
                    room: "104"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Caraias Zau"
                    room: "105"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Mulevo Nvunda"
                    room: "106"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
                ListElement {
                    name: "Patricia Martinho"
                    room: "201"
                    date: "10-10-2020"
                    patology: "covid-19"
                    doctor: "Amukwaya"
                    attention: "Visitas Familiares"
                    visitor: 1
                }
            }

            TableView {
                anchors.fill: parent

                TableViewColumn {
                    role: "name"
                    title: "Nome"
                    width: 300
                }

                TableViewColumn {
                    role: "room"
                    title: "Quarto"
                    width: 300
                }

                TableViewColumn {
                    role: "patology"
                    title: "Patologia"
                    width: 300
                }

                TableViewColumn {
                    role: "doctor"
                    title: "Médico/Médica"
                    width: 300
                }

                TableViewColumn {
                    role: "date"
                    title: "Data de Entarada"
                }

                TableViewColumn {
                    role: "attention"
                    title: "Recomendação"
                    width: 300
                }

                TableViewColumn {
                    role: "visitor"
                    title: "Visitas"
                    width: 300
                }
                model: patientNames
            }
        }
    }

    // HOME PAGE DELETE
    Column {
        id: homeDelete
        width: parent.width
        height: parent.height
        x: index.width / 17
        visible: false
        spacing: 1

        Rectangle {
            id: homeDeleteOptions
            width: parent.width
            height: index.height
            visible: true
            color: "white"

            Image {
                id: deleteLogo
                width: parent.width / 2
                height: index.height / 2.09
                anchors.centerIn: parent
                source: "../delete-icon.png"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        showMenu()
                    }
                }
            }
        }
    }
}
