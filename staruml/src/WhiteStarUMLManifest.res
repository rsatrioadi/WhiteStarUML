        ��  ��                  �      �� ��     0 	        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
<assemblyIdentity
	type="win32"
	name="WhiteStarUML"
	version="5.8.7.0"
	processorArchitecture="x86"/>

<asmv3:application>
	<asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
		<dpiAware>True/PM</dpiAware>
	</asmv3:windowsSettings>
</asmv3:application>

<dependency>
	<dependentAssembly>
	<assemblyIdentity
		type="win32"
		name="Microsoft.Windows.Common-Controls"
		version="6.0.0.0"
		publicKeyToken="6595b64144ccf1df"
		language="*"
		processorArchitecture="*"/>
	</dependentAssembly>
</dependency>

<file name="OptMgr.dll" hashalg="SHA1">
	<comClass clsid="{9890E665-379A-4DFD-A6B4-884A8D5AEAEF}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}"></comClass>
	<typelib tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" resourceid="1" version="1.0" helpdir="" flags="HASDISKIMAGE"></typelib>
</file>
<file name="Pgmr101.ocx" hashalg="SHA1">
	<comClass clsid="{11D80597-533C-11D4-B97E-004005F9CBA4}" tlbid="{11D80594-533C-11D4-B97E-004005F9CBA4}" description="ProGrammar 1.01 ActiveX Control"></comClass>
	<typelib tlbid="{11D80594-533C-11D4-B97E-004005F9CBA4}" resourceid="1" version="1.0" helpdir=""></typelib>
</file>

<trustInfo xmlns="urn:schemas-microsoft-com:asm.v3">
    <security>
	    <requestedPrivileges>
		    <requestedExecutionLevel
			    level="asInvoker"
			    uiAccess="false"/>
	    </requestedPrivileges>
	</security>
</trustInfo>

<compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1"> 
	<application> 
		<!--The ID below indicates app support for Windows Vista -->
		<supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}"/> 
		<!--The ID below indicates app support for Windows 7 -->
		<supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}"/>
		<!--The ID below indicates app support for Windows 8 -->
		<supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}"/>
		<!--The ID below indicates app support for Windows 8.1 -->
		<supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}"/>
		<!--The ID below indicates app support for Windows 10 -->
		<supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"/>
	</application>
</compatibility>

<comInterfaceExternalProxyStub name="IOptionItem" iid="{C8E6BA96-EE0F-463E-B9BC-776C15167809}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="IOptionClassification" iid="{A2FB7B59-01A9-4929-BC56-79A699A35E90}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="IOptionCategory" iid="{C6C2AE66-AEE8-43C0-AA77-081646262CF2}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="IOptionSchema" iid="{DA4FB79C-B8B5-4573-98E8-8CB2ECFA0406}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="IOptionManager" iid="{D041BEEF-82ED-4A66-843A-4D08339C228D}" tlbid="{84BEB7B3-6221-43ED-B410-E83A5D83CED9}" proxyStubClsid32="{00020424-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="_DPgmr" iid="{11D80595-533C-11D4-B97E-004005F9CBA4}" tlbid="{11D80594-533C-11D4-B97E-004005F9CBA4}" proxyStubClsid32="{00020420-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>
<comInterfaceExternalProxyStub name="_DPgmrEvents" iid="{11D80596-533C-11D4-B97E-004005F9CBA4}" tlbid="{11D80594-533C-11D4-B97E-004005F9CBA4}" proxyStubClsid32="{00020420-0000-0000-C000-000000000046}"></comInterfaceExternalProxyStub>

</assembly>
  