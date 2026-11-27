unit UList_Recip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, AdvEdit, advlued,
  AdvGlowButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, GradientLabel;

type
  TFList_Recip = class(TForm)
    GradientLabel15: TGradientLabel;
    GradientLabel14: TGradientLabel;
    DBAdvGrid3: TDBAdvGrid;
    BTN_Apply: TAdvGlowButton;
    AdvLUEdit4: TAdvLUEdit;
    procedure DBAdvGrid3GetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure DBAdvGrid3DblClickCell(Sender: TObject; ARow, ACol: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FList_Recip: TFList_Recip;

implementation

uses UData,UMain,UBLK,UAdd_Consu;

{$R *.dfm}

procedure TFList_Recip.DBAdvGrid3DblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
FAdd_Consu.EDT_RECIP.Text := FData.TRecipient.FieldByName('RECIP_NAME').AsString;
FAdd_Consu.Show;
Close;
end;

procedure TFList_Recip.DBAdvGrid3GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  with DBAdvGrid3 do
    with FData.TRecipient do
      begin
        if ARow = GetRealRow then // To affect changes to the selected Row only
          begin
            SelectionColor := $009DD8F9;
            SelectionColorTo := $005EC1F1;
            AFont.Size := 12;
            AFont.Style := [fsBold];
          end;
      end;
end;

end.
