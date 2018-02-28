; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "GLSL ShaderGen"
#define MyAppVersion "3.4.0"
#define MyAppPublisher "mojocorp"
#define MyAppURL "https://github.com/mojocorp/ShaderGen"
#define MyAppExeName "ShaderGen.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{997D835B-548A-41B7-8DFF-4FB32DACB834}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=../../License.txt
OutputBaseFilename=ShaderGen-{#MyAppVersion}
Compression=lzma
SolidCompression=yes
SetupIconFile=../../source/ShaderGen.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "../../build/ShaderGen.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../build/Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../build/Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../build/Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../build/platforms/qwindows.dll"; DestDir: "{app}/platforms"; Flags: ignoreversion

Source: "../../build/vcredist_x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\vcredist_x64.exe"; Parameters: "/q"; Description: "Install ""Redistributable Package"""; WorkingDir: {tmp}; Flags: skipifdoesntexist runascurrentuser;
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent

