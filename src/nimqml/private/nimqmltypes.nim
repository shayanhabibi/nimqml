type
  QObject* = ref QObjectObj
  QObjectObj* = object of RootObj ## \
    ## A QObject
    vptr: DosQObject
    owner: bool

  QAbstractItemModel* = ref QAbstractItemModelObj
  QAbstractItemModelObj* = object of QObject ## \
    ## A QAbstractItemModel

  QAbstractListModel* = ref QAbstractListModelObj
  QAbstractListModelObj* = object of QAbstractItemModel ## \
    ## A QAbstractListModel

  QAbstractTableModel* = ref QAbstractTableModelObj
  QAbstractTableModelObj* = object of QAbstractItemModel ## \
    ## A QAbstractTableModel

  QVariant* = ref QVariantObj
  QVariantObj* = object of RootObj ## \
    ## A QVariant
    vptr: DosQVariant

  QQmlApplicationEngine* = ref QQmlApplicationEngineObj
  QQmlApplicationEngineObj* = object of RootObj ## \
    ## A QQmlApplicationEngine
    vptr: DosQQmlApplicationEngine

  QCoreApplication* = ref QCoreApplicationObj
  QCoreApplicationObj* = object of RootObj ## \
    ## A QCoreApplication
    deleted: bool

  QGuiApplication* = ref QGuiApplicationObj
  QGuiApplicationObj* = object of QCoreApplication ## \

  QApplication* = ref QApplicationObj
  QApplicationObj* = object of QGuiApplication ## \

  QQuickView* = ref QQuickViewObj
  QQuickViewObj* = object of RootObj ## \
    # A QQuickView
    vptr: DosQQuickView

  QHashIntByteArray* = ref QHashIntByteArrayObj
  QHashIntByteArrayObj* = object of RootObj ## \
    # A QHash<int, QByteArray>
    vptr: DosQHashIntByteArray

  QModelIndex* = ref QModelIndexObj
  QModelIndexObj* = object of RootObj ## \
    # A QModelIndex
    vptr: DosQModelIndex

  QResource* = ref QResourceObj
  QResourceObj* = object of RootObj ## \
    # A QResource

  QtItemFlag*{.pure, size: sizeof(cint).} = enum ## \
    ## Item flags
    ##
    ## This enum mimic the Qt::itemFlag C++ enum
    None = 0.cint,
    IsSelectable = 1.cint,
    IsEditable = 2.cint,
    IsDragEnabled = 4.cint,
    IsDropEnabled = 8.cint,
    IsUserCheckable = 16.cint,
    IsEnabled = 32.cint,
    IsTristate = 64.cint,
    NeverHasChildren = 128.cint

  QtOrientation*{.pure, size: sizeof(cint).} = enum ## \
    ## Define orientation
    ##
    ## This enum mimic the Qt::Orientation C++ enum
    Horizontal = 1.cint,
    Vertical = 2.cint

  QMetaType*{.pure, size: sizeof(cint).} = enum ## \
    ## Qt metatypes values used for specifing the
    ## signals and slots argument and return types.
    ##
    ## This enum mimic the QMetaType::Type C++ enum
    UnknownType = 0.cint,
    Bool = 1.cint,
    Int = 2.cint,
    QString = 10.cint,
    VoidStar = 31.cint,
    Float = 38.cint,
    QObjectStar = 39.cint,
    QVariant = 41.cint,
    Void = 43.cint

  ConnectionType* = enum ## \
    ## Qt connection type
    AutoConnection = 0.cint,
    DirectConnnection = 1.cint,
    QueuedConnection = 2.cint,
    BlockingQueuedConnnection = 3.cint,
    UniqueConnection = 0x80.cint

  ParameterDefinition* = object
    name*: string
    metaType*: QMetaType

  SignalDefinition* = object
    name*: string
    parameters*: seq[ParameterDefinition]

  SlotDefinition* = object
    name*: string
    returnMetaType*: QMetaType
    parameters*: seq[ParameterDefinition]

  PropertyDefinition* = object
    name*: string
    propertyMetaType*: QMetaType
    readSlot*: string
    writeSlot*: string
    notifySignal*: string

  QMetaObject* = ref QMetaObjectObj
  QMetaObjectObj* = object of RootObj
    vptr: DosQMetaObject
    signals: seq[SignalDefinition]
    slots: seq[SlotDefinition]
    properties: seq[PropertyDefinition]

  QUrl* = ref QUrlObj
  QUrlObj* = object of RootObj
    vptr: DosQUrl

  QUrlParsingMode*{.pure, size: sizeof(cint).} = enum
    Tolerant = 0.cint
    Strict = 1.cint

  Ownership {.pure.} = enum ## \
    ## Specify the ownership of a pointer
    Take,                   # The ownership is passed to the wrapper
    Clone                   # The node should be cloned

  QMetaObjectConnection = ref QMetaObjectConnectionObj
  QMetaObjectConnectionObj = object
    vptr: DosQMetaObjectConnection

  LambdaInvokerProc = proc(arguments: seq[QVariant]) {.closure.}
  LambdaInvoker = ref object
    id: int
    lock: Lock
    lambdas: Table[int, LambdaInvokerProc]

const
  UserRole* = 0x100

proc `=destroy`(self: var QObjectObj) =
  if self.owner and not self.vptr.isNil:
    dos_qobject_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QVariantObj) =
  if not self.vptr.isNil:
    dos_qvariant_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QGuiApplicationObj) =
  if not self.deleted:
    dos_qguiapplication_delete()
    self.deleted = true

proc `=destroy`(self: var QHashIntByteArrayObj) =
  if not self.vptr.isNil:
    dos_qhash_int_qbytearray_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QMetaObjectObj) =
  if not self.vptr.isNil:
    dos_qmetaobject_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QMetaObjectConnectionObj) =
  if not self.vptr.isNil:
    dos_qmetaobject_connection_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QModelIndexObj) =
  if not self.vptr.isNil:
    dos_qmodelindex_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QQmlApplicationEngineObj) =
  if not self.vptr.isNil:
    dos_qqmlapplicationengine_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QQuickViewObj) =
  if not self.vptr.isNil:
    dos_qquickview_delete(self.vptr)
    self.vptr = nil

proc `=destroy`(self: var QUrlObj) =
  if not self.vptr.isNil:
    dos_qurl_delete(self.vptr)
    self.vptr = nil
