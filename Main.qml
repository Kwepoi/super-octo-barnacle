import QtQuick 2.8
import QtQuick.Controls 2.8
import QtQuick.Controls 1.4 as Q1
import QtQuick.Controls.Styles 1.4
import SddmComponents 2.0
import "."
Rectangle {
    id : container
    LayoutMirroring.enabled : Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit : true
    property int sessionIndex : session.index


    /*
        C64 COLOR VALUES:
        ====================
        Black:       #000000
        Blue:        #104ea5
        Brown:       #8d4300
        Cyan:        #7ee7d0
        Dark Grey:   #616161
        Green:       #76bb61
        Grey:        #939393
        Light Blue:  #5796ec
        Light Green: #cbffb6
        Light Grey:  #cbcbcb
        Light Red:   #eb8499
        Orange:      #c36043
        Purple:      #8f5abb
        Red:         #ad465c
        White:       #ffffff
        Yellow:      #fff793
        ====================


        C64 DEFAULTS:
        SCREEN_WIDTH x SCREEN_HEIGHT
        320 x 200


        SPRITE_WIDTH x SPRITE_HEIGHT
        24 x 21


        CHAR_WIDTH x CHAR_HEIGHT
        8 x 8


        TEXT_ROW x TEXT_LINES
        40 x 25


        FONT SIZE CALCULATION:
        Pixel Size to Font Point Size Conversion:
        1 Pixel Size = 0.75 Font Point Size

        SCREEN_WIDTH x SCREEN_HEIGHT
        SCREEN_WIDTH / 40 (columns) = CHARACTER_PIXEL_SIZE
        CHARACTER_PIXEL_SIZE * 0.75 = FONT_POINT_SIZE

        2560 x 1600
        2560 / 40 = 64
        64 * 0.75 = 48 (Font Point Size)

        1920 x 1200
        1920 / 40 = 48
        48 * 0.75 = 36 (Font Point Size)

    */

    //SET DEFAULTS FOR 1920 x 1200 RESOLUTION --> BORDER IS 1920 x 1200 --> BACKGROUND IS 1600 x 1000
    property int defaultscale : setdefaultScale() //5
    property int defaultspritescale : setdefaultspriteScale() //10

    property int targetscreenwidth : container.width //1920
    property int targetscreenheight : container.height //1200

    property int defaultscreenwidth : 320 * defaultscale
    property int defaultscreenheight : 200 * defaultscale

    property int defaultspritewidth : setdefaultspriteWidth() //24 * defaultspritescale
    property int defaultspriteheight : setdefaultspriteHeight() //21 * defaultspritescale

    property int defaultcharwidth : 8 * defaultscale
    property int defaultcharheight : 8 * defaultscale

    property int cbmheadertexttoppadding : setcbmheadertoppadding()

    property string c64black : "#000000"
    property string c64blue : "#104ea5"
    property string c64brown : "#8d4300"
    property string c64cyan : "#7ee7d0"
    property string c64darkgrey : "#616161"
    property string c64green : "#76bb61"
    property string c64grey : "#939393"
    property string c64lightblue : "#5796ec"
    property string c64lightgreen : "#cbffb6"
    property string c64lightgrey : "#cbcbcb"
    property string c64lightred : "#eb8499"
    property string c64orange : "#c36043"
    property string c64purple : "#8f5abb"
    property string c64red : "#ad465c"
    property string c64white : "#ffffff"
    property string c64yellow : "#fff793"

    //BORDER SECTION
    property string borderimage : "MasterAssets/Borders/CBMBorder-Black.png"


    //BACKGROUND SECTION
    property string backgroundimg : "MasterAssets/Backgrounds/Animated/CBMBackground-AnimTimeCrystal.gif"
    property int bgwidth : defaultscreenwidth
    property int bgheight : defaultscreenheight


    //FONT SECTION (1 px = .75 pt)
    property string fontstyle : "MasterAssets/Fonts/C64_Pro_Mono-STYLE.ttf"
    property int fsize : defaultcharwidth * 0.75
    property int fheight : defaultcharheight * 0.75


    //CBM HEADER SECTION 302 x 23
    property string headertext : "MasterAssets/HeaderText/CBMHeader-LightBlue.svg"
    property int headertexttoppadding : fsize * cbmheadertexttoppadding
    property int headertextimagewidth : 302 * defaultscale
    property int headertextimageheight : 23 * defaultscale
    property bool headervisible : false


    //CBM DIALOG BOX SECTION 266 x 82
    property int dialogboxtoppadding : -(fsize * .5)

    property string dialogboxtext : "SYSTEM LOGIN"
    property bool dialogboxtextvisible : false
    property string dialogboxtextcolor : c64black

    property int dialogboxtextsize : fsize
    property string dialogboximage : "MasterAssets/Windows/Solid/CBMWindow-Solid-Black-LightBlue60Percent.svg" //CBMWindow-None.svg for none
    property int dialogboximagewidth : 266 * defaultscale
    property int dialogboximageheight : 82 * defaultscale


    //AVATAR SECTION
    property int avatarleftpadding : fsize * 4
    property int avatartoppadding : fsize * 2
    property string cbmavatar : "MasterAssets/Avatars/Animated/CBMAvatar-AnimTCCraft.gif"
    property int avatarwidth : defaultspritewidth
    property int avatarheight : defaultspriteheight


    //RESTART BUTTON SECTION
    property int restartbuttonleftpadding : fsize * 3
    property int restartbuttontoppadding : fsize * 11
    property int restartbuttonimagewidth : fsize * 11
    property int restartbuttonimageheight : fsize + 10
    property string restartbuttonup : "MasterAssets/Buttons/Restart/Up/CBMRestartButtonUp-Green.svg"
    property string restartbuttondown : "MasterAssets/Buttons/Restart/Down/CBMRestartButtonDown-Green.svg"
    property string restartbuttonhover : "MasterAssets/Buttons/Restart/Hover/CBMRestartButtonHover-Green.svg"
    property string restartbuttontext : "RESTART"
    property string restartbuttoncolor : c64black
    property int restartbuttonfontsize : fsize-3


    //SHUTDOWN BUTTON SECTION
    property int shutdownleftpadding : fsize * 29.5
    property int shutdowntoppadding : fsize * 11
    property int shutdownimagewidth : fsize * 12.5
    property int shutdownimageheight : fsize + 10
    property string shutdownbuttonup : "MasterAssets/Buttons/Shutdown/Up/CBMShutdownButtonUp-Green.svg"
    property string shutdownbuttondown : "MasterAssets/Buttons/Shutdown/Down/CBMShutdownButtonDown-Green.svg"
    property string shutdownbuttonhover : "MasterAssets/Buttons/Shutdown/Hover/CBMShutdownButtonHover-Green.svg"
    property string shutdownbuttontext : "SHUTDOWN"
    property string shutdownbuttoncolor : c64black
    property int shutdownbuttonfontsize : fsize - 3


    //LOGIN BUTTON SECTION
    property int loginbuttonleftpadding : fsize * 33
    property int loginbuttontoppadding : fsize * 8.5
    property int loginbuttonimagewidth : fsize * 9
    property int loginbuttonimageheight : fsize + 10
    property string loginbuttonup : "MasterAssets/Buttons/Login/Up/CBMLoginButtonUp-Blue.svg"
    property string loginbuttondown : "MasterAssets/Buttons/Login/Down/CBMLoginButtonDown-Blue.svg"
    property string loginbuttonhover : "MasterAssets/Buttons/Login/Hover/CBMLoginButtonHover-Blue.svg"
    property string loginbuttontext : "LOGIN"
    property string loginbuttoncolor : c64white
    property int loginbuttonfontsize : fsize-2


    //USERNAME TEXT
    property int usernameleftpadding : fsize * 17
    property int usernametoppadding : fsize * 3
    property int usernamewidth : fsize * 13
    property int usernameheight : fsize
    property string usernametext : "USERNAME: "
    property string usernamecolor : c64white
    property int usernamefontsize : fsize


    //USERNAME TEXTBOX
    property int usernametextboxleftpadding : fsize * 29
    property int usernametextboxtoppadding : fsize * 2.7
    property int usernametextboxwidth : fsize * 13
    property int usernametextboxheight : fsize * 1.4
    property string usernametextboximage : "MasterAssets/UsernameBox/CBMUsernameBox-Blue.svg"
    property string usernametextboxcolor : c64yellow
    property int usernametextboxfontsize : fsize-2


    //PASSWORD TEXT
    property int passwordleftpadding : fsize * 17
    property int passwordtoppadding : fsize * 6
    property int passwordwidth : fsize * 13
    property int passwordheight : fsize
    property string passwordtext : "PASSWORD: "
    property string passwordcolor : c64white
    property int passwordfontsize : fsize


    //PASSWORD TEXTBOX
    property int passwordtextboxleftpadding : fsize * 29
    property int passwordtextboxtoppadding : fsize * 5.7
    property int passwordtextboxwidth : fsize * 13
    property int passwordtextboxheight : fsize * 1.4
    property string passwordtextboximage : "MasterAssets/PasswordBox/CBMPasswordBox-Blue.svg"
    property string passwordtextboxcolor : c64yellow
    property int passwordtextboxfontsize : fsize-2


    //COMBOBOX
    property int comboboxleftpadding : fsize * 17
    property int comboboxtoppadding : fsize * 8.5
    property string comboboxcolor : c64lightblue
    property string comboboxbordercolor : c64black
    property string comboboxhovercolor : c64black
    property string comboboxfocuscolor : c64black
    property string comboboxtextcolor : c64white
    property string comboboxmenucolor : c64yellow
    property string comboboxarrowcolor : "transparent"
    property int comboboxfontsize : fsize-2
    property int comboboxwidth : fsize * 9
    property int comboboxheight : fsize * 1.4
    property string comboboximage : "MasterAssets/Arrows/CBMArrow-Black.svg"
    property bool comboboxvisible : true

    //Set Scale
    function setdefaultScale()
    {
        var setscale = 5

        //Set UHD
        if (container.width > 1920)
        {
            setscale = 8
        }

        return setscale
    }


    //Set Sprite Scale
    function setdefaultspriteScale()
    {
        var setspritescale = 10

        //Set UHD
        if (container.width > 1920)
        {
            setspritescale = 12
        }

        return setspritescale
    }

    //Set Default Sprite Width
    function setdefaultspriteWidth()
    {
        var setwidth = 24 * defaultspritescale

        //Set UHD
        if (container.width > 1920)
        {
            setwidth = (24 * defaultspritescale) *1.5
        }

        return setwidth
    }


    //Set Default Sprite Height
    function setdefaultspriteHeight()
    {
        var setheight = 21 * defaultspritescale

        //Set UHD
        if (container.width > 1920)
        {
            setheight = (21 * defaultspritescale) *1.5
        }

        return setheight
    }

    //Set Default CBM Header Top Padding
    function setcbmheadertoppadding()
    {
        var cbmheader = 2

        //Set UHD
        if (container.width > 1920)
        {
            cbmheader = 6
        }

        return cbmheader
    }

    TextConstants {
        id : textConstants
    }

    FontLoader {
        id : loginfont
        source : fontstyle
    }

    Connections {
        target : sddm
        onLoginSucceeded : {
            errorMessage.color = "green"
            errorMessage.text = textConstants.loginSucceeded
        }
        onLoginFailed : {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
            errorMessage.bold = true
        }
    }
    color : "#4c719e"
    anchors.fill : parent

    Background {
        anchors.fill: parent
        source: borderimage
        fillMode: Image.Stretch
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }

    //SET BACKGROUND
    AnimatedImage {
        id : backgroundImage
        anchors.centerIn : container

        source : backgroundimg
        width : bgwidth
        height : bgheight
    }

    //SET HEADER 2416 x 184
    Column {
            id : entryColumn64
            anchors.horizontalCenter : parent.horizontalCenter
            topPadding : headertexttoppadding
            Image {
                anchors.centerIn : top
                id : header
                source : headertext
                width :  headertextimagewidth
                height : headertextimageheight
                visible : headervisible
            }
    }

    //SET DIALOG WINDOW BOX 2128 x 656
    Image {
        anchors.centerIn : parent
        id : promptbox
        source : dialogboximage
        width : dialogboximagewidth
        height : dialogboximageheight
        visible : true

        //SET SYSTEM LOGIN
        Column {
            id : entryColumn4
            anchors.horizontalCenter : parent.horizontalCenter
            topPadding : dialogboxtoppadding
            Text {
                color : dialogboxtextcolor
                text : dialogboxtext
                visible : dialogboxtextvisible
                font.family : loginfont.name
                font.italic : false
                font.pointSize : dialogboxtextsize
            }
        }

        //SET AVATAR
        Column {
            id : entryColumn0
            anchors.left : parent.entryColumn4
            leftPadding : avatarleftpadding
            topPadding : avatartoppadding
            Row {
                AnimatedImage {
                    id : avatar
                    source : cbmavatar
                    width : avatarwidth
                    height : avatarheight
                    visible : true
                }
            }
        }

        //SET RESTART BUTTON 576 x 64
        Column {
                id : entryColumn2
                anchors.left : parent.entryColumn4
                leftPadding : restartbuttonleftpadding
                topPadding : restartbuttontoppadding

                Image {
                    id : restartButton
                    source : restartbuttonup
                    width : restartbuttonimagewidth
                    height : restartbuttonimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = restartbuttonhover
                        }
                        onExited : {
                            parent.source = restartbuttonup
                        }
                        onPressed : {
                            parent.source = restartbuttondown
                            sddm.reboot()
                        }
                        onReleased : {
                            parent.source = restartbuttonup
                        }
                    }
                    Text {
                        verticalAlignment : Text.AlignVCenter
                        text : restartbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : restartbuttonfontsize
                        color : restartbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET SHUTDOWN BUTTON 638 x 64
        Column {
                id : entryColumn3
                anchors.left : parent.entryColumn4
                leftPadding : shutdownleftpadding
                topPadding : shutdowntoppadding

                Image {
                    id : shutdownButton
                    source : shutdownbuttonup
                    width : shutdownimagewidth
                    height : shutdownimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = shutdownbuttonhover
                        }
                        onExited : {
                            parent.source = shutdownbuttonup
                        }
                        onPressed : {
                            parent.source = shutdownbuttondown
                            sddm.powerOff()
                        }
                        onReleased : {
                            parent.source = shutdownbuttonup
                        }
                    }
                    Text {
                        text : shutdownbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : shutdownbuttonfontsize
                        color : shutdownbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET USERNAME TEXT
        Column {
            id : entryColumn5
                anchors.left : parent.entryColumn4
                leftPadding : usernameleftpadding
                topPadding : usernametoppadding

            Text {
                    id : lblLoginName
                    width : usernamewidth
                    height : usernameheight
                    visible : true
                    text : usernametext
                    font.pointSize : usernamefontsize
                    font.italic : false
                    verticalAlignment : Text.AlignVCenter
                    color : usernamecolor
                    font.family : loginfont.name
                }
        }

        //SET USERNAME BOX
        Column {
            id : entryColumn6
                anchors.left : parent.entryColumn4
                leftPadding : usernametextboxleftpadding
                topPadding : usernametextboxtoppadding

           TextField {
                    id : name
                    font.family : loginfont.name
                    font.italic : false
                    width : usernametextboxwidth
                    height : usernametextboxheight
                    text : userModel.lastUser
                    font.pointSize : usernametextboxfontsize
                    //verticalAlignment : Text.verticalAlignment
                    color : usernametextboxcolor
                    background : Image {
                        source : usernametextboximage
                    }
                    KeyNavigation.tab : password
                    Keys.onPressed : {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            password.focus = true
                            event.accepted = true
                        }
                    }
            }
        }


        //SET PASSWORD TEXT
        Column {
            id : entryColumn7
                anchors.left : parent.entryColumn4
                leftPadding : passwordleftpadding
                topPadding : passwordtoppadding

            Text {
                id : lblLoginPassword
                width : passwordwidth
                height : passwordheight
                visible : true
                text : passwordtext
                verticalAlignment : Text.AlignVCenter
                color : passwordcolor
                font.pointSize : passwordfontsize
                font.italic : false
                font.family : loginfont.name
            }
        }


        //SET PASSWORD BOX
        Column {
            id : entryColumn8
                anchors.left : parent.entryColumn4
                leftPadding : passwordtextboxleftpadding
                topPadding : passwordtextboxtoppadding
                TextField {
                    id : password

                    font.family : loginfont.name
                    font.italic : false
                    width : passwordtextboxwidth
                    height : passwordtextboxheight
                    echoMode : TextInput.Password
                    font.pointSize : passwordtextboxfontsize
                    verticalAlignment : Text.verticalAlignment
                    color : passwordtextboxcolor
                    background : Image {
                        source : passwordtextboximage
                    }
                    KeyNavigation.backtab : name
                    KeyNavigation.tab : loginButton
                    focus : true
                    Keys.onPressed : {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(name.text, password.text, sessionIndex)
                            event.accepted = true
                        }
                    }
                }
            }

            //SET LOGIN BUTTON
            Column {
                id : entryColumn9
                anchors.left : parent.entryColumn4
                leftPadding : loginbuttonleftpadding
                topPadding : loginbuttontoppadding
                Image {
                    id : loginButton
                    source : loginbuttonup
                    width : loginbuttonimagewidth
                    height : loginbuttonimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = loginbuttonhover
                        }
                        onExited : {
                            parent.source = loginbuttonup
                        }
                        onPressed : {
                            parent.source = loginbuttondown
                            sddm.login(name.text, password.text, sessionIndex)
                        }
                        onReleased : {
                            parent.source = loginbuttonup
                        }
                    }
                    Text {
                        text : loginbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : loginbuttonfontsize
                        color : loginbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET COMBOBOX
        Column {
            id : entryColumn1
            anchors.left   : parent.promptbox
            leftPadding : comboboxleftpadding
            topPadding : comboboxtoppadding

            ComboBox {
                id : session
                color : comboboxcolor
                borderColor : comboboxbordercolor
                hoverColor : comboboxhovercolor
                focusColor : comboboxfocuscolor
                textColor : comboboxtextcolor
                menuColor : comboboxmenucolor
                arrowColor: comboboxarrowcolor
                width : comboboxwidth
                height : comboboxheight
                visible : comboboxvisible
                font.pointSize : comboboxfontsize
                font.italic : false
                font.family : loginfont.name
                arrowIcon : comboboximage
                model : sessionModel
                index : sessionModel.lastIndex
                KeyNavigation.backtab : name
                KeyNavigation.tab : password
            }
        }

    }
}
