unit UAdd_Consu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvUtil, Vcl.StdCtrls, AdvEdit, advlued,
  AdvGlowButton, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, GradientLabel,
  AdvMetroButton, Vcl.Mask, AdvSmoothEdit, AdvSmoothEditButton,
  AdvSmoothDatePicker, Vcl.ComCtrls, sMaskEdit, sCustomComboEdit, sToolEdit,
  AdvDateTimePicker, Vcl.WinXCtrls, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TFAdd_Consu = class(TForm)
    GradientLabel14: TGradientLabel;
    GradientLabel15: TGradientLabel;
    DBAdvGrid3: TDBAdvGrid;
    DBAdvGrid1: TDBAdvGrid;
    GradientLabel2: TGradientLabel;
    EDT_RECIP: TAdvLUEdit;
    GradientLabel3: TGradientLabel;
    LBL_MONTANT: TGradientLabel;
    AdvLUEdit4: TAdvLUEdit;
    BTN_Cancel: TAdvGlowButton;
    BTN_Apply: TAdvGlowButton;
    AdvMetroButton14: TAdvMetroButton;
    DP1: TDateTimePicker;
    ToggleSwitch1: TToggleSwitch;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBAdvGrid3DblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure DBAdvGrid1GetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure DBAdvGrid3GetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure BTN_ApplyClick(Sender: TObject);
    procedure BTN_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdvMetroButton14Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CancelAdd();
  end;

var
  FAdd_Consu: TFAdd_Consu;

implementation
uses UData,UMain,UBLK,UList_Users,UList_Recip;

{$R *.dfm}

procedure TFAdd_Consu.CancelAdd();
begin
  DBAdvGrid3.DataSource := FData.vide;
  DBAdvGrid1.DataSource := FData.vide;

  if ToggleSwitch1.State = tssOff then
    begin
      with FData do
        begin
          if TOUT_Test.FieldByName('OUT_MONTANT').AsFloat <= 0 then
            begin
              TArticle.Refresh;
              TArticle.First;
              OCS.First;
              while not OCS.Eof do
                begin
                  TArticle.Filter := 'ID_ARTICLE = '+QuotedStr(OCS.FieldByName('ID_ARTICLE').AsString);
                //  TArticle.Params.ParamByName('ID').AsInteger := OCS.FieldByName('ID_ARTICLE').AsInteger;
                  TArticle.Filtered := True;

                  if TArticle.FieldByName('ID_ARTICLE').AsString = OCS.FieldByName('ID_ARTICLE').AsString  then
                    begin
                      TArticle.Edit;
                      TArticle.FieldByName('QTE_ART').AsFloat := TArticle.FieldByName('QTE_ART').AsFloat + OCS.FieldByName('CS_QTE').AsFloat;
                      TArticle.Post;
                    end;

                  TArticle.Filtered := False;
                  OCS.Next;
                end;

              DEL.SQL.Clear;
              DEL.SQL.Text := 'DELETE FROM TConsum WHERE ID_OUT = '+QuotedStr(TOUT_Test.FieldByName('ID_OUT').AsString);
              DEL.ExecSQL;

             // DEL.SQL.Clear;
             // DEL.SQL.Text := 'DELETE FROM TOUT WHERE ID_OUT = '+QuotedStr(TOUT_Test.FieldByName('ID_OUT').AsString);
             // DEL.ExecSQL;
            end;

          end;
    end;

  DBAdvGrid1.DataSource := FData.DOCS;
  DBAdvGrid3.DataSource := FData.DArticle;
end;

procedure TFAdd_Consu.AdvMetroButton14Click(Sender: TObject);
begin
BLK.Show;
FList_Recip.Show;
end;

procedure TFAdd_Consu.BTN_ApplyClick(Sender: TObject);
begin
  if LBL_MONTANT.Caption <> '0.00 DA' then
    begin
      if ToggleSwitch1.State = tssOff then
        begin
          with FData do
            begin
              with SUMM do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'SELECT SUM(CS_QTE * CS_PRICE) FROM TConsum WHERE ID_OUT = '+QuotedStr(TOUT_Test.FieldByName('ID_OUT').AsString);
                  Open();
                end;

              TOUT_Test.Edit;
              TOUT_Test.FieldByName('OUT_MONTANT').AsFloat  := SUMM.Fields[0].AsInteger;
              TOUT_Test.FieldByName('OUT_VERSE').AsFloat    := 0;
              TOUT_Test.FieldByName('OUT_RESTE').AsFloat    := SUMM.Fields[0].AsInteger;
              TOUT_Test.FieldByName('OUT_RECIP').AsString   := EDT_RECIP.Text;
              TOUT_Test.FieldByName('OUT_DATE').Value       := DP1.Date;
              TOUT_Test.Post;
            end;

          BLK.Show;
          MessageDlg('L''opération a été effectuée avec succès...', mtInformation, [mbOK], 0);
          LBL_MONTANT.Caption := '0.00 DA';
          EDT_RECIP.Text := '';
          FMain.AdvGlowButton14.Click;
        end
      else
        begin
        with FData do
            begin
              with SUMM do
                begin
                  Close;
                  SQL.Clear;
                  SQL.Text := 'SELECT SUM(CS_QTE * CS_PRICE) FROM TConsum WHERE ID_OUT = '+QuotedStr(TOUT.FieldByName('ID_OUT').AsString);
                  Open();
                end;

              TOUT.Edit;
              TOUT.FieldByName('OUT_MONTANT').AsFloat := SUMM.Fields[0].AsInteger;
             // TOUT.FieldByName('OUT_RECIP').AsString := AdvLUEdit2.Text;
              TOUT.Post;
            end;

          BLK.Show;
          MessageDlg('L''opération a été effectuée avec succès...', mtInformation, [mbOK], 0);
          FAdd_Consu.Show;
          FMain.AdvGlowButton14.Click;

        end;
    end
  else
    begin
      BLK.Show;
      MessageDlg('Erreur: vous devez ajouter au moin un article', mterror, [mbOK], 0);
      Show;
    end;
end;

procedure TFAdd_Consu.BTN_CancelClick(Sender: TObject);
begin
CancelAdd;
Close;
end;

procedure TFAdd_Consu.DBAdvGrid1GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  with DBAdvGrid1 do
    with FData.OCS do
      begin
        if ARow = GetRealRow then // To affect changes to the selected Row only
          begin
            SelectionColor := $00ECEC81;
            SelectionColorTo := $00C9CE00;
            AFont.Size := 12;
            AFont.Style := [fsBold];
          end;
      end;
end;

procedure TFAdd_Consu.DBAdvGrid3DblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
 with FData do
    begin
      OCS.Filter := 'ARTICLE_NAME = '+QuotedStr(TArticle.FieldByName('DESI_ART').AsString);
      OCS.Filtered := True;
      if OCS.FieldByName('ARTICLE_NAME').AsString <> TArticle.FieldByName('DESI_ART').AsString  then
        begin
          if (TArticle.FieldByName('QTE_ART').AsFloat > 0) then
            begin
              if ToggleSwitch1.State = tssOff then
                begin
                  with ADDQ do
                    begin
                      SQL.Clear;
                      SQL.Add('insert into TConsum (ARTICLE_NAME,CS_QTE,CS_PRICE,ARTICLE_REF,ID_OUT,ID_ARTICLE)');
                      SQL.Add('VALUES ('+QuotedStr(TArticle.FieldByName('DESI_ART').AsString)+',');
                      SQL.Add(''+QuotedStr('1')+',');
                      SQL.Add(':PRICE,');
                      Params.ParamByName('PRICE').AsFloat := TArticle.FieldByName('PRICE_ART').AsFloat;
                      SQL.Add(''+QuotedStr(TArticle.FieldByName('DESI_ART').AsString)+',');
                      SQL.Add(':ID,');
                      Params.ParamByName('ID').AsInteger := TOUT_Test.FieldByName('ID_OUT').AsInteger;
                      SQL.Add(':ID1)');
                      Params.ParamByName('ID1').AsInteger := TArticle.FieldByName('ID_ARTICLE').AsInteger;
                      ExecSQL;
                    end;

                  with SUMM do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Text := 'SELECT SUM(CS_QTE * CS_PRICE) FROM TConsum WHERE ID_OUT = '+QuotedStr(TOUT_Test.FieldByName('ID_OUT').AsString);
                      Open();
                    end;

                    LBL_MONTANT.Caption := Format('%.2m', [SUMM.Fields[0].AsFloat]);

                    TArticle.Edit;
                    TArticle.FieldByName('QTE_ART').AsFloat := TArticle.FieldByName('QTE_ART').AsFloat - 1;
                    TArticle.Post;

                    TArticle.Refresh;
                    DBAdvGrid3.Refresh;

                    OCS.Refresh;
                    DBAdvGrid1.Refresh;
                end
              else
                begin
                  with ADDQ do
                    begin
                      SQL.Clear;
                      SQL.Add('insert into TConsum (ARTICLE_NAME,CS_QTE,CS_PRICE,ARTICLE_REF,ID_OUT,ID_ARTICLE)');
                      SQL.Add('VALUES ('+QuotedStr(TArticle.FieldByName('DESI_ART').AsString)+',');
                      SQL.Add(''+QuotedStr('1')+',');
                      SQL.Add(':PRICE,');
                      Params.ParamByName('PRICE').AsFloat := TArticle.FieldByName('PRICE_ART').AsFloat;
                      SQL.Add(''+QuotedStr(TArticle.FieldByName('DESI_ART').AsString)+',');
                      SQL.Add(':ID,');
                      Params.ParamByName('ID').AsInteger := TOUT.FieldByName('ID_OUT').AsInteger;
                      SQL.Add(':ID1)');
                      Params.ParamByName('ID1').AsInteger := TArticle.FieldByName('ID_ARTICLE').AsInteger;
                      ExecSQL;
                    end;

                  with SUMM do
                    begin
                      Close;
                      SQL.Clear;
                      SQL.Text := 'SELECT SUM(CS_QTE * CS_PRICE) FROM TConsum WHERE ID_OUT = '+QuotedStr(TOUT.FieldByName('ID_OUT').AsString);
                      Open();
                    end;

                    LBL_MONTANT.Caption := Format('%.2m', [SUMM.Fields[0].AsFloat]);

                    TArticle.Edit;
                    TArticle.FieldByName('QTE_ART').AsFloat := TArticle.FieldByName('QTE_ART').AsFloat - 1;
                    TArticle.Post;

                    TArticle.Refresh;
                    DBAdvGrid3.Refresh;

                    OCS.Refresh;
                    DBAdvGrid1.Refresh;
                end;
            end
          else
            begin
              BLK.Show;
              MessageDlg('Erreur: la quantité n''est pas disonible sous stock.', mtInformation, [mbOK], 0);
              FAdd_Consu.Show;
            end;
        end
      else
        begin
          BLK.Show;
          MessageDlg('Erreur: le produit existe déja dans le bon.', mtInformation, [mbOK], 0);
          FAdd_Consu.Show;
        end;

      OCS.Filtered := False;

    end;
end;

procedure TFAdd_Consu.DBAdvGrid3GetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  with DBAdvGrid3 do
    with FData.TArticle do
      begin
        if ARow = GetRealRow then // To affect changes to the selected Row only
          begin
            SelectionColor := $00ECEC81;
            SelectionColorTo := $00C9CE00;
            AFont.Size := 12;
            AFont.Style := [fsBold];
          end;
      end;
end;

procedure TFAdd_Consu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
CancelAdd;
blk.Close;
FData.TOUT.Refresh;
FMain.DBAdvGrid1.Refresh;
end;

procedure TFAdd_Consu.FormShow(Sender: TObject);
begin
LBL_MONTANT.Caption := '0.00 DA';
EDT_RECIP.Text := '';
DBAdvGrid1.DataSource := FData.DOCS;
  DBAdvGrid3.DataSource := FData.DArticle;
end;

end.
