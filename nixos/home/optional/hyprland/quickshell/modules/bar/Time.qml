// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "  hh:mm:ss AP t   yyyy, dd MMMM, dddd")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
