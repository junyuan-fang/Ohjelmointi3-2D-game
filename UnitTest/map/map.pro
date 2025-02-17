QT += testlib
QT += core gui widgets network multimedia

TARGET=maptest
CONFIG += qt console warn_on depend_includepath testcase
CONFIG -= app_bundle

TEMPLATE = app

SOURCES +=  tst_maptest.cpp\
../../Game/gameview.cpp \
../../Game/graphicsItem/aircrew.cpp \
../../Game/graphicsItem/backgrounditem.cpp \
../../Game/graphicsItem/bank.cpp \
../../Game/graphicsItem/cleaner.cpp \
../../Game/graphicsItem/enemy.cpp \
../../Game/graphicsItem/hiteffect.cpp \
../../Game/graphicsItem/hospitalgate.cpp \
../../Game/graphicsItem/penguin.cpp \
../../Game/graphicsItem/player.cpp \
../../Game/graphicsItem/questlight.cpp \
../../Game/graphicsItem/sceneitem.cpp \
../../Game/graphicsItem/teacher.cpp \
../../Game/graphicsItem/train.cpp \
../../Game/graphicsItem/tutor.cpp \
../../Game/window/login.cpp \
../../Game/map/airportmap.cpp \
../../Game/map/basemap.cpp \
../../Game/map/citymap.cpp \
../../Game/map/hospitalmap.cpp \
../../Game/map/universitymap.cpp \
../../Game/scene/airportscene.cpp \
../../Game/scene/basicscene.cpp \
../../Game/scene/cityscene.cpp \
../../Game/scene/endscene.cpp \
../../Game/scene/hospitalscene.cpp \
../../Game/scene/startscene.cpp \
../../Game/scene/tamperescene.cpp \
../../Game/scene/universityscene.cpp \
../../Game/window/buswindow.cpp \
../../Game/window/talkwindow.cpp

DEFINES += SRCDIR=\\\"$$PWD/\\\"

HEADERS += ../../Game/map/airportmap.hh \
../../Game/map/basemap.hh \
../../Game/map/citymap.hh \
../../Game/map/hospitalmap.hh \
../../Game/map/universitymap.hh \
../../Game/gameview.hh\
../../Game/Constants.hh \
../../Game/graphicsItem/aircrew.hh \
../../Game/graphicsItem/backgrounditem.hh \
../../Game/graphicsItem/bank.hh \
../../Game/graphicsItem/cleaner.hh \
../../Game/graphicsItem/enemy.hh \
../../Game/graphicsItem/hiteffect.hh \
../../Game/graphicsItem/hospitalgate.hh \
../../Game/graphicsItem/penguin.hh \
../../Game/graphicsItem/player.hh \
../../Game/graphicsItem/questlight.hh \
../../Game/graphicsItem/sceneitem.hh \
../../Game/graphicsItem/teacher.hh \
../../Game/graphicsItem/train.hh \
../../Game/graphicsItem/tutor.hh \
../../Game/window/login.hh \
../../Game/scene/airportscene.hh \
../../Game/scene/basicscene.hh \
../../Game/scene/cityscene.hh \
../../Game/scene/endscene.hh \
../../Game/scene/hospitalscene.hh \
../../Game/scene/startscene.hh \
../../Game/scene/tamperescene.hh \
../../Game/scene/universityscene.hh \
../../Game/window/buswindow.hh \
../../Game/window/talkwindow.hh

FORMS += ../../Game/window/login.ui\
../../Game/window/buswindow.ui\
../../Game/window/talkwindow.ui\


INCLUDEPATH += \
../../Game/\

RESOURCES+= \
../../Game/map.qrc \

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../Course/CourseLib/release/ -lCourseLib
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../Course/CourseLib/debug/ -lCourseLib
else:unix: LIBS += -L$$OUT_PWD/../../Course/CourseLib/ -lCourseLib

INCLUDEPATH += $$PWD/../../Course/CourseLib
DEPENDPATH += $$PWD/../../Course/CourseLib

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../Course/CourseLib/release/libCourseLib.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../Course/CourseLib/debug/libCourseLib.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../Course/CourseLib/release/CourseLib.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../../Course/CourseLib/debug/CourseLib.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../../Course/CourseLib/libCourseLib.a
