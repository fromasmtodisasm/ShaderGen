TEMPLATE = app
TARGET = ShaderGen
DESTDIR  = ../build

QT += opengl
DEPENDPATH += .
INCLUDEPATH += . ../3rdparty/glew-1.7.0/include

macx {
ICON = ShaderGen.icns
QMAKE_INFO_PLIST = Info.plist
}

linux-g++ {
LIBS += -lGLU
}

# Input
HEADERS += AboutDialog.h \
           SGCanvasWrapper.h \
           SGFrame.h \
           SGFixedGLState.h \
           SGModels.h \
           SGOglNotebook.h \
           SGSurfaces.h \
           SGShaderGenerator.h \
           SGShaderTextWindow.h \
           SGCanvasMouseHandler.h \
           SGCanvas.h \
           SGTextures.h \
           SGOglFogNBPage.h \
           SGOglMaterialNBPage.h \
           UtilityFunctions.h \
           SGOglLightNBPage.h \
           SGOglTextureCoordNBPage.h \
           SGOglTextureEnvNBPage.h \
           Vector.h \
           QColorButton.h

SOURCES += App.cpp \
           AboutDialog.cpp \
           SGCanvasWrapper.cpp \
           SGFrame.cpp \
           SGFixedGLState.cpp \
           SGModels.cpp \
           SGOglNotebook.cpp \
           SGSurfaces.cpp \
           SGShaderGenerator.cpp \
           SGCanvas.cpp \
           SGCanvasMouseHandler.cpp \
           SGShaderTextWindow.cpp \
           SGOglFogNBPage.cpp \
           SGOglMaterialNBPage.cpp \
           UtilityFunctions.cpp \
           SGTextures.cpp \
           SGOglLightNBPage.cpp \
           SGOglTextureCoordNBPage.cpp \
           SGOglTextureEnvNBPage.cpp \
           Vector.cpp \
    QColorButton.cpp

LIBS += -L../build -lGLEW