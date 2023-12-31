unit TagEdtFrmWithJvclInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCore, TagEdtFrm, ImgList, StdCtrls, ComCtrls, TagColEdtFrm,
  Generics.Collections,
  JvExControls, JvInspector, JvclExtensions;

type
  TTaggedValueEditorFormWithJvclInspector = class(TTaggedValueEditorForm)
    Inspector: TJvInspector;
    procedure FormCreate(Sender: TObject);
    procedure InspectorItemEdit(Sender: TJvCustomInspector;
      Item: TJvCustomInspectorItem; var DisplayStr: string);
    procedure InspectorItemSelected(Sender: TObject);
    procedure InspectorItemValueChanged(Sender: TObject;
      Item: TJvCustomInspectorItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  PTagDefinitionSetJvclInspector = class(PTagDefinitionSetInspector)
  private
    Form: TTaggedValueEditorFormWithJvclInspector;
    //RowList: TRowList;
    FElemsHolder: TInspectorElemsHolder;
  private
    function GetTagDefinition(Row: TJvCustomInspectorItem): PTagDefinition;
    procedure ChangeDataTaggedValue(Row: TJvCustomInspectorItem;
      AsDefault: Boolean = False); overload;
    procedure ChangeDataTaggedValue(Row: TJvCustomInspectorItem; Value: string;
      AsDefault: Boolean = False); overload;
    procedure ChangeReferenceTaggedValue(Row: TJvCustomInspectorItem;
      Value: PExtensibleModel; AsDefault: Boolean = False);
    procedure SetTaggedValueAsDefault(Row: TJvCustomInspectorItem);
    procedure SetupTagDefintionSetCategory
      (ATagDefinitionSet: PTagDefinitionSet);

    function CreateCategoryItem(CategoryName: string)
      : TJvInspectorCustomCategoryItem;
    function SetUpTextRow(SuperNode: TJvInspectorCustomCategoryItem;
      TD: PTagDefinition; ImageIndex: Integer; AFlags: TInspectorItemFlags = [])
      : TJvInspectorElemBase;
    function SetUpTextButtonRow(SuperNode: TJvInspectorCustomCategoryItem;
      TD: PTagDefinition; ImageIndex: Integer): TJvInspectorElemBase;
    function SetUpCheckRow(SuperNode: TJvInspectorCustomCategoryItem;
      TD: PTagDefinition; ImageIndex: Integer): TJvInspectorElemBase;
    function SetUpChoiceRow(SuperNode: TJvInspectorCustomCategoryItem;
      TD: PTagDefinition; ImageIndex: Integer): TJvInspectorElemBase;

    procedure MultiLineTextChanged(NewText: string);

    // Event handlers
    procedure InspectorEdited(Sender: TObject);
    procedure ButtonRowButtonClick(Sender: TJvCustomInspector;
      Item: TJvCustomInspectorItem; var DisplayStr: string);

  protected
    function GetFocusedTagDefinition: PTagDefinition; override;
    procedure ClearRows; override;
    procedure SetupRows; override;
    procedure FinalizeEditingCurrentModel; override;

  public
    constructor Create(AOwner: TTaggedValueEditorFormWithJvclInspector);
    destructor Destroy; override;
    procedure UpdateTaggedValues; override;
    procedure SetFocusedTaggedValueAsDefault; override;
  end;

  {var
    TaggedValueEditorForm: TTaggedValueEditorFormWithJvclInspector;}

implementation

uses
  ElemLstFrm, NLS, NLS_StarUML,
  HtmlHlp;
{$R *.dfm}


constructor PTagDefinitionSetJvclInspector.Create
  (AOwner: TTaggedValueEditorFormWithJvclInspector);
begin
  inherited Create(AOwner);
  Form := AOwner;
  //RowList := TRowList.Create;
  FElemsHolder := TInspectorElemsHolder.Create(Form.Inspector);
end;

destructor PTagDefinitionSetJvclInspector.Destroy;
begin
  FreeAndNil(FElemsHolder);
  inherited;
end;

function PTagDefinitionSetJvclInspector.GetTagDefinition
  (Row: TJvCustomInspectorItem): PTagDefinition;
var
  ParentRow: TJvCustomInspectorItem;
begin
  Result := nil;
  if Model <> nil then
  begin
    // if Row.Node.Level = TAGGEDVALUEITEM_LEVEL then begin
    ParentRow := Row.Parent;
    Result := ExtensionManager.FindTagDefinition(GetProfile.Name,
      ParentRow.Name, Row.DisplayName);
  end;
end;

function PTagDefinitionSetJvclInspector.GetFocusedTagDefinition: PTagDefinition;
begin
  Result := nil;
  if (Form.Inspector.FocusedItem <> nil) then
    Result := GetTagDefinition(Form.Inspector.FocusedItem);
end;

procedure PTagDefinitionSetJvclInspector.SetFocusedTaggedValueAsDefault;
begin
  SetTaggedValueAsDefault(Form.Inspector.FocusedItem);
end;

procedure PTagDefinitionSetJvclInspector.SetTaggedValueAsDefault
  (Row: TJvCustomInspectorItem);
var
  T: PTagDefinition;
begin
  T := GetTagDefinition(Row);
  if (T <> nil) and Assigned(FOnSetTaggedValueAsDefault) then
    FOnSetTaggedValueAsDefault(Self, Model, Profile.Name,
      T.TagDefinitionSet.Name, T.Name);
end;

procedure PTagDefinitionSetJvclInspector.ChangeDataTaggedValue
  (Row: TJvCustomInspectorItem; AsDefault: Boolean = False);
var
  T: PTagDefinition;
  Value: string;
begin
  T := GetTagDefinition(Row);
  if T.TagType in [tkInteger, tkReal, tkString, tkEnumeration] then
    Value := Row.Data.AsString
  else if T.TagType in [tkBoolean] then
    Value := BoolToStr(Boolean(Row.Data.AsOrdinal),True)
  else
    Exit;

  ChangeDataTaggedValue(Row, Value);
end;

procedure PTagDefinitionSetJvclInspector.ChangeDataTaggedValue
  (Row: TJvCustomInspectorItem; Value: string; AsDefault: Boolean = False);
var
  T: PTagDefinition;
begin
  T := GetTagDefinition(Row);
  if IsDataTagType(T.TagType) and Assigned(FOnDataTaggedValueChange) then
    FOnDataTaggedValueChange(Self, Model, Profile.Name,
      T.TagDefinitionSet.Name, T.Name, Value);
end;

procedure PTagDefinitionSetJvclInspector.ChangeReferenceTaggedValue
  (Row: TJvCustomInspectorItem; Value: PExtensibleModel;
  AsDefault: Boolean = False);
var
  T: PTagDefinition;
begin
  T := GetTagDefinition(Row);
  if (T.TagType = tkReference) and Assigned(FOnReferenceTaggedValueChange) then
    FOnReferenceTaggedValueChange(Self, Model, Profile.Name,
      T.TagDefinitionSet.Name, T.Name, Value);
end;

function PTagDefinitionSetJvclInspector.CreateCategoryItem(CategoryName: string)
  : TJvInspectorCustomCategoryItem;
begin
  Result := TJvInspectorCustomCategoryItem.Create(Form.Inspector.Root, nil);
  Result.Flags := Result.Flags + [iifHidden, iifExpanded];
  Result.SortKind := iskNone;
  Result.Name := CategoryName;
end;

procedure PTagDefinitionSetJvclInspector.SetupRows;
begin
  Form.Inspector.BeginUpdate;
  ClearRows;
  if (Model <> nil) and (FTagDefinitionSet <> nil) then
    SetupTagDefintionSetCategory(FTagDefinitionSet);
  Form.Inspector.EndUpdate;
end;

procedure PTagDefinitionSetJvclInspector.FinalizeEditingCurrentModel;
var
  CurrentRow: TJvCustomInspectorItem;
begin
    CurrentRow := Form.Inspector.FocusedItem;
    if (CurrentRow <> nil) and (CurrentRow.Editing) then
      CurrentRow.DoneEdit;
end;

procedure PTagDefinitionSetJvclInspector.SetupTagDefintionSetCategory
  (ATagDefinitionSet: PTagDefinitionSet);
var
  TD: PTagDefinition;
  CategoryNode: TJvInspectorCustomCategoryItem;
begin
  CategoryNode := CreateCategoryItem(ATagDefinitionSet.Name);

  if Assigned(Model) then
    ReadOnly := Model.ReadOnly
  else
    ReadOnly := True;

  for TD in  ATagDefinitionSet do
  begin
    case TD.TagType of
      tkInteger, tkReal:
        SetUpTextRow(CategoryNode, TD, 0);
      tkBoolean:
        SetUpCheckRow(CategoryNode, TD, 0);
      tkString:
        if TD.Lock then
          SetUpTextRow(CategoryNode, TD, 0)
        else
          SetUpTextButtonRow(CategoryNode, TD, 0);
      tkEnumeration:
        SetUpChoiceRow(CategoryNode, TD, 2);
      tkReference:
        SetUpTextButtonRow(CategoryNode, TD, 0);
      tkCollection:
        SetUpTextButtonRow(CategoryNode, TD, 3);
    end; // of case TD.TagType

  end; // of for
  CategoryNode.ExpandItems(true);
  if GetParentTagDefinitionSet(ATagDefinitionSet) <> nil then
    SetupTagDefintionSetCategory(GetParentTagDefinitionSet(ATagDefinitionSet));
end;

function PTagDefinitionSetJvclInspector.SetUpTextRow
  (SuperNode: TJvInspectorCustomCategoryItem; TD: PTagDefinition;
  ImageIndex: Integer; AFlags: TInspectorItemFlags = []): TJvInspectorElemBase;
begin
  // Create item basing on its TagType value
  if TD.Lock or (TD.TagType <> tkString) then // Single line editor
    Result := TJvInspectorElem<TStringItemWithNameImage>.CreateElem
      (SuperNode, TagTypeToStr(TD.TagType))
  else // Proper string type, create multi line editor
    Result := TJvInspectorElem<TMultiStringItemWithNameImage>.CreateElem
      (SuperNode, TagTypeToStr(TD.TagType));

  if Assigned(Result) then begin // Element was created now setup the underlying item
    FElemsHolder.AddElem(Result); // Memory management

    with Result.Item do begin
      DisplayName := TD.Name;

      // Setting flags
      Flags := Flags + AFlags;
      // Do not allow inplace editing for collections and references
      if TD.TagType in [tkCollection, tkReference] then
        Flags := Flags + [iifEditFixed];

      // Setting single line string item
      if Result.Item is TJvInspectorStringItemWithNameImage then begin
        Data.AsString := TD.DefaultValue;
        with Result.Item as TJvInspectorStringItemWithNameImage do begin
          NameImages := Form.RowImageList;
          if TD.Lock then
            NameImageIdx := 1
          else
            NameImageIdx := ImageIndex
        end
      end
      else // Setting multi line string item
        with Result.Item as TJvInspectorMultiStringItemWithNameImage do begin
          NewString := TD.DefaultValue;
          OnTextModifiedWithEditor := MultiLineTextChanged;
          OnTextModifiedInline := MultiLineTextChanged;
          NameImages := Form.RowImageList;
          if TD.Lock then
            NameImageIdx := 1
          else
            NameImageIdx := ImageIndex;
        end;

      // Setting Readonly flag
      ReadOnly := TD.Lock or FReadOnly;
      if not ReadOnly then
        OnValueChanged := InspectorEdited;
    end; // End of with Result.Item
  end; // End of if Result <> nil
end;

function PTagDefinitionSetJvclInspector.SetUpTextButtonRow
  (SuperNode: TJvInspectorCustomCategoryItem; TD: PTagDefinition;
  ImageIndex: Integer): TJvInspectorElemBase;
begin
  Result := SetUpTextRow(SuperNode, TD, ImageIndex,
  [iifEditButton{, iifEditFixed}]);
end;

function PTagDefinitionSetJvclInspector.SetUpCheckRow
  (SuperNode: TJvInspectorCustomCategoryItem; TD: PTagDefinition;
  ImageIndex: Integer): TJvInspectorElemBase;
begin
  Result := TJvInspectorElem<TBooleanItemWithNameImage>.CreateElem
    (SuperNode, TagTypeToStr(TD.TagType));
  if Result <> nil then
  begin
    FElemsHolder.AddElem(Result);
    with Result.Item do
    begin
      DisplayName := TD.Name;
      ReadOnly := TD.Lock or FReadOnly;
      if not ReadOnly then
        OnValueChanged := InspectorEdited;
    end;
    with Result.Item as TJvInspectorBooleanItemWithNameImage do
    begin
      NameImages := Form.RowImageList;
      if TD.Lock then
        NameImageIdx := 1
      else
        NameImageIdx := ImageIndex;
      ShowAsCheckBox := true;
    end;
end;
end;

function PTagDefinitionSetJvclInspector.SetUpChoiceRow
  (SuperNode: TJvInspectorCustomCategoryItem; TD: PTagDefinition;
  ImageIndex: Integer): TJvInspectorElemBase;
var
  J: Integer;
begin
  Result := TJvInspectorElem<TImageText>.CreateElem(SuperNode, TagTypeToStr(TD.TagType));
  if Result <> nil then
  begin
    FElemsHolder.AddElem(Result);
    with Result.Item do
    begin
      DisplayName := TD.Name;
  // SubNode.ReadOnly := (not P.RowEditable) or FReadOnly;
      ReadOnly := FReadOnly;
      if not ReadOnly then
        OnValueChanged := InspectorEdited;
    end;
    with Result.Item as TJvInspectorTImageTextItem do
    begin
      NameImages := Form.RowImageList;
      NameImageIdx := ImageIndex;
      ValueTexts := TStringList.Create;
      for J := 0 to TD.LiteralCount - 1 do
        ValueTexts.Add(TD.Literals[J]);
      ValueImages := nil;
    end;
end;
end;

procedure PTagDefinitionSetJvclInspector.UpdateTaggedValues;
var
  T: PTagDefinition;
  TV: PTaggedValue;
  Row: TJvInspectorElemBase;
  NewRefValue: string;
begin
  if Assigned(Model) then begin
    ReadOnly := Model.ReadOnly;
    for Row in FElemsHolder do
    begin
      T := GetTagDefinition(Row.Item);
      if T <> nil then
      begin
        TV := Model.FindTaggedValue(Profile.Name, T.TagDefinitionSet.Name,
          T.Name);
        case T.TagType of
          tkInteger, tkReal:
            Row.Item.Data.AsString := Model.QueryDataTaggedValue(Profile.Name,
              T.TagDefinitionSet.Name, T.Name);
          tkBoolean:
            Row.Item.Data.AsOrdinal := Integer
              (StrToBool(Model.QueryDataTaggedValue(Profile.Name,
                  T.TagDefinitionSet.Name, T.Name)));
          tkEnumeration:
            Row.Item.Data.AsString := Model.QueryDataTaggedValue(Profile.Name,
              T.TagDefinitionSet.Name, T.Name);
          tkString:
            if Row.Item is TJvInspectorMultiStringItemWithNameImage then
              (Row.Item as TJvInspectorMultiStringItemWithNameImage).NewString :=
                Model.QueryDataTaggedValue(Profile.Name,T.TagDefinitionSet.Name, T.Name)
            else
              Row.Item.Data.AsString := Model.QueryDataTaggedValue(Profile.Name,
                T.TagDefinitionSet.Name, T.Name);

          tkReference:
            begin
              if Assigned(TV) and (TV.ReferenceValueCount > 0) then
                NewRefValue := TV.ReferenceValue[0].Name
              else
                NewRefValue := '';

              if Row.Item is TJvInspectorMultiStringItemWithNameImage then
                (Row.Item as TJvInspectorMultiStringItemWithNameImage).NewString := NewRefValue
              else
                Row.Item.Data.AsString := NewRefValue;
             end;

          tkCollection:
            if Row.Item is TJvInspectorMultiStringItemWithNameImage then
              (Row.Item as TJvInspectorMultiStringItemWithNameImage).NewString := TXT_TAGGEDVALUE_COLLECTION
            else
              Row.Item.Data.AsString := TXT_TAGGEDVALUE_COLLECTION;
        end; // of case T.TagType
      end; // if T <> nil
    end; // of for Row
    {if Assigned(FOnInspectorChange) then
      FOnInspectorChange(Self);}
    Form.Inspector.RefreshValues;
  end // of if FModel <> nil
  else
    ReadOnly := True;

end;

procedure PTagDefinitionSetJvclInspector.InspectorEdited(Sender: TObject);
var
  InspectorItem: TJvCustomInspectorItem;
begin
  InspectorItem := Sender as TJvCustomInspectorItem;
  ChangeDataTaggedValue(InspectorItem);
end;

procedure PTagDefinitionSetJvclInspector.ButtonRowButtonClick
  (Sender: TJvCustomInspector; Item: TJvCustomInspectorItem;
  var DisplayStr: string);
var
  T: PTagDefinition;
begin

  T := GetTagDefinition(Item);
  if T <> nil then
  begin
    case T.TagType of
      tkReference:
        begin
          ElementListForm.ClearListElements;
          if T.ReferenceType = '' then
            ElementListForm.AddListElementsByClass(DEFAULT_REFERENCETYPE, true)
          else
            ElementListForm.AddListElementsByClass(T.ReferenceType, true);
          ElementListForm.AllowNull := true;
          if ElementListForm.Execute(TXT_TAGGED_VALUE) then
            ChangeReferenceTaggedValue(Item,
              ElementListForm.SelectedModel as PExtensibleModel);
        end;
      tkCollection:
        TaggedValueCollectionEditorForm.ShowTaggedValueCollection(Model,
          GetTagDefinition(Item));
    end;
    DisplayStr := Item.Data.AsString;
    Sender.SetFocus;
  end;
end;

procedure PTagDefinitionSetJvclInspector.ClearRows;
begin
  Form.Inspector.Clear;
  FElemsHolder.EmptyElemList;
end;

procedure PTagDefinitionSetJvclInspector.MultiLineTextChanged(NewText: string);
var
  Row: TJvCustomInspectorItem;
begin
  Row := Form.Inspector.Selected;
  ChangeDataTaggedValue(Row, NewText);
end;

/// /////////////////////////////////////////////////////////////////////////////
// TTaggedValueEditorFormWithJvclInspector

procedure TTaggedValueEditorFormWithJvclInspector.FormCreate(Sender: TObject);
begin
  TagDefinitionSetInspector := PTagDefinitionSetJvclInspector.Create(Self);
  inherited;
end;

procedure TTaggedValueEditorFormWithJvclInspector.InspectorItemEdit
  (Sender: TJvCustomInspector; Item: TJvCustomInspectorItem;
  var DisplayStr: string);
begin
  inherited;
  with TagDefinitionSetInspector as PTagDefinitionSetJvclInspector do
    ButtonRowButtonClick(Sender, Item, DisplayStr);
end;

procedure TTaggedValueEditorFormWithJvclInspector.InspectorItemSelected(
  Sender: TObject);
begin
  inherited;
  if Assigned(TagDefinitionSetInspector.OnInspectorChange) then
    TagDefinitionSetInspector.OnInspectorChange(Self);
end;

procedure TTaggedValueEditorFormWithJvclInspector.InspectorItemValueChanged(
  Sender: TObject; Item: TJvCustomInspectorItem);
begin
  inherited;

  if (Item is TJvInspectorMultilineStringItem) then begin
    (Item as TJvInspectorMultilineStringItem).InvokeOnTextModifiedInlineHandler;
  end;
end;

end.
