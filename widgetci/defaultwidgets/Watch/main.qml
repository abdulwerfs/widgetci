/*
    == Widgetci - https://github.com/eminfedar/widgetci ==

    "THIS 'watch' IS ONE OF THE DEFAULT WIDGETS OF 'WIDGETCI'.
    CAN BE EDITED AND USED FREELY."

    - @eminfedar
*/

import QtQuick 2.5

Item {
    id:base;
    width: (timeText.width > dateText.width ? timeText.width : dateText.width) + 8;
    height: dateText.height + dateText.y;

    property var locale: Qt.locale();
    property real intervalMs:  (60050 - ((new Date().getSeconds() * 1000) + new Date().getMilliseconds()));

    Timer{
        interval: intervalMs; running: true; repeat: true;
        onTriggered: {
            intervalMs = 60000; // Did this because of precise reloading when the time arrived.
            timeText.text = new Date().toLocaleString(locale, "HH:mm");
            base.width = (timeText.width > dateText.width ? timeText.width : dateText.width) + 8;
        }
    }
    Text{
        id:timeText;
        x: (dateText.width - timeText.width > 0 ? (dateText.width - timeText.width) + 8 : 8);

        horizontalAlignment: Text.AlignRight;
        font.pointSize: 72;
        font.family: "San Francisco Display, Segoe UI Light, Noto Sans";
        font.weight: Font.Thin;

        text: new Date().toLocaleString(locale, "HH:mm");
        color: "#FFFFFF";
    }

    Text{
        id:dateText;
        x: (timeText.width - dateText.width > 0 ? (timeText.width - dateText.width) : 0);
        y: timeText.height - 14;

        horizontalAlignment: Text.AlignRight;
        font.pointSize: 24;
        font.family: "San Francisco Display, Segoe UI Light, Noto Sans";
        font.weight: Font.Thin;

        text: new Date().toLocaleString(locale, "dddd, dd/MM");
        color: "#FFFFFF";
    }
}
