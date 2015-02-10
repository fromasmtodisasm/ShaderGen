/************************************************************************
* Author(s):    Inderaj Bains and Joshua Doss                           *
* Last Modified: 10/31/2005                                             *
************************************************************************/
/************************************************************************
*                                                                       *
*               Copyright (C) 2002-2005  3Dlabs Inc. Ltd.               *
*                                                                       *
*                        All rights reserved.                           *
*                                                                       *
* Redistribution and use in source and binary forms, with or without    *
* modification, are permitted provided that the following conditions    *
* are met:                                                              *
*                                                                       *
*     Redistributions of source code must retain the above copyright    *
*     notice, this list of conditions and the following disclaimer.     *
*                                                                       *
*     Redistributions in binary form must reproduce the above           *
*     copyright notice, this list of conditions and the following       *
*     disclaimer in the documentation and/or other materials provided   *
*     with the distribution.                                            *
*                                                                       *
*     Neither the name of 3Dlabs Inc. Ltd. nor the names of its         *
*     contributors may be used to endorse or promote products derived   *
*     from this software without specific prior written permission.     *
*                                                                       *
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS   *
* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT     *
* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS     *
* FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE        *
* COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, *
* INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  *
* BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;      *
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER      *
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT    *
* LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN     *
* ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                           *
*                                                                       *
************************************************************************/

#include "SGOglNotebook.h"
#include "SGOglLightNBPage.h"
#include "SGOglMaterialNBPage.h"
#include "SGOglFogNBPage.h"
#include "SGOglTextureCoordNBPage.h"
#include "SGOglTextureEnvNBPage.h"
#include "SGFixedGLState.h"
#include "SGTextures.h"
#include "SGFrame.h"

SGOglNotebook::SGOglNotebook(SGFixedGLState* glState, SGFrame * parent)
    : QTabWidget(parent),
      m_parent(parent)
{
    lightPage = new SGOglLightNBPage(glState, this);
    materialPage = new SGOglMaterialNBPage(glState, this);
    fogPage = new SGOglFogNBPage(glState, this);
    textureCoordPage = new SGOglTextureCoordNBPage(glState, this);
    textureEnvPage = new SGOglTextureEnvNBPage(glState, this);

    connect(lightPage, SIGNAL(valueChanged()), SLOT(OnValueChange()));
    connect(materialPage, SIGNAL(valueChanged()), SLOT(OnValueChange()));
    connect(fogPage, SIGNAL(valueChanged()), SLOT(OnValueChange()));
    connect(textureCoordPage, SIGNAL(valueChanged()), SLOT(OnValueChange()));
    connect(textureEnvPage, SIGNAL(valueChanged()), SLOT(OnValueChange()));

    addTab(lightPage, tr("LIGHT"));
    addTab(materialPage, tr("MATERIAL"));
    addTab(fogPage, tr("FOG"));
    addTab(textureCoordPage, tr("TEXTURE COORDINATE SET"));
    addTab(textureEnvPage, tr("TEXTURE ENVIRONMENT SET"));
}

SGOglNotebook::~SGOglNotebook()
{
}

void SGOglNotebook::OnValueChange()
{
    emit valueChanged();
}
