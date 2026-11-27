unit UAdd_Pat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  AdvGlowButton, Vcl.StdCtrls, AdvCombo, Lucombo, AdvEdit, advlued,
  GradientLabel, CurvyControls, AdvMetroButton, AdvShapeButton, acFloatCtrls,
  AdvSmoothButton, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit,
  Vcl.WinXCtrls, AdvSmoothEdit, AdvSmoothEditButton, AdvSmoothDatePicker;

type
  TFAdd_Pat = class(TForm)
    Panel1: TPanel;
    GradientLabel73: TGradientLabel;
    GradientLabel456: TGradientLabel;
    GradientLabel1: TGradientLabel;
    INSERT_LNAME: TAdvLUEdit;
    GradientLabel8: TGradientLabel;
    INSERT_AGE: TAdvLUEdit;
    GradientLabel7: TGradientLabel;
    GradientLabel10: TGradientLabel;
    INSERT_FS: TLUCombo;
    INSERT_SEX: TLUCombo;
    GradientLabel3: TGradientLabel;
    GradientLabel2: TGradientLabel;
    INSERT_FNAME: TAdvLUEdit;
    GradientLabel6: TGradientLabel;
    INSERT_ADR: TAdvLUEdit;
    GradientLabel5: TGradientLabel;
    INSERT_PROFF: TAdvLUEdit;
    GradientLabel4: TGradientLabel;
    INSERT_INSUR: TLUCombo;
    GradientLabel11: TGradientLabel;
    INSERT_INSUR_N: TAdvLUEdit;
    GradientLabel9: TGradientLabel;
    AdvGlowButton1: TAdvGlowButton;
    Image10: TImage;
    BTN_Apply: TAdvGlowButton;
    BTN_Cancel: TAdvGlowButton;
    CurvyMemo1: TCurvyMemo;
    CurvyMemo2: TCurvyMemo;
    CurvyMemo3: TCurvyMemo;
    CurvyMemo4: TCurvyMemo;
    GradientLabel12: TGradientLabel;
    GradientLabel13: TGradientLabel;
    GradientLabel14: TGradientLabel;
    GradientLabel15: TGradientLabel;
    Image1: TImage;
    AdvShapeButton1: TAdvShapeButton;
    AdvShapeButton2: TAdvShapeButton;
    AdvShapeButton3: TAdvShapeButton;
    AdvShapeButton4: TAdvShapeButton;
    INSERT_BLD: TLUCombo;
    ToggleSwitch1: TToggleSwitch;
    INSERT_DP: TAdvSmoothDatePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AdvShapeButton1Click(Sender: TObject);
    procedure AdvShapeButton4Click(Sender: TObject);
    procedure AdvShapeButton3Click(Sender: TObject);
    procedure AdvShapeButton2Click(Sender: TObject);
    procedure BTN_ApplyClick(Sender: TObject);
    procedure BTN_CancelClick(Sender: TObject);
    procedure INSERT_LNAMEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  procedure insertp();
  procedure cancelp();
  procedure editp();
    { Public declarations }
  end;

var
  FAdd_Pat: TFAdd_Pat;

implementation

uses UMain,UBLK,UData,UAntece;
{$R *.dfm}

procedure TFAdd_Pat.cancelp();
begin
 INSERT_LNAME.Text      := '' ;
 INSERT_FNAME.Text      := '' ;
 INSERT_AGE.Text        := '' ;
 INSERT_FS.ItemIndex    := -1 ;
 INSERT_ADR.Text        := '' ;
 INSERT_PROFF.Text      := '' ;
 INSERT_BLD.ItemIndex   := -1 ;
 INSERT_SEX.ItemIndex   := -1 ;
 INSERT_INSUR.ItemIndex := -1 ;
 INSERT_INSUR_N.Text    := '';
end;

procedure TFAdd_Pat.editp();
begin
  with FData do
    begin
      UPD.SQL.Clear;
      UPD.SQL.Add('UPDATE TPATIENTS SET ');
      UPD.SQL.Add('LNAME_PAT = '+QuotedStr(INSERT_LNAME.Text)+', ');
      UPD.SQL.Add('FNAME_PAT = '+QuotedStr(INSERT_FNAME.Text)+', ');
      UPD.SQL.Add('DATEN_PAT = '+QuotedStr(INSERT_DP.Text)+', ');
      UPD.SQL.Add('SEX_PAT = '+QuotedStr(INSERT_SEX.Text)+', ');
      UPD.SQL.Add('ADR_PAT = '+QuotedStr(INSERT_ADR.Text)+', ');
      UPD.SQL.Add('FAM_SITU_PAT = '+QuotedStr(INSERT_FS.Text)+', ');
      UPD.SQL.Add('PROFF_PAT = '+QuotedStr(INSERT_PROFF.Text)+', ');
      UPD.SQL.Add('INSUR_PAT = '+QuotedStr(INSERT_INSUR.Text)+', ');
      UPD.SQL.Add('INSUR_NBR_PAT = '+QuotedStr(INSERT_INSUR_N.Text)+', ');
      UPD.SQL.Add('BLOOD_TYPE_PAT = '+QuotedStr(INSERT_BLD.Text)+'');
      UPD.SQL.Add('WHERE ID_PAT = '+QuotedStr(TPATIENTS.FieldByName('ID_PAT').AsString)+'');
      UPD.ExecSQL;
    end;
end;

procedure TFAdd_Pat.insertp()  ;
begin
   with FData.ADDQ do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO TPATIENTS(LNAME_PAT,FNAME_PAT,DATEN_PAT,SEX_PAT,ADR_PAT,FAM_SITU_PAT,PROFF_PAT,INSUR_PAT,INSUR_NBR_PAT,BLOOD_TYPE_PAT)');
      SQL.Add('VALUES ('+QuotedStr(INSERT_LNAME.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_FNAME.Text)+',');
      SQL.Add(' :dat ,');
      Params.ParamByName('dat').Value := INSERT_DP.Date;
      SQL.Add(''+QuotedStr(INSERT_SEX.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_ADR.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_FS.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_PROFF.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_INSUR.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_INSUR_N.Text)+',');
      SQL.Add(''+QuotedStr(INSERT_BLD.Text)+')');
      ExecSQL;
    end;
end;

procedure TFAdd_Pat.INSERT_LNAMEKeyPress(Sender: TObject; var Key: Char);
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

procedure TFAdd_Pat.AdvShapeButton1Click(Sender: TObject);
begin
BLK.Show;
FData.VAnte_M.Refresh;
FAntece.DBAdvGrid3.DataSource := FData.DAnte_M;
FAntece.GradientLabel73.Caption := '    Antécédents Médicaux    ';
FAntece.GradientLabel73.Hint := 'Antécédents Médicaux';
FAntece.Show;
end;

procedure TFAdd_Pat.AdvShapeButton2Click(Sender: TObject);
begin
BLK.Show;
FData.VAnte_A.Refresh;
FAntece.DBAdvGrid3.DataSource := FData.DAnte_A;
FAntece.GradientLabel73.Caption := '    Autres Antécédents    ';
FAntece.GradientLabel73.Hint := 'Autres Antécédents';
FAntece.Show;
end;

procedure TFAdd_Pat.AdvShapeButton3Click(Sender: TObject);
begin
BLK.Show;
FData.VAnte_F.Refresh;
FAntece.DBAdvGrid3.DataSource := FData.DAnte_F;
FAntece.GradientLabel73.Caption := '    Antécédents Familliaux    ';
FAntece.GradientLabel73.Hint := 'Antécédents Familliaux';
FAntece.Show;
end;

procedure TFAdd_Pat.AdvShapeButton4Click(Sender: TObject);
begin
BLK.Show;
FData.VAnte_CH.Refresh;
FAntece.DBAdvGrid3.DataSource := FData.DAnte_CH;
FAntece.GradientLabel73.Caption := '    Antécédents Chirurgicaux    ';
FAntece.GradientLabel73.Hint := 'Antécédents Chirurgicaux';
FAntece.Show;
end;

procedure TFAdd_Pat.BTN_ApplyClick(Sender: TObject);
begin

  if ToggleSwitch1.State = tssOff then
    insertp
  else
    editp;

  BLK.Show;
  MessageDlg('L''opération a été effectuée avec succès...', mtInformation, [mbOK], 0);
  cancelp();
  FAdd_Pat.Show;
end;

procedure TFAdd_Pat.BTN_CancelClick(Sender: TObject);
begin
cancelp();
Close;
end;

procedure TFAdd_Pat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BLK.Close;
FData.TPATIENTS.Refresh;
end;

end.
