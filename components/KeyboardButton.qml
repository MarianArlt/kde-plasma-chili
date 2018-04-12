import QtQuick 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

import QtQuick.Controls 1.3 as QQC

PlasmaComponents.ToolButton {
    id: keyboardButton

    Image {
        id: keyboardLayoutIcon
        source: "artwork/character-set.svgz"
        sourceSize: Qt.size(14, 14)
        smooth: true
        anchors.top: parent.top
        anchors.topMargin: height - 4
        anchors.left: parent.left
        anchors.leftMargin: -width - 1
    }

    property int currentIndex: -1
    font.family: "Noto Sans"
    font.pointSize: root.height/75
    text: instantiator.objectAt(currentIndex).shortName
    implicitWidth: minimumWidth
    visible: menu.items.length > 1
    anchors.left: parent.left
    anchors.leftMargin:7

    Component.onCompleted: currentIndex = Qt.binding(function() {return keyboard.currentLayout});

    menu: QQC.Menu {
        id: keyboardMenu
        Instantiator {
            id: instantiator
            model: keyboard.layouts
            onObjectAdded: keyboardMenu.insertItem(index, object)
            onObjectRemoved: keyboardMenu.removeItem( object )
            delegate: QQC.MenuItem {
                text: modelData.longName
                property string shortName: modelData.shortName
                onTriggered: {
                    keyboard.currentLayout = model.index
                }
            }
        }
    }
}
