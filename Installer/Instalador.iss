; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Diboza_Punto_Venta"
#define MyAppVersion "8.5.0.0"
#define MyAppPublisher "Diboza"
#define MyAppURL ""
#define MyAppExeName "Sisfac.exe"
#define MySourceMain "..\Installer"
#define MySourceProgramFiles "Files"
#define MySourceUtilsFiles "..\Installer"
#define AppCopyright "Copyright � 2017 by Dynamic"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{EB2A461B-4F6B-432E-842F-AD993EB39395}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppPublisher}\{#MyAppName}
LicenseFile={#MySourceProgramFiles}\Acuerdo de Licencia.txt
;DisableProgramGroupPage=yes
OutputDir={#MySourceMain}
OutputBaseFilename={#MyAppName}_Instalador
SetupIconFile={#MySourceProgramFiles}\Milky.ico
Compression=lzma
SolidCompression=yes
;WizardSmallImageFile={#MySourceProgramFiles}\logoproducto.bmp
WizardSmallImageFile={#MySourceProgramFiles}\Milky.bmp
WizardImageFile={#MySourceProgramFiles}\humoverde.bmp
UninstallDisplayName={#MyAppName}
VersionInfoVersion=8.5.0.0
UninstallDisplayIcon={app}\Sisfac.exe

#define FileNamePattern GetDateTimeString ('dd/mm/yyyy', '/', ':');

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; 

[Files]
Source: {#MySourceProgramFiles}\Sisfac.exe; DestDir: "{app}"; Permissions: everyone-full; Flags: confirmoverwrite;  Check: DynamicEjecutable;
Source: {#MySourceProgramFiles}\Acuerdo de Licencia.txt; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
;Source: {#MySourceProgramFiles}\Manual de Usuario.pdf; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\SISFAC.FDB; DestDir: "{app}"; Permissions: everyone-full; Flags: onlyifdoesntexist;  Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Config_Sisfac.ini; DestDir: "{app}"; Permissions: everyone-full; Flags: onlyifdoesntexist; Check: DynamicEjecutable;
Source: {#MySourceProgramFiles}\fbclient.dll; DestDir: {win}\system32; Permissions: everyone-full; 
Source: {#MySourceProgramFiles}\fbclient.dll; DestDir: {win}\SysWOW64; Permissions: everyone-full; 
Source: {#MySourceProgramFiles}\fbclient.dll; DestDir: "{app}"; Permissions: everyone-full; 
;Source: {#MySourceProgramFiles}\Firebird-3.0.1.32609_0_Win32.exe; DestDir: "{app}"; Permissions: everyone-full; 
Source: {#MySourceProgramFiles}\msvcr100.dll; DestDir: "{sys}"; Flags: uninsneveruninstall onlyifdoesntexist ignoreversion regserver 32bit; Permissions: everyone-full; Check: msvcr100; 
Source: {#MySourceProgramFiles}\msvcr100.dll; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Firebird-3.0.1.32609_0_Win32.exe  ; DestDir: "{app}"; Permissions: everyone-full; CopyMode: dontcopy;
Source: {#MySourceProgramFiles}\Config_ReportBuild.ini; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\ReportBuild.exe; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\gbak.exe; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\libmysql.dll; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Manual de Usuario Sisfac.pdf; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Sisfac.lic; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\AnyDesk.exe; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
;Source: {#MySourceProgramFiles}\libmysql.dll; DestDir: "{app}"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Apartado210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Apartado58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Apartado76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\CierreCaja210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\CierreCaja58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\CierreCaja76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacontado210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacontado58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacontado76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacredito210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacredito58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\facturacredito76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacontado210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacontado58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacontado76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacredito210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacredito58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\proformacredito76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\reciboapartado210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\reciboapartado58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\reciboapartado76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\recibocliente210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\recibocliente58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\recibocliente76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Ordenes58.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Ordenes76.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\Plantillas\Ordenes210.fr3; DestDir: "{app}\Plantillas"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\languages\mandarin.txt; DestDir: "{app}\languages"; Permissions: everyone-full; Check: DynamicEjecutable; 
Source: {#MySourceProgramFiles}\languages\english.txt; DestDir: "{app}\languages"; Permissions: everyone-full; Check: DynamicEjecutable; 
; Source: {#MySourceProgramFiles}\DYNAMIC.FDB; DestDir: ObtenerDestinoBaseDatos; Permissions: everyone-full; Flags: confirmoverwrite;  Check: BaseDatos; 

[Icons]
Name: {commonprograms}\{#MyAppName}; Filename: {app}\{#MyAppExeName}; Flags: createonlyiffileexists;  
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Flags: createonlyiffileexists;  
Name: "{group}\Acuerdo de Licencia"; Filename: "{app}\Acuerdo de Licencia.txt"; Flags: createonlyiffileexists;  
Name: "{group}\Soporte Remoto"; Filename: "{app}\AnyDesk.exe"; Flags: createonlyiffileexists;  
;Name: "{group}\Manual de Usuario"; Filename: "{app}\Manual de Usuario.pdf"; Flags: createonlyiffileexists;  
Name: "{group}\Manual de Usuario"; Filename: "{app}\Manual de Usuario Sisfac.pdf"; Flags: createonlyiffileexists;  
Name: "{group}\Diboza"; Filename: "{app}\Sisfac.exe"; Flags: createonlyiffileexists;  
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Flags: createonlyiffileexists;  
Name: "{userdesktop}\Diboza"; Filename: "{app}\Sisfac.exe"; Tasks: desktopicon; Check: DynamicEjecutable; 
Name: "{userdesktop}\Soporte Remoto"; Filename: "{app}\AnyDesk.exe"; Tasks: desktopicon; Check: MyCheckSoporteRemoto; 
 
[Run]
;Filename: "{app}\Firebird-3.0.1.32609_0_Win32.exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent; Parameters: "/VERYSILENT /MERGETASKS=""UseSuperClassicTask\UseGuardianTask """; Check: BaseDatos;  
;Filename: "{app}\Dynamic.exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent unchecked; 

[Dirs]
Name: "{app}";  Permissions: everyone-full
Name: "{app}\Plantillas";  Permissions: everyone-full
Name: "{app}\languages";  Permissions: everyone-full
Name: ObtenerDestinoBaseDatos;  Permissions: everyone-full
          
[Registry]
Root: HKLM64; Subkey: "Software\Dynamic"; Flags: uninsdeletekeyifempty; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac"; Flags: uninsdeletekey; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "BaseDatosPath"; ValueData: "{app}\DataBase"; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "BaseDatosFull"; ValueData: "{app}\DataBase\Dynamic.FDB"; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "PathSistema"; ValueData: "{app}"; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "PathSistemaFull"; ValueData: "{app}\Dynamic.exe"; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "SistemaNombre"; ValueData: 'Dynamic'; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "FechaInstalacion"; ValueData: "{#FileNamePattern}"; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "Version"; ValueData: '1.0.0.5'; Permissions: everyone-full; Check: GetHKLM64; 
Root: HKLM64; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "Desarrollador"; ValueData: 'Dynamic'; Permissions: everyone-full; Check: GetHKLM64; 

Root: HKLM; Subkey: "Software\Dynamic"; Flags: uninsdeletekeyifempty; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac"; Flags: uninsdeletekey; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "BaseDatosPath"; ValueData: "{app}\DataBase"; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "BaseDatosFull"; ValueData: "{app}\DataBase\Dynamic.FDB"; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "PathSistema"; ValueData: "{app}"; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "PathSistemaFull"; ValueData: "{app}\Dynamic.exe"; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "SistemaNombre"; ValueData: 'Dynamic'; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "FechaInstalacion"; ValueData: "{#FileNamePattern}"; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "Version"; ValueData: '1.0.0.5'; Permissions: everyone-full; Check: GetHKLM32; 
Root: HKLM; Subkey: "Software\Dynamic\Sisfac\Settings"; ValueType: string; ValueName: "Desarrollador"; ValueData: 'Dynamic'; Permissions: everyone-full; Check: GetHKLM32; 


;Root: HKLM; Subkey: "Software\Dynamic\Dynamic\Settings"; ValueType: string; ValueName: "BaseDatosPath"; ValueData: ObtenerDestinoBaseDatos; Check: BaseDatos; 
;Root: HKLM; Subkey: "Software\Dynamic\Dynamic\Settings"; ValueType: string; ValueName: "BaseDatosFull"; ValueData: ObtenerDestinoBaseDatos + '\Dynamic.FDB'; Check: BaseDatos; 

[UninstallDelete]       
;Type: files; Name: ExpandConstant('{app}\DataBase\Dynamic.FDB')
;Type: files; Name: ObtenerDestinoBaseDatos + '\Dynamic.FDB'

[Code]
var
  Componentes: TWizardPage;
  DataDirPage: TInputDirWizardPage;
  chkDynamicEjecutable: TNewCheckBox;
  chkBaseDatos: TNewCheckBox;
  mPasaExiste_Ejecutable: Boolean;
  mPasaExiste_Firebird: Boolean;
  edtBaseDatos: TNewEdit;
  btnBuscarBaseDatos: TNewButton;
  _DirBaseDatos: string;
  _DirectorioDefault: string;

function msvcr100: Boolean;
var 
  mResultado: Boolean;
  mArchico: string;
begin
  mResultado := False;
  if (IsWin64 = False) and (chkDynamicEjecutable.Checked = True) then
  begin
    mArchico := ExpandConstant('{sys}') + '\msvcr100.dll';
    if FileExists(mArchico) = False then
      mResultado := True;
  end;
  
  Result := mResultado;
end;

function GetHKLM64: Boolean;
var 
  mResultado: Boolean;
begin
  mResultado := False;
  if (IsWin64 = True) and (chkDynamicEjecutable.Checked = True) then
    mResultado := True;
  
  Result := mResultado;
end;

function GetHKLM32: Boolean;
var 
  mResultado: Boolean;
begin
  mResultado := False;
  if (IsWin64 = False) and (chkDynamicEjecutable.Checked = True) then
    mResultado := True;
  
  Result := mResultado;
end;

function GetFecha: string;
begin
  Result := GetDateTimeString ('yyyy/mm/dd', '/', ':');
end;

function BaseDatos(): Boolean;
var
  ResultCode: Integer;
begin                           
//  if chkBaseDatos.Checked = True then       
    //Exec(ExpandConstant('{app}\Firebird-3.0.1.32609_0_Win32.exe'), '', '', SW_SHOW,
   //  ewWaitUntilTerminated, ResultCode)  
  Result := chkBaseDatos.Checked;
end;

function DynamicEjecutable(): Boolean;
begin
  if chkDynamicEjecutable.Checked = True then
  begin
  //  RegQueryStringValue(GetHKLM(), 'Software\Dynamic\Dynamic\Settings', 'BaseDatosPath', '{app}\DataBase');
  end;

  Result := chkDynamicEjecutable.Checked;
end;

procedure btnBuscarBaseDatosClick(Sender: TObject);
var
  mDirectorioDefault: String;
  mDirectorio: string;
begin
   mDirectorioDefault := _DirectorioDefault;
   mDirectorio :=  _DirectorioDefault;
   if BrowseForFolder(mDirectorioDefault,mDirectorio, True) then
   begin
    edtBaseDatos.Text := mDirectorio; 
    edtBaseDatos.Hint := mDirectorio;
    _DirBaseDatos := mDirectorio;
  end;
end;

function ObtenerDestinoBaseDatos: string;
begin
  Result := _DirBaseDatos;
end;

procedure Crear_Form_Componentes;
var
  mDirectorioDefault: String;
begin

  mDirectorioDefault := ExpandConstant('{sd}') + '\Data';
  if DirExists(mDirectorioDefault) = False then
    CreateDir(mDirectorioDefault);
  _DirectorioDefault := mDirectorioDefault;

  Componentes := CreateCustomPage(
    wpLicense,
    'Componentes',
     'Seleccione los componentes a instalar'
  );

  chkDynamicEjecutable := TNewCheckBox.Create(Componentes);
  chkDynamicEjecutable.Top := 10;
  chkDynamicEjecutable.Width := Componentes.SurfaceWidth;
  chkDynamicEjecutable.Caption := 'Diboza 8.5.0.0';
  chkDynamicEjecutable.Checked := False;
  chkDynamicEjecutable.Parent := Componentes.Surface;
  
  chkBaseDatos := TNewCheckBox.Create(Componentes);
  chkBaseDatos.Top := chkDynamicEjecutable.Top + 40;
  chkBaseDatos.Width := Componentes.SurfaceWidth;
  chkBaseDatos.Caption := 'Firebird 3.0';
  chkBaseDatos.Checked := False;
  chkBaseDatos.Parent := Componentes.Surface;

  edtBaseDatos := TNewEdit.Create(Componentes);
  edtBaseDatos.Top := chkBaseDatos.Top + 40;
  edtBaseDatos.Width := Componentes.SurfaceWidth - 40;
  edtBaseDatos.Parent := Componentes.Surface;
  edtBaseDatos.Text := mDirectorioDefault;
  edtBaseDatos.ReadOnly := True;
  edtBaseDatos.Visible := False;

  btnBuscarBaseDatos := TNewButton.Create(Componentes);
  btnBuscarBaseDatos.Top := chkBaseDatos.Top + 40;
  btnBuscarBaseDatos.Left :=  edtBaseDatos.Width + 5;
  btnBuscarBaseDatos.Width := 25;
  btnBuscarBaseDatos.Caption := '?';
  btnBuscarBaseDatos.Hint := 'Buscar Base de Datos';
  btnBuscarBaseDatos.Parent := Componentes.Surface;
  btnBuscarBaseDatos.OnClick := @btnBuscarBaseDatosClick;
  btnBuscarBaseDatos.Visible := False;
end;

procedure InitializeWizard();
var
  mDirectorioFirebird: string;
begin
  mPasaExiste_Ejecutable := False;
  mPasaExiste_Firebird := False;
  Crear_Form_Componentes;

  //MsgBox(ExpandConstant('{#MySourceMain}') + ExpandConstant('{src}'), mbInformation, MB_OK);
end;
    
procedure CurPageChanged(CurPageID: Integer);
begin
  WizardForm.RunList.Visible := False;
  WizardForm.TasksList.Visible := False;
{
  if CurPageID = wpSelectTasks then
  begin
    if chkArchivosPrograma.Checked = False then
      WizardForm.TasksList.Visible := False
    else
      WizardForm.TasksList.Visible := True;
  end;

  if CurPageID = wpFinished then
  begin
    if chkArchivosPrograma.Checked = False then
      WizardForm.RunList.Visible := False
    else
      WizardForm.RunList.Visible := True;
  end;                           }
end;
        
function ComponentesSeleccionados: Boolean;
var
  mSeleccionado: Boolean;
begin
  mSeleccionado := False;

  if chkDynamicEjecutable.Checked = True then
    mSeleccionado := True;
  if chkBaseDatos.Checked = True then
    mSeleccionado := True;
  
  Result := mSeleccionado;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var 
  mResultado: Boolean;
  mPasa: Integer;
  ResultCode: Integer;
begin
  mResultado := True;
  mPasa := 0;

 if (CurPageID = Componentes.Id) then 
 begin
   mResultado := ComponentesSeleccionados;
   if mResultado = False then
     MsgBox('Debe seleccionar alg�n componente', mbError, MB_OK);
   mPasa := 1;
  if chkBaseDatos.Checked = True then
  begin
     ExtractTemporaryFiles('{app}\Firebird-3.0.1.32609_0_Win32.exe');
     ExecAsOriginalUser(ExpandConstant('{tmp}\')+'{app}\Firebird-3.0.1.32609_0_Win32.exe', '/VERYSILENT /MERGETASKS=""UseSuperClassicTask\UseGuardianTask', '',
       SW_SHOWNORMAL, ewWaitUntilTerminated, ResultCode);
  end;
 end;

 Result := mResultado;
end;
         
function MyCheckSoporteRemoto(): Boolean;
begin
  Result := True;
  
  If (FileExists('{userdesktop}\Soporte Remoto.lnk')) and (chkDynamicEjecutable.Checked = True) then 
    Result := False
  else
    Result := True;
end;
