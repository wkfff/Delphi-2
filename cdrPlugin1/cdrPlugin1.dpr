library cdrPlugin1;

{ Reduce EXE size by disabling as much of RTTI as possible (delphi 2009/2010) }
{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

{$R *.dres}

uses
  Winapi.Windows,
  Winapi.ActiveX,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  VGCore_TLB in 'X8\VGCore_TLB.pas',
  frmMain in 'frmMain.pas' {fMain},
  BaseForm in 'BaseForm.pas' {TBaseForm},
  frmToJPG in 'frmToJPG.pas' {fToJPG},
  frmTest in 'frmTest.pas' {fTest},
  Utils in 'Utils.pas',
  frmConvertTo in 'frmConvertTo.pas' {fConvertTo},
  frmScreen in 'frmScreen.pas' {fScreen},
  frmCropMark in 'frmCropMark.pas' {fCropMark},
  Generics.Collections,
  frmOnekeyPS in 'frmOnekeyPS.pas' {fOnekeyPS},
  frmQrcode in 'frmQrcode.pas' {fQrcode},
  ArrayEx in 'ArrayEx.pas',
  System.IOUtils,
  frmSelect in 'frmSelect.pas' {fSelect},
  System.IniFiles,
  frmGroupSelection in 'frmGroupSelection.pas' {fGroupSelection},
  DelphiZXIngQRCode in 'QRCode\Encode\DelphiZXIngQRCode.pas',
  QR_URL in 'QRCode\Encode\QR_URL.pas',
  QR_Win1251 in 'QRCode\Encode\QR_Win1251.pas',
  QRGraphics in 'QRCode\Encode\QRGraphics.pas',
  ScanManager in 'QRCode\Decode\ScanManager.pas',
  Code93Reader in 'QRCode\Decode\1D Barcodes\Code93Reader.pas',
  Code128Reader in 'QRCode\Decode\1D Barcodes\Code128Reader.pas',
  ITFReader in 'QRCode\Decode\1D Barcodes\ITFReader.pas',
  MultiFormatOneDReader in 'QRCode\Decode\1D Barcodes\MultiFormatOneDReader.pas',
  OneDReader in 'QRCode\Decode\1D Barcodes\OneDReader.pas',
  Reader in 'QRCode\Decode\1D Barcodes\Reader.pas',
  QRCodeReader in 'QRCode\Decode\2D Barcodes\QRCodeReader.pas',
  BitMatrixParser in 'QRCode\Decode\2D Barcodes\Decoder\BitMatrixParser.pas',
  Datablock in 'QRCode\Decode\2D Barcodes\Decoder\Datablock.pas',
  Datamask in 'QRCode\Decode\2D Barcodes\Decoder\Datamask.pas',
  DecodedBitStreamParser in 'QRCode\Decode\2D Barcodes\Decoder\DecodedBitStreamParser.pas',
  ErrorCorrectionLevel in 'QRCode\Decode\2D Barcodes\Decoder\ErrorCorrectionLevel.pas',
  FormatInformation in 'QRCode\Decode\2D Barcodes\Decoder\FormatInformation.pas',
  GenericGF in 'QRCode\Decode\2D Barcodes\Decoder\GenericGF.pas',
  Mode in 'QRCode\Decode\2D Barcodes\Decoder\Mode.pas',
  QRCodeDecoderMetadata in 'QRCode\Decode\2D Barcodes\Decoder\QRCodeDecoderMetadata.pas',
  QRDecoder in 'QRCode\Decode\2D Barcodes\Decoder\QRDecoder.pas',
  ReedSolomonDecoder in 'QRCode\Decode\2D Barcodes\Decoder\ReedSolomonDecoder.pas',
  Version in 'QRCode\Decode\2D Barcodes\Decoder\Version.pas',
  AlignmentPattern in 'QRCode\Decode\2D Barcodes\Detector\AlignmentPattern.pas',
  AlignmentPatternFinder in 'QRCode\Decode\2D Barcodes\Detector\AlignmentPatternFinder.pas',
  Detector in 'QRCode\Decode\2D Barcodes\Detector\Detector.pas',
  FinderPattern in 'QRCode\Decode\2D Barcodes\Detector\FinderPattern.pas',
  FinderPatternFinder in 'QRCode\Decode\2D Barcodes\Detector\FinderPatternFinder.pas',
  FinderPatternInfo in 'QRCode\Decode\2D Barcodes\Detector\FinderPatternInfo.pas',
  BarcodeFormat in 'QRCode\Decode\Common\BarcodeFormat.pas',
  BitArray in 'QRCode\Decode\Common\BitArray.pas',
  Bitmatrix in 'QRCode\Decode\Common\Bitmatrix.pas',
  BitSource in 'QRCode\Decode\Common\BitSource.pas',
  CharacterSetECI in 'QRCode\Decode\Common\CharacterSetECI.pas',
  DecodeHintType in 'QRCode\Decode\Common\DecodeHintType.pas',
  DecoderResult in 'QRCode\Decode\Common\DecoderResult.pas',
  DefaultGridSampler in 'QRCode\Decode\Common\DefaultGridSampler.pas',
  DetectorResult in 'QRCode\Decode\Common\DetectorResult.pas',
  Helpers in 'QRCode\Decode\Common\Helpers.pas',
  MathUtils in 'QRCode\Decode\Common\MathUtils.pas',
  MultiFormatReader in 'QRCode\Decode\Common\MultiFormatReader.pas',
  PerspectiveTransform in 'QRCode\Decode\Common\PerspectiveTransform.pas',
  ReadResult in 'QRCode\Decode\Common\ReadResult.pas',
  ResultMetadataType in 'QRCode\Decode\Common\ResultMetadataType.pas',
  ResultPoint in 'QRCode\Decode\Common\ResultPoint.pas',
  StringUtils in 'QRCode\Decode\Common\StringUtils.pas',
  Binarizer in 'QRCode\Decode\Filtering\Binarizer.pas',
  BinaryBitmap in 'QRCode\Decode\Filtering\BinaryBitmap.pas',
  GlobalHistogramBinarizer in 'QRCode\Decode\Filtering\GlobalHistogramBinarizer.pas',
  HybridBinarizer in 'QRCode\Decode\Filtering\HybridBinarizer.pas',
  LuminanceSource in 'QRCode\Decode\Filtering\LuminanceSource.pas',
  RGBLuminanceSource in 'QRCode\Decode\Filtering\RGBLuminanceSource.Pas',
  SVGImage in 'QRCode\Encode\SVGImage.pas',
  frmFontRecognition in 'frmFontRecognition.pas' {fFontRecognition},
  CaptureImageTool in '..\��ͼ\CaptureImageTool.pas' {TCaptureImageTool},
  Operate in '..\��ͼ\Operate.pas',
  GdiPlus in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlus.pas',
  GdiPlusHelpers in '..\ͼ��Base64����\GdiPlus\Lib\GdiPlusHelpers.pas';

{$R *.res}

type
  TisnPlugin = class(TObject, IVGAppPlugin, IDispatch, IUnknown)
    const
      CVersion: Integer = 2016052302;
      CommandBarName: WideString = 'tisn201600401';
      CommandID_All: WideString = 'cdrplugin1_ȫ��';
      CommandID_ConvertTo: WideString = 'cdrplugin1_ת��';
      CommandID_ToJPG: WideString = 'cdrplugin1_����ͼƬ';
      CommandID_CropMark: WideString = 'cdrplugin1_���б��';
      CommandID_OnkeyPS: WideString = 'cdrplugin1_һ��PS';
      CommandID_QRCode: WideString = 'cdrplugin1_��ά��';
      CommandID_Select: WideString = 'cdrplugin1_ͬ��ѡ��';
      CommandID_FontRecognition: WideString = 'cdrplugin1_����ʶ��';
      CommandID_SuperUndo: WideString = 'cdrplugin1_��������';
      CommandID_SuperRedo: WideString = 'cdrplugin1_��������';
  private
    mApp: IVGApplication;
    m_lCookie: longint;
    m_ulRefCount: ULONG;
    myCommandBar: ICUICommandBar;
    cmdList: TDictionary<WideString, WideString>;
    procedure OnAppStart; safecall;
    procedure AddPluginCommands;
    procedure RemovePluginCommands;
  public
    constructor Create;
  public
    //IVGAppPlugin
    procedure OnLoad(const Application: IVGApplication); safecall;
    procedure StartSession; safecall;
    procedure StopSession; safecall;
    procedure OnUnload; safecall;
  public
    //IDispatch
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(dispid: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
  public
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  end;

constructor TisnPlugin.Create;
begin
  m_ulRefCount := 0;
  cmdList := TDictionary<WideString, WideString>.Create;
  cmdList.Add(CommandID_All, '����');
  cmdList.Add(CommandID_ToJPG, '����ͼƬ|ǿ��ĵ���ͼƬ����');
  cmdList.Add(CommandID_ConvertTo, 'ת��');
  cmdList.Add(CommandID_CropMark, '���б��');
  cmdList.Add(CommandID_OnkeyPS, 'һ��PS|һ������PS��ͼ');
  cmdList.Add(CommandID_QRCode, '��ά��');
  cmdList.Add(CommandID_Select, 'ͬ��ѡ��');
  cmdList.Add(CommandID_FontRecognition, '����ʶ��');

  cmdList.Add(CommandID_SuperUndo, '��������|�������������ִ���˴�������������ʹ�����');
  cmdList.Add(CommandID_SuperRedo, '��������|�������������ִ���˴�������������ʹ�����');
end;

procedure TisnPlugin.OnAppStart;
var
  st: TResourceStream;
  tmpPath: string;
  inifile: TIniFile;
  rVersion: Integer;
begin
  AddPluginCommands;
  inifile := GetSettingsInifile;
  rVersion := inifile.ReadInteger('�������', '�汾��', 0);
  //����汾�Ų��ԣ�ǿ��ɾ����ǰ������
  if rVersion <> CVersion then
  begin
    try
      mApp.CommandBars.Item[CommandBarName].Delete;
    finally
      inifile.WriteInteger('�������', '�汾��', CVersion);
    end;
  end;
  inifile.Destroy;
  try
    myCommandBar := mApp.CommandBars.Item[CommandBarName];
  except

    tmpPath := TPath.GetTempPath + '\';
    if mApp.VersionMajor < 17 then
    begin
      st := TResourceStream.Create(HInstance, 'toolbar_X4', RT_RCDATA);
      st.SaveToFile(tmpPath + 'TTx4.xslt');
      st.Free;
      mApp.ImportWorkspace(tmpPath + 'TTx4.xslt');
      DeleteFile(tmpPath + 'TTx4.xslt')
    end
    else if mApp.VersionMajor = 17 then
    begin
      st := TResourceStream.Create(HInstance, 'toolbar_X7', RT_RCDATA);
      st.SaveToFile(tmpPath + 'TTx7.cdws');
      st.Free;
      mApp.ImportWorkspace(tmpPath + 'TTx7.cdws');
      DeleteFile(tmpPath + 'TTx7.cdws')
    end
    else if mApp.VersionMajor >= 18 then
    begin
      st := TResourceStream.Create(HInstance, 'toolbar_X8', RT_RCDATA);
      st.SaveToFile(tmpPath + 'TTx8.cdws');
      st.Free;
      mApp.ImportWorkspace(tmpPath + 'TTx8.cdws');
      DeleteFile(tmpPath + 'TTx8.cdws')
    end;
    mApp.CommandBars.Item[CommandBarName].Visible := True;
  end;

  Exit;
end;

procedure TisnPlugin.AddPluginCommands;
var
  pair: TPair<WideString, WideString>;
  ts: string;
  tss: TArray<string>;
begin
  for pair in cmdList do
  begin
    ts := pair.Value;
    tss := ts.Split(['|']);
    if Length(tss) = 2 then
    begin
      mApp.AddPluginCommand(pair.Key, tss[0], tss[1]);
    end
    else
    begin
      mApp.AddPluginCommand(pair.Key, pair.Value, pair.Value);
    end;
  end;
end;

procedure TisnPlugin.RemovePluginCommands;
var
  pair: TPair<WideString, WideString>;
begin
  for pair in cmdList do
  begin
    mApp.RemovePluginCommand(pair.Key);
  end;
end;

procedure TisnPlugin.OnLoad(const Application: IVGApplication);
begin
  self.mApp := Application;
  if self.mApp <> nil then
  begin
    self.mApp._AddRef;
  end;
end;

procedure TisnPlugin.StartSession;
begin
  try
    self.m_lCookie := self.mApp.AdviseEvents(self);
  except
    on E: Exception do
      MessageBox(0, PWideChar(E.Message + e.StackTrace), 'StartSession', 0);
  end;
end;

procedure TisnPlugin.StopSession;
begin
  try
    self.mApp.UnadviseEvents(self.m_lCookie);
    RemovePluginCommands;

    //X4�в����Զ��ͷţ����¹ر�CorelDraw�������̲����˳������������ֶ��ͷ�һ��
    self.mApp._Release;
    self.Destroy;
  except
    on E: Exception do
      MessageBox(0, PWideChar(E.Message + e.StackTrace), 'StopSession', 0);
  end;
end;

procedure TisnPlugin.OnUnload;
begin

  if self.mApp <> nil then
  begin
    self.mApp._Release;
    self.Destroy;
  end;
end;

function TisnPlugin.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TisnPlugin.GetTypeInfo(Index: Integer; LocaleID: Integer; out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
end;

function TisnPlugin.GetIDsOfNames(const IID: TGUID; Names: Pointer; NameCount: Integer; LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TisnPlugin.Invoke(dispid: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
var
  strCMD: WideString;
  f: TTBaseForm;
  DispParams: TDispParams;
begin
  f := nil;
  DispParams := TDispParams(Params);
  case dispid of
    $0011:
      begin // DISPID_APP_SELCHANGE

      end;
    $0012:
      begin // DISPID_APP_START
        self.OnAppStart;
      end;
    $0014:
      begin // DISPID_APP_ONPLUGINCMD
      {������ť�¼�}
        if Variant(DispParams.cArgs = 1) then
        begin
          strCMD := DispParams.rgvarg^[0].bstrVal;
          if strCMD = CommandID_All then
          begin
            f := TfMain.Create(nil, mApp);
          end
          else if strCMD = CommandID_ToJPG then
          begin
            f := TfToJPG.Create(nil, mApp);
          end
          else if strCMD = CommandID_ConvertTo then
          begin
            f := TfConvertTo.Create(nil, mApp);
          end
          else if strCMD = CommandID_CropMark then
          begin
            f := TfCropMark.Create(nil, mApp);
          end
          else if strCMD = CommandID_OnkeyPS then
          begin
            f := TfOnekeyPS.Create(nil, mApp);
          end
          else if strCMD = CommandID_QRCode then
          begin
            f := TfQrcode.Create(nil, mApp);
          end
          else if strCMD = CommandID_Select then
          begin
            f := TfSelect.Create(nil, mApp);
          end
          else if strCMD = CommandID_FontRecognition then
          begin
            f := TfFontRecognition.Create(nil, mApp);
          end;
          if f <> nil then
          begin
            f.ShowModal;
          end;
        end;
      end;
    $0015:
      begin // DISPID_APP_ONPLUGINCMDSTATE
        if DispParams.cArgs = 3 then
        begin
          strCMD := DispParams.rgvarg^[2].bstrVal;
          if cmdList.ContainsKey(strCMD) then
          begin
            DispParams.rgvarg^[1].pbool^ := mApp.Documents.Count > 0;
          end;
        end;
      end;
  end;
  Result := S_OK;
end;

function TisnPlugin.QueryInterface(const IID: TGUID; out Obj): Hresult;
var
  hr: HResult;
begin
  hr := S_OK;
  //Inc(m_ulRefCount);
  if (IID = IID_IUnknown) then
  begin
    IUnknown(Obj) := self;
  end
  else if (IID = IID_IDispatch) then
  begin
    IDispatch(Obj) := self;
  end
  else if (IID = IID_IVGAppPlugin) then
  begin
    IVGAppPlugin(Obj) := Self;
  end
  else
  begin
    //Dec(m_ulRefCount);
    hr := E_NOINTERFACE;
  end;
  Result := hr;
end;

//�˴�����Ҫ
function TisnPlugin._AddRef;
begin
  inc(self.m_ulRefCount);
  Result := self.m_ulRefCount;
end;

//�˴�����Ҫ
function TisnPlugin._Release;
begin
  dec(self.m_ulRefCount);
  if (self.m_ulRefCount = 0) then
  begin
    Destroy;
  end;
  Result := self.m_ulRefCount;
end;

function AttachPlugin(var ppIPlugin): ULONG; stdcall;
begin
  IVGAppPlugin(ppIPlugin) := TisnPlugin.Create;
  Result := $100;
end;

function DllEnterPoint(Reason: Integer): Boolean;
begin
  case Reason of
    DLL_PROCESS_ATTACH:
      begin
      end;
  end;
  Result := True;
end;

exports
  AttachPlugin;

begin
  DllProc := @DllEnterPoint;
  DllEnterPoint(DLL_PROCESS_ATTACH);
end.

