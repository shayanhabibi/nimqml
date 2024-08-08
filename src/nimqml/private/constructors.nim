############# QObject #############
proc setup*(self: QObject) 

proc newQObject*(): QObject =
  ## Return a new QObject
  new(result)
  result.setup()

############# QAbstractItemModel #############
proc setup*(self: QAbstractItemModel)
proc newQAbstractItemModel*(): QAbstractItemModel =
  ## Return a new QAbstractItemModel
  debugMsg("QAbstractItemModel", "new")
  new(result)
  result.setup()

############# QAbstractListModel #############
proc setup*(self: QAbstractListModel)
proc newQAbstractListModel*(): QAbstractListModel =
  ## Return a new QAbstractListModel
  debugMsg("QAbstractListModel", "new")
  new(result)
  result.setup()

############# QAbstractTableModel #############
proc setup*(self: QAbstractTableModel)
proc newQAbstractTableModel*(): QAbstractTableModel =
  ## Return a new QAbstractTableModel
  debugMsg("QAbstractTableModel", "new")
  new(result)
  result.setup()

############# QVariant #############
proc setup*(variant: QVariant)
proc setup*(variant: QVariant, value: int)
proc setup*(variant: QVariant, value: bool)
proc setup*(variant: QVariant, value: string)
proc setup*(variant: QVariant, value: QObject)
proc setup*(variant: QVariant, value: DosQVariant, takeOwnership: Ownership)
proc setup*(variant: QVariant, value: cfloat)
proc setup*(variant: QVariant, value: cdouble)
proc setup*(variant: QVariant, value: QVariant)

proc newQVariant*(): QVariant =
  ## Return a new QVariant
  new(result)
  result.setup()

proc newQVariant*(value: int): QVariant =
  ## Return a new QVariant given a cint
  new(result)
  result.setup(value)

proc newQVariant*(value: bool): QVariant =
  ## Return a new QVariant given a bool
  new(result)
  result.setup(value)

proc newQVariant*(value: string): QVariant =
  ## Return a new QVariant given a string
  new(result)
  result.setup(value)

proc newQVariant*(value: QObject): QVariant =
  ## Return a new QVariant given a QObject
  new(result)
  result.setup(value)

proc newQVariant(value: DosQVariant, takeOwnership: Ownership): QVariant =
  ## Return a new QVariant given a raw QVariant pointer
  new(result)
  result.setup(value, takeOwnership)

proc newQVariant*(value: QVariant): QVariant =
  ## Return a new QVariant given another QVariant
  new(result)
  result.setup(value)

proc newQVariant*(value: cfloat): QVariant =
  ## Return a new QVariant given a float
  new(result)
  result.setup(value)

############# QUrl #############
proc setup*(self: QUrl, url: string, mode: QUrlParsingMode)
proc newQUrl*(url: string, mode: QUrlParsingMode = QUrlParsingMode.Tolerant): QUrl =
  ## Create a new QUrl
  new(result)
  result.setup(url, mode)

############# QQuickView #############
proc setup*(self: QQuickView)
proc newQQuickView*(): QQuickView =
  ## Return a new QQuickView
  new(result)
  result.setup()

############# QQmlApplicationEngine #############
proc setup*(self: QQmlApplicationEngine)
proc newQQmlApplicationEngine*(): QQmlApplicationEngine =
  ## Return a new QQmlApplicationEngine
  new(result)
  result.setup()

############# QModelIndex #############
proc setup*(self: QModelIndex)
proc setup(self: QModelIndex, other: DosQModelIndex, takeOwnership: Ownership)

proc newQModelIndex*(): QModelIndex =
  ## Return a new QModelIndex
  new(result)
  result.setup()

proc newQModelIndex(vptr: DosQModelIndex, takeOwnership: Ownership): QModelIndex =
  ## Return a new QModelIndex given a raw index
  new(result)
  result.setup(vptr, takeOwnership)  

############# QMetaObjectConnection #############
proc new*(typ: type QMetaObjectConnection, vptr: DosQMetaObjectConnection): QMetaObjectConnection =
  new(result)
  result.vptr = vptr  

############# QMetaObject #############
proc setup(superClass: QMetaObject,
           className: string,
           signals: seq[SignalDefinition],
           slots: seq[SlotDefinition],
           properties: seq[PropertyDefinition]): DosQMetaObject

proc newQObjectMetaObject*(): QMetaObject =
  ## Create the QMetaObject of QObject
  debugMsg("QMetaObject", "newQObjectMetaObject")
  new(result)
  result.vptr = dos_qobject_qmetaobject()

proc newQAbstractItemModelMetaObject*(): QMetaObject =
  ## Create the QMetaObject of QAbstractItemModel
  debugMsg("QMetaObject", "newQAbstractItemModelMetaObject")
  new(result)
  result.vptr = dos_qabstractitemmodel_qmetaobject()

proc newQAbstractListModelMetaObject*(): QMetaObject =
  ## Create the QMetaObject of QAbstractListModel
  debugMsg("QMetaObject", "newQAbstractListModelMetaObject")
  new(result)
  result.vptr = dos_qabstractlistmodel_qmetaobject()

proc newQAbstractTableModelMetaObject*(): QMetaObject =
  ## Create the QMetaObject of QAbstractTableModel
  debugMsg("QMetaObject", "newQAbstractItemTableMetaObject")
  new(result)
  result.vptr = dos_qabstracttablemodel_qmetaobject()

proc newQMetaObject*(superClass: QMetaObject, className: string,
                     signals: seq[SignalDefinition],
                     slots: seq[SlotDefinition],
                     properties: seq[PropertyDefinition]): QMetaObject =
  ## Create a new QMetaObject
  debugMsg("QMetaObject", "newQMetaObject" & className)
  new(result)
  result.signals = signals
  result.slots = slots
  result.properties = properties
  result.vptr = setup(superClass, className, signals, slots, properties)

############# QHashIntByteArray #############
proc setup*(self: QHashIntByteArray)
proc newQHashIntQByteArray*(): QHashIntByteArray =
  ## Create a new QHashIntQByteArray
  new(result)
  result.setup()

############# QGuiApplication #############
proc setup*(self: QGuiApplication)
proc newQGuiApplication*(): QGuiApplication =
  ## Return a new QApplication
  new(result)
  result.setup()

############# LambdaInvoker #############
proc new(typ: type LambdaInvoker): LambdaInvoker =
  ## Create the lambda invoker
  new(result)
  result.id = 0
  result.lock.initLock()
  result.lambdas = initTable[int, LambdaInvokerProc]()
  
