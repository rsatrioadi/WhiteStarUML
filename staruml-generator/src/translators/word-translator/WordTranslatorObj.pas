unit WordTranslatorObj;

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

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Dialogs, WordTranslatorEngine,
  ComObj, ActiveX, StdVcl, WSGenerator_TLB, WSWordTranslator_TLB;

type

  TWordTranslatorObj = class(TAutoObject, ITranslator)
  private
    WordEngine: PWordTranslatorEngine;
    FilePath: string;
  protected
    function Execute(const Args: IHashTable; out ResultValues: IHashTable): WordBool; safecall;
    procedure SetLogger(const Logger: ILogger); safecall;
    function GetGeneratedFileCount: Integer; safecall;
    function GetGeneratedFileAt(Index: Integer): WideString; safecall;
    procedure Abort; safecall;
  public
    procedure Initialize; override;
    destructor Destroy; override;
  end;

implementation


uses ComServ;

procedure TWordTranslatorObj.Initialize;
begin
  inherited;
  WordEngine := PWordTranslatorEngine.Create;
end;

destructor TWordTranslatorObj.Destroy;
begin
  WordEngine.Free;
  inherited;
end;

procedure TWordTranslatorObj.SetLogger(const Logger: ILogger);
begin
  WordEngine.Logger := Logger;
end;

procedure TWordTranslatorObj.Abort;
begin
  WordEngine.Abort;
end;

function TWordTranslatorObj.Execute(const Args: IHashTable; out ResultValues: IHashTable): WordBool;
begin
  FilePath := Args.Get('OutputFile');
  Result := WordEngine.Execute(Args);
end;

function TWordTranslatorObj.GetGeneratedFileAt(Index: Integer): WideString;
begin
  Result := FilePath;
end;

function TWordTranslatorObj.GetGeneratedFileCount: Integer;
begin
  Result := 1;
end;

initialization
  TAutoObjectFactory.Create(ComServer, TWordTranslatorObj, Class_WordTranslatorObj,
    ciMultiInstance, tmApartment);
end.
