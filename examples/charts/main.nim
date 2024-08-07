import NimQml, mylistmodel

proc mainProc() =
  echo "Starting"
  var app = newQApplication()
  var myListModel = newMyListModel();
  var engine = newQQmlApplicationEngine()
  var variant = newQVariant(myListModel)

  engine.setRootContextProperty("myListModel", variant)
  engine.load("main.qml")

  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()
