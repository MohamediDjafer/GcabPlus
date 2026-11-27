unit UEditArtc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls,
  Vcl.StdCtrls, AdvCombo, Lucombo, AdvEdit, advlued, AdvGlowButton,
  GradientLabel;

type
  TFEditArtc = class(TForm)
    GradientLabel15: TGradientLabel;
    GradientLabel14: TGradientLabel;
    BTN_Cancel: TAdvGlowButton;
    BTN_Apply: TAdvGlowButton;
    GradientLabel1: TGradientLabel;
    EDIT_DESI: TAdvLUEdit;
    GradientLabel2: TGradientLabel;
    EDIT_CAT: TLUCombo;
    GradientLabel3: TGradientLabel;
    EDIT_FAM: TLUCombo;
    GradientLabel4: TGradientLabel;
    AdvLUEdit2: TAdvLUEdit;
    GradientLabel5: TGradientLabel;
    AdvLUEdit3: TAdvLUEdit;
    AdvGlowButton1: TAdvGlowButton;
    Image10: TImage;
    procedure BTN_ApplyClick(Sender: TObject);
    procedure BTN_CancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditArtc: TFEditArtc;

implementation
USES UData,UMain,UBLK;

{$R *.dfm}

procedure TFEditArtc.BTN_ApplyClick(Sender: TObject);
begin
  with FData.TArticle do
    begin
      Edit;
      FieldByName('DESI_ART').AsString := EDIT_DESI.Text;
      FieldByName('CAT_ART').AsString := EDIT_CAT.Text;
      FieldByName('FAM_ART').AsString := EDIT_FAM.Text;
      Post;
    end;

  FData.TArticle.Refresh;
  BLK.Show;
  MessageDlg('L''opération a été effectuée avec succès...', mtInformation, [mbOK], 0);
  FEditArtc.Show;
end;

procedure TFEditArtc.BTN_CancelClick(Sender: TObject);
begin
Close;
end;

procedure TFEditArtc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BLK.Close;
FData.TArticle.Refresh;
end;

end.
