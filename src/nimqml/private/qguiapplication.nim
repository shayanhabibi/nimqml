proc setup*(self: QGuiApplication) =
  ## Setup a new QApplication
  dos_qguiapplication_create()
  self.deleted = false

proc exec*(self: QGuiApplication) =
  ## Start the Qt event loop
  dos_qguiapplication_exec()

proc quit*(self: QGuiApplication) =
  ## Quit the Qt event loop
  dos_qguiapplication_quit()
