unit UAddArtc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvGlowButton, dxGDIPlusClasses,
  Vcl.ExtCtrls, Vcl.StdCtrls, AdvCombo, Lucombo, AdvEdit, advlued, GradientLabel;

type
  TFAddArtc = class(TForm)
    GradientLabel15: TGradientLabel;
    GradientLabel14: TGradientLabel;
    GradientLabel1: TGradientLabel;
    INSERT_DESI: TAdvLUEdit;
    GradientLabel2: TGradientLabel;
    GradientLabel3: TGradientLabel;
    INSERT_CAT: TLUCombo;
    INSERT_FAM: TLUCombo;
    GradientLabel4: TGradientLabel;
    AdvLUEdit2: TAdvLUEdit;
    GradientLabel5: TGradientLabel;
    AdvLUEdit3: TAdvLUEdit;
    Image10: TImage;
    AdvGlowButton1: TAdvGlowButton;
    BTN_Apply: TAdvGlowButton;
    BTN_Cancel: TAdvGlowButton;
    BTN_Close: TAdvGlowButton;
    procedure BTN_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BTN_ApplyClick(Sender: TObject);
    procedure BTN_CancelClick(Sender: TObject);
    procedure INSERT_DESIKeyPress(Sender: TObject; var Key: Char);
    procedure INSERT_CATKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAddArtc: TFAddArtc;

implementation

uses UBLK,UMain,UData;
{$R *.dfm}

procedure TFAddArtc.BTN_ApplyClick(Sender: TObject);
begin
  with FData.ADDQ do
    begin
      SQL.Clear;
      SQL.Add('insert into TArticle (DESI_ART,CAT_ART,FAM_ART)');
      SQL.Add('VALUES ('+QuotedStr(INSERT_DESI.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_CAT.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_FAM.Text)+')');
      ExecSQL;
    end;
  BTN_Cancel.Click;
  BLK.Show;
  MessageDlg('L''opération a été effectuée avec succès...', mtInformation, [mbOK], 0);
  FAddArtc.Show;
end;

procedure TFAddArtc.BTN_CancelClick(Sender: TObject);
begin
INSERT_DESI.Text := '';
INSERT_CAT.Text := '';
INSERT_FAM.Text := '';
end;

procedure TFAddArtc.BTN_CloseClick(Sender: TObject);
begin
BTN_Cancel.Click;
Close;
end;

procedure TFAddArtc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BLK.Close;
FData.TArticle.Refresh;
end;

procedure TFAddArtc.INSERT_CATKeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TLUCombo do
    if ((SelStart = 0) or (Text[SelStart] = '')) then
      if Key in ['a'..'z'] then
        Key:=UpCase(Key);

  if key=#13 then
    begin
      Perform(WM_NEXTDLGCTL,0,0);
      key:=#0;
    end;
end;

procedure TFAddArtc.INSERT_DESIKeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TAdvLUEdit do
    if ((SelStart = 0) or (Text[SelStart] = '')) then
      if Key in ['a'..'z'] then
        Key:=UpCase(Key);

  if key=#13 then
    begin
      Perform(WM_NEXTDLGCTL,0,0);
      key:=#0;
    end;
end;

end.
