////////////////////////////////////////////////////////////////////////////////
//                                                                              
//                StarUML - The Open Source UML/MDA Platform.                   
//                                                                              
//              Copyright (C) 2002-2005 - Plastic Software, Inc.                
//                                                                              
//                                                                              
// This program is free software; you can redistribute it and/or modify it      
// under the terms of the GNU General Public License as published by the Free   
// Software Foundation; either version 2 of the License, or (at your option)    
// any later version.                                                           
//                                                                              
// This program is distributed in the hope that it will be useful, but WITHOUT  
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     
// more details.                                                                
//                                                                              
// You should have received a copy of the GNU General Public License along with 
// this program; if not, write to the Free Software Foundation, Inc., 51        
// Franklin St, Fifth Floor, Boston, MA 02110-1301 USA                          
//                                                                              
// Linking StarUML statically or dynamically with other modules is making a     
// combined work based on StarUML. Thus, the terms and conditions of the GNU    
// General Public License cover the whole combination.                          
//                                                                              
// In addition, as a special exception, Plastic Software give you permission to 
// combine StarUML program with free software programs or libraries that are    
// released under the GNU LGPL/Mozilla/Apache/BSD and with code included in the 
// standard release of ExpressBar, ExpressNavBar, ExpressInspector,             
// ExpressPageControl, ProGrammar, NextGrid under the commercial license (or    
// modified versions of such code, with unchanged license). You may copy and    
// distribute such a system following the terms of the GNU GPL for StarUML and  
// the licenses of the other code concerned, provided that you include the      
// source code of that other code when and as the GNU GPL requires distribution 
// of source code. Plastic Software also give you permission to combine StarUML 
// program with dynamically linking plug-in (or add-in) programs that are       
// released under the GPL-incompatible and proprietary license.                 
//                                                                              
// Note that people who make modified versions of StarUML are not obligated to  
// grant this special exception for their modified versions; it is their choice 
// whether to do so. The GNU General Public License gives permission to release 
// a modified version without this exception; this exception also makes it      
// possible to release a modified version which carries forward this exception. 
////////////////////////////////////////////////////////////////////////////////

//////////////// Forward declaration ///////////////////////
var WshShell = new ActiveXObject("WScript.Shell");
var ViewExist;

var  vkPublic = 00000000;
var  vkProtected = 00000001;
var  vkPrivate = 00000002;
var  vkPackage = 00000003;

var params;

//////////////// Profile ///////////////////////
  if(!ProfileLoaded("Java") ) {
    if(!LoadProfile("Java")){
      Msg("Cannot apply without Java Profile.");
      Exit(1); 
    }
  }

  if(!ProfileLoaded("EJB") ) {
    if(!LoadProfile("EJB")){
      Msg("Cannot apply without EJB Profile.");
      Exit(1);
    }
  }


//////////////// Stereotype ///////////////////////
  MsgDrivenBean.SetStereotype2("EJB","EJBImplementation");

//////////////// Attribute ///////////////////////
  if (!HasSameAttribute(MsgDrivenBean, "ctx", "javax.ejb.MessageDrivenContext", "",vkPrivate)){
    var ctx = factory.CreateAttribute(MsgDrivenBean);
    ctx.Name = "ctx";
    ctx.TypeExpression = "javax.ejb.MessageDrivenContext";
    ctx.Visibility = vkPrivate;
  }

//////////////// Operation ///////////////////////
  params = new Array();
  if (!HasSameOperation(MsgDrivenBean, MsgDrivenBean.Name, "", vkPublic, params)){
    var createOpt = factory.CreateOperation(MsgDrivenBean);
    createOpt.name = MsgDrivenBean.Name;
  }

  if (!HasSameOperation(MsgDrivenBean, "setMessageDrivenContext", "", vkPublic,params)){
    var setmsgdrivenctxOpt = factory.CreateOperation(MsgDrivenBean);
    setmsgdrivenctxOpt.name = "setMessageDrivenContext";

      var contextParam = factory.CreateParameter(setmsgdrivenctxOpt);
      contextParam.name = "context";
      contextParam.TypeExpression = "javax.ejb.MessageDrivenContext";
  }

  if (!HasSameOperation(MsgDrivenBean, "ejbCreate", "", vkPublic,params)){
    var ejbcreateOpt = factory.CreateOperation(MsgDrivenBean);
    ejbcreateOpt.name = "ejbCreate";
    ejbcreateOpt.SetTaggedValueAsString("Java", "JavaOperation","JavaThrows" ,"EJBException, CreateException");
  }

  if (!HasSameOperation(MsgDrivenBean, "ejbRemove", "", vkPublic,params)){
    var ejbremoveOpt = factory.CreateOperation(MsgDrivenBean);
    ejbremoveOpt.name = "ejbRemove";
    ejbremoveOpt.SetTaggedValueAsString("Java", "JavaOperation","JavaThrows" ,"EJBException");
  }

  if (!HasSameOperation(MsgDrivenBean, "onMessage", "", vkPublic,params)){
    var onmessageOpt = factory.CreateOperation(MsgDrivenBean);
    onmessageOpt.name = "onMessage";

      var msgParam = factory.CreateParameter(onmessageOpt);
      msgParam.name = "msg";
      msgParam.TypeExpression = "javax.jms.Message";
  }


//////////////// View //////////////////
  var MsgDrivenBeanView;
  MsgDrivenBeanView = GetSingleClassifierView(dgm.DiagramView, MsgDrivenBean);
  if(!ViewExist){
    MsgDrivenBeanView.Left = 112;
    MsgDrivenBeanView.Top = 100;
  }

///////////////////////  Common ////////////////////////////////////////
function HasView(OwnedDiagram, AModel){
var ModelView;

  for (var i = 0 ; i < AModel.GetViewCount(); i++){
    ModelView = AModel.GetViewAt(i);
    if(ModelView.OwnerDiagramView == OwnedDiagram){
      return true;
    }
  }
  return false;
}

function GetSingleDependencyView(OwnedDiagram, Dependency, ClientView, SupilierView){
var DependencyView;
  ViewExist = HasView(OwnedDiagram, Dependency);

  for (var i = 0; i < Dependency.GetViewCount(); i++){
    DependencyView = Dependency.GetViewAt(i);
    if(DependencyView.OwnerDiagramView == OwnedDiagram)
      return DependencyView;
  }

  return factory.CreateDependencyView(OwnedDiagram, Dependency, ClientView, SupilierView);
}

function GetSingleClassifierView(OwnedDiagram, Classifer){
var ClassifierView;

  ViewExist = HasView(OwnedDiagram, Classifer);

  for (var i = 0 ; i < Classifer.GetViewCount(); i++){
    ClassifierView = Classifer.GetViewAt(i);
    if(ClassifierView.OwnerDiagramView == OwnedDiagram){
      return ClassifierView;
    }
  }

  if (Classifer.IsKindOf("UMLClass")){
    return factory.CreateClassView(OwnedDiagram, Classifer);
  }else if(Classifer.IsKindOf("UMLInterface")){
    return factory.CreateInterfaceView(OwnedDiagram, Classifer);
  }

  return null;
}

function HasSameAttribute(classifier, name, type, stereotype, visibility){
var attr;
  for (var i = 0 ; i < classifier.GetAttributeCount(); i ++ ){
    attr = classifier.GetAttributeAt(i);

    if( (attr.name == name) &&
        (attr.TypeExpression == type) &&
        (attr.Visibility == visibility) &&
        (attr.StereotypeName == stereotype))
      return true;
  }
  return false;
}

function HasSameOperation(classifier, name, stereotype, visibility, params){
var opt;
  for (var i =0 ; i < classifier.GetOperationCount() ; i ++ ){
    opt = classifier.GetOperationAt(i);
    if( (opt.name == name) &&
        (opt.Visibility == visibility) &&
        (opt.StereotypeName == stereotype))
      return true;
  }
  return false;
}

function HasSameParams(operation, params){
  return false;
}

function LoadProfile(ProfileName){
  var ExtMgr = app.ExtensionManager;
  if(ExtMgr.FindAvailableProfile(ProfileName) != null){
    ExtMgr.IncludeProfile(ProfileName);
    Msg("Add Profile" + ProfileName);
    return true;
  } else {
    return false;
  }
}

function ProfileLoaded(ProfileName) {
  var ExtMgr = app.ExtensionManager;
  if(ExtMgr.FindIncludedProfile(ProfileName) != null)
    return true
  else
    return false;
}

function Msg(msg){
  WshShell.Popup(msg, 5, "Information", 0 + 64);
}
