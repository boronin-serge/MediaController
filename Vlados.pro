QT += qml quick

CONFIG += c++11

SOURCES += main.cpp

RESOURCES += \
    assets/js.qrc \
    assets/data.qrc \
    assets/qml/components.qrc \
    assets/qml/controllers.qrc \
    assets/qml/defs.qrc \
    assets/qml/views.qrc \
    assets/qml/root.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    assets/js/Flags.js \
    assets/js/Storage.js \
    assets/js/Utils.js \
    assets/js/Utils.jsc \
    assets/images/qml/Components/functional/DrawerMenu.qml \
    assets/images/qml/Components/functional/Header.qml \
    assets/images/qml/Components/functional/MenuButton.qml \
    assets/images/qml/Components/functional/Screen.qml \
    assets/images/qml/Components/visual/Hamburger.qml \
    assets/images/qml/Components/visual/PressEffect.qml \
    assets/images/qml/Components/visual/SideShadow.qml \
    assets/images/qml/Controllers/InternetController.qml \
    assets/images/qml/Defs/Defs.qml \
    assets/images/qml/Views/StartPage.qml \
    assets/images/qml/Views/Stat.qml \
    assets/images/qml/Views/Tests.qml \
    assets/images/qml/Views/View.qml \
    assets/images/qml/main.qml \
    assets/images/qml/Navigator.qml \
    assets/images/qml/RootForm.qml \
    assets/qml/Components/functional/DrawerMenu.qml \
    assets/qml/Components/functional/Header.qml \
    assets/qml/Components/functional/MenuButton.qml \
    assets/qml/Components/functional/Screen.qml \
    assets/qml/Components/visual/Hamburger.qml \
    assets/qml/Components/visual/PressEffect.qml \
    assets/qml/Components/visual/SideShadow.qml \
    assets/qml/Controllers/InternetController.qml \
    assets/qml/Defs/Defs.qml \
    assets/qml/Views/StartPage.qml \
    assets/qml/Views/Stat.qml \
    assets/qml/Views/Tests.qml \
    assets/qml/Views/View.qml \
    assets/qml/main.qml \
    assets/qml/Navigator.qml \
    assets/qml/RootForm.qml
