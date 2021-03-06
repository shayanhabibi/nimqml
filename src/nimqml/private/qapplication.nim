proc setup*(application: QApplication, appName: string) =
  ## Setup a new QApplication
  dos_qapplication_create(appName.cstring)
  application.deleted = false

proc exec*(application: QApplication) =
  ## Start the Qt event loop
  dos_qapplication_exec()

proc quit*(application: QApplication) =
  ## Quit the Qt event loop
  dos_qapplication_quit()

proc icon*(application: QApplication, filename: string) =
  dos_qapplication_icon(filename.cstring)

proc setClipboardText*(text: string = "") =
  dos_qapplication_clipboard_setText(text.cstring)

proc delete*(application: QApplication) =
  ## Delete the given QApplication
  if application.deleted:
    return
  debugMsg("QApplication", "delete")
  dos_qapplication_delete()
  application.deleted = true

proc newQApplication*(appName: string = "Unknown"): QApplication =
  ## Return a new QApplication
  new(result, delete)
  result.setup(appName)
