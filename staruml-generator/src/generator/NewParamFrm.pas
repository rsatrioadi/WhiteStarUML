unit NewParamFrm;

{******************************************************************************}
{                                                                              }
{                StarUML - The Open Source UML/MDA Platform.                   }
{                                                                              }
{              Copyright (C) 2002-2005 - Plastic Software, Inc.                }
{                                                                              }
{                                                                              }
{ This program is free software; you can redistribute it and/or modify it      }
{ under the terms of the GNU General Public License as published by the Free   }
{ Software Foundation; either version 2 of the License, or (at your option)    }
{ any later version.                                                           }
{                                                                              }
{ This program is distributed in the hope that it will be useful, but WITHOUT  }
{ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        }
{ FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     }
{ more details.                                                                }
{                                                                              }
{ You should have received a copy of the GNU General Public License along with }
{ this program; if not, write to the Free Software Foundation, Inc., 51        }
{ Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          }
{                                                                              }
{ Linking StarUML statically or dynamically with other modules is making a     }
{ combined work based on StarUML. Thus, the terms and conditions of the GNU    }
{ General Public License cover the whole combination.                          }
{                                                                              }
{ In addition, as a special exception, Plastic Software give you permission to }
{ combine StarUML program with free software programs or libraries that are    }
{ released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the }
{ standard release of ExpressBar, ExpressNavBar, ExpressInspector,             }
{ ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    }
{ modified versions of such code, with unchanged license). You may copy and    }
{ distribute such a system following the terms of the GNU GPL for StarUML and  }
{ the licenses of the other code concerned, provided that you include the      }
{ source code of that other code when and as the GNU GPL requires distribution }
{ of source code. Plastic Software also give you permission to combine StarUML }
{ program with dynamically linking plug-in (or add-in) programs that are       }
{ released under the GPL-incompatible and proprietary license.                 }
{                                                                              }
{ Note that people who make modified versions of StarUML are not obligated to  }
{ grant this special exception for their modified versions; it is their choice }
{ whether to do so. The GNU General Public License gives permission to release }
{ a modified version without this exception; this exception also makes it      }
{ possible to release a modified version which carries forward this exception. }
{******************************************************************************}

interface

uses
  DirectMDAObjects,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  // TNewParameterForm
  TNewParameterForm = class(TForm)
    ParameterLabel: TLabel;
    NameEdit: TEdit;
    TypeLabel: TLabel;
    ValueLabel: TLabel;
    ValueEdit: TEdit;
    TypeComboBox: TComboBox;
    AcceptButton: TButton;
    CancelButton: TButton;
    Bevel: TBevel;
    procedure FormShow(Sender: TObject);
    procedure NameEditChange(Sender: TObject);
  private
    function GetParameterName: string;
    function GetParameterType: PParameterTypeKind;
    function GetParameterDefaultValue: string;

    procedure SetParameterName(Value: String);
    procedure SetParameterType(Value: PParameterTypeKind);
    procedure SetParameterDefaultValue(Value: string);

    procedure UpdateUIStates;
  public
    function Execute: Boolean;
    property ParameterName: string read GetParameterName write SetParameterName;
    property ParameterType: PParameterTypeKind read GetParameterType write SetParameterType;
    property ParameterDefaultValue: string read GetParameterDefaultValue write SetParameterDefaultValue;
  end;

implementation

{$R *.dfm}

////////////////////////////////////////////////////////////////////////////////
// TNewParameterForm

function TNewParameterForm.GetParameterName: string;
begin
  Result := NameEdit.Text;
end;

function TNewParameterForm.GetParameterType: PParameterTypeKind;
begin
  Result := StringToParameterTypeKind(TypeComboBox.Text);
end;

function TNewParameterForm.GetParameterDefaultValue: string;
begin
  Result := ValueEdit.Text;
end;

procedure TNewParameterForm.SetParameterDefaultValue(Value: string);
begin
  ValueEdit.Text := Value;
end;

procedure TNewParameterForm.SetParameterName(Value: String);
begin
  NameEdit.Text := Value;
end;

procedure TNewParameterForm.SetParameterType(Value: PParameterTypeKind);
begin
  //TypeComboBox.Text := ParameterTypeKindToString(Value);
  TypeComboBox.ItemIndex := Ord(Value);
end;

procedure TNewParameterForm.UpdateUIStates;
begin
  AcceptButton.Enabled := (NameEdit.Text <> '') and (TypeComboBox.ItemIndex <> -1);
end;

function TNewParameterForm.Execute: Boolean;
begin
  Result := (ShowModal = mrOk);
end;

// TNewParameterForm
////////////////////////////////////////////////////////////////////////////////

procedure TNewParameterForm.FormShow(Sender: TObject);
begin
  UpdateUIStates;
end;

procedure TNewParameterForm.NameEditChange(Sender: TObject);
begin
  UpdateUIStates;
end;

end.
