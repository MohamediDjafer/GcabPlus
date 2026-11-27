object FData: TFData
  OldCreateOrder = False
  Height = 528
  Width = 743
  object FDC: TFDConnection
    Params.Strings = (
      'Database=gcabplus'
      'User_Name=sa'
      'Password=63.049812.. coddedMe'
      'Server=MEDAI'
      'DriverID=MSSQL')
    ResourceOptions.AssignedValues = [rvBackup, rvAutoConnect, rvAutoReconnect]
    ResourceOptions.Backup = True
    ResourceOptions.AutoReconnect = True
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 16
  end
  object TBill: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TBILL')
    Left = 16
    Top = 160
    object TBillID_BILL: TFDAutoIncField
      FieldName = 'ID_BILL'
      Origin = 'ID_BILL'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TBillBenefic: TWideStringField
      FieldName = 'Benefic'
      Origin = 'Benefic'
      Size = 150
    end
    object TBillBILL_MONTANT: TCurrencyField
      FieldName = 'BILL_MONTANT'
      Origin = 'BILL_MONTANT'
      Required = True
    end
    object TBillBILL_DATE: TSQLTimeStampField
      FieldName = 'BILL_DATE'
      Origin = 'BILL_DATE'
      Required = True
    end
    object TBillBILL_TIME: TWideStringField
      FieldName = 'BILL_TIME'
      Origin = 'BILL_TIME'
      Size = 10
    end
    object TBillBILL_RESTE: TCurrencyField
      FieldName = 'BILL_RESTE'
      Origin = 'BILL_RESTE'
    end
    object TBillBILL_VERSE: TCurrencyField
      FieldName = 'BILL_VERSE'
      Origin = 'BILL_VERSE'
    end
    object TBillUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Size = 150
    end
    object TBillUSER_NAME_E: TWideStringField
      FieldName = 'USER_NAME_E'
      Origin = 'USER_NAME_E'
      Size = 150
    end
    object TBillDATE_E: TSQLTimeStampField
      FieldName = 'DATE_E'
      Origin = 'DATE_E'
    end
    object TBillTIME_E: TWideStringField
      FieldName = 'TIME_E'
      Origin = 'TIME_E'
      Size = 10
    end
  end
  object DBill: TDataSource
    DataSet = TBill
    Left = 16
    Top = 216
  end
  object ADDQ: TFDQuery
    Connection = FDC
    Left = 80
    Top = 16
    ParamData = <
      item
        Name = 'dat'
        DataType = ftDateTime
      end
      item
        Name = 'PRICE'
        DataType = ftFloat
      end
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        DataType = ftInteger
        DataTypeName = 'ID1'
      end>
  end
  object TArticle: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TArticle WHERE DISP = 1')
    Left = 80
    Top = 160
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object TArticleID_ARTICLE: TFDAutoIncField
      FieldName = 'ID_ARTICLE'
      Origin = 'ID_ARTICLE'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TArticleDESI_ART: TWideStringField
      FieldName = 'DESI_ART'
      Origin = 'DESI_ART'
      Required = True
      Size = 255
    end
    object TArticleCAT_ART: TWideStringField
      FieldName = 'CAT_ART'
      Origin = 'CAT_ART'
      Size = 150
    end
    object TArticleFAM_ART: TWideStringField
      FieldName = 'FAM_ART'
      Origin = 'FAM_ART'
      Size = 150
    end
    object TArticleQTE_ART: TSingleField
      FieldName = 'QTE_ART'
      Origin = 'QTE_ART'
    end
    object TArticlePRICE_ART: TCurrencyField
      FieldName = 'PRICE_ART'
      Origin = 'PRICE_ART'
    end
    object TArticleDISP: TWideStringField
      FieldName = 'DISP'
      Origin = 'DISP'
      Size = 10
    end
  end
  object TCAB: TFDQuery
    Connection = FDC
    Left = 144
    Top = 160
  end
  object TConsum: TFDQuery
    Connection = FDC
    Left = 208
    Top = 160
  end
  object TUsers: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TUsers')
    Left = 400
    Top = 160
  end
  object TPurchase: TFDQuery
    Connection = FDC
    Left = 336
    Top = 160
  end
  object TOUT_Test: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT TOP 1 * FROM TOUT ORDER BY ID_OUT DESC')
    Left = 272
    Top = 160
  end
  object DArticle: TDataSource
    DataSet = TArticle
    Left = 80
    Top = 216
  end
  object DCAB: TDataSource
    DataSet = TCAB
    Left = 144
    Top = 216
  end
  object DConsum: TDataSource
    DataSet = TConsum
    Left = 208
    Top = 216
  end
  object DUsers: TDataSource
    DataSet = TUsers
    Left = 400
    Top = 216
  end
  object DPurchase: TDataSource
    DataSet = TPurchase
    Left = 336
    Top = 216
  end
  object DOUT_Test: TDataSource
    DataSet = TOUT_Test
    Left = 272
    Top = 216
  end
  object SEAR: TFDQuery
    Connection = FDC
    Left = 144
    Top = 16
  end
  object UPD: TFDQuery
    Connection = FDC
    Left = 208
    Top = 16
  end
  object DEL: TFDQuery
    Connection = FDC
    Left = 272
    Top = 16
  end
  object EDT: TFDQuery
    Connection = FDC
    Left = 336
    Top = 16
  end
  object FILT: TFDQuery
    Connection = FDC
    Left = 400
    Top = 16
  end
  object FDQuery6: TFDQuery
    Connection = FDC
    Left = 80
    Top = 80
  end
  object FDQuery8: TFDQuery
    Connection = FDC
    Left = 208
    Top = 80
  end
  object FDQuery9: TFDQuery
    Connection = FDC
    Left = 272
    Top = 80
  end
  object FDQuery10: TFDQuery
    Connection = FDC
    Left = 336
    Top = 80
  end
  object DSEAR: TDataSource
    DataSet = SEAR
    Left = 144
    Top = 80
  end
  object DFILT: TDataSource
    DataSet = FILT
    Left = 400
    Top = 80
  end
  object vide: TDataSource
    Left = 16
    Top = 80
  end
  object OCS: TFDQuery
    AfterPost = OCSAfterPost
    OnCalcFields = OCSCalcFields
    Connection = FDC
    Left = 456
    Top = 160
    object OCSMON: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MON'
      Calculated = True
    end
    object OCSID_Consu: TFDAutoIncField
      FieldName = 'ID_Consu'
      Origin = 'ID_Consu'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OCSARTICLE_NAME: TWideStringField
      FieldName = 'ARTICLE_NAME'
      Origin = 'ARTICLE_NAME'
      Size = 150
    end
    object OCSCS_QTE: TSingleField
      FieldName = 'CS_QTE'
      Origin = 'CS_QTE'
      Required = True
    end
    object OCSCS_PRICE: TCurrencyField
      FieldName = 'CS_PRICE'
      Origin = 'CS_PRICE'
      Required = True
    end
    object OCSARTICLE_REF: TWideStringField
      FieldName = 'ARTICLE_REF'
      Origin = 'ARTICLE_REF'
      Required = True
      Size = 50
    end
    object OCSCS_DATE: TSQLTimeStampField
      FieldName = 'CS_DATE'
      Origin = 'CS_DATE'
    end
    object OCSCS_TIME: TWideStringField
      FieldName = 'CS_TIME'
      Origin = 'CS_TIME'
      Size = 10
    end
    object OCSUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Origin = 'USER_NAME'
      Size = 50
    end
    object OCSID_OUT: TWideStringField
      FieldName = 'ID_OUT'
      Origin = 'ID_OUT'
      Required = True
      Size = 50
    end
    object OCSID_ARTICLE: TIntegerField
      FieldName = 'ID_ARTICLE'
      Origin = 'ID_ARTICLE'
      Required = True
    end
  end
  object DOCS: TDataSource
    DataSet = OCS
    Left = 456
    Top = 216
  end
  object SUMM: TFDQuery
    Connection = FDC
    Left = 456
    Top = 16
  end
  object TOUT: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TOUT')
    Left = 16
    Top = 272
  end
  object DOUT: TDataSource
    DataSet = TOUT
    Left = 16
    Top = 328
  end
  object TRecipient: TFDQuery
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TRecipient')
    Left = 80
    Top = 272
  end
  object DRecipient: TDataSource
    DataSet = TRecipient
    Left = 80
    Top = 328
  end
  object TDepense: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TDepense')
    Left = 144
    Top = 272
    object TDepenseDEP_DESI: TWideStringField
      FieldName = 'DEP_DESI'
      Origin = 'DEP_DESI'
      Size = 150
    end
    object TDepenseDEP_QTE: TSingleField
      FieldName = 'DEP_QTE'
      Origin = 'DEP_QTE'
    end
    object TDepenseDEP_PRICE: TCurrencyField
      FieldName = 'DEP_PRICE'
      Origin = 'DEP_PRICE'
    end
    object TDepenseDEP_DATE: TSQLTimeStampField
      FieldName = 'DEP_DATE'
      Origin = 'DEP_DATE'
    end
    object TDepenseDEP_TIME: TWideStringField
      FieldName = 'DEP_TIME'
      Origin = 'DEP_TIME'
      Size = 15
    end
    object TDepenseMON: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MON'
      Calculated = True
    end
  end
  object DDepense: TDataSource
    DataSet = TDepense
    Left = 144
    Top = 328
  end
  object VAnte_F: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM VAnte_F')
    Left = 208
    Top = 272
  end
  object DAnte_F: TDataSource
    DataSet = VAnte_F
    Left = 208
    Top = 328
  end
  object VAnte_M: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM VAnte_M')
    Left = 272
    Top = 272
  end
  object DAnte_M: TDataSource
    DataSet = VAnte_M
    Left = 272
    Top = 328
  end
  object VAnte_CH: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM VAnte_CH')
    Left = 336
    Top = 272
  end
  object DAnte_CH: TDataSource
    DataSet = VAnte_CH
    Left = 336
    Top = 328
  end
  object VAnte_A: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM VAnte_A')
    Left = 400
    Top = 272
  end
  object DAnte_A: TDataSource
    DataSet = VAnte_A
    Left = 400
    Top = 328
  end
  object TPATIENTS: TFDQuery
    OnCalcFields = TDepenseCalcFields
    Connection = FDC
    SQL.Strings = (
      'SELECT * FROM TPATIENTS')
    Left = 456
    Top = 272
  end
  object DPATIENTS: TDataSource
    DataSet = TPATIENTS
    Left = 456
    Top = 328
  end
end
