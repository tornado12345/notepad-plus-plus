; this file is part of installer for Notepad++
; Copyright (C)2016 Don HO <don.h@free.fr>
;
; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either
; version 2 of the License, or (at your option) any later version.
;
; Note that the GPL places important restrictions on "derived works", yet
; it does not provide a detailed definition of that term.  To avoid      
; misunderstandings, we consider an application to constitute a          
; "derivative work" for the purpose of this license if it does any of the
; following:                                                             
; 1. Integrates source code from Notepad++.
; 2. Integrates/includes/aggregates Notepad++ into a proprietary executable
;    installer, such as those produced by InstallShield.
; 3. Links to a library or executes a program that does any of the above.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


SectionGroup "Plugins" Plugins
	SetOverwrite on
!ifndef ARCH64
	${MementoSection} "NppExport" NppExport
		Delete "$INSTDIR\plugins\NppExport.dll"
		Delete "$INSTDIR\plugins\NppExport\NppExport.dll"
		SetOutPath "$INSTDIR\plugins\NppExport"
		File "..\bin\plugins\NppExport\NppExport.dll"
	${MementoSectionEnd}

!endif

	${MementoSection} "Mime Tools" MimeTools
		Delete "$INSTDIR\plugins\mimeTools.dll"
		Delete "$INSTDIR\plugins\mimeTools\mimeTools.dll"
		SetOutPath "$INSTDIR\plugins\mimeTools"
!ifdef ARCH64
		File "..\bin64\plugins\mimeTools\mimeTools.dll"
!else
		File "..\bin\plugins\mimeTools\mimeTools.dll"
!endif
	${MementoSectionEnd}
	
	${MementoSection} "Converter" Converter
		Delete "$INSTDIR\plugins\NppConverter.dll"
		Delete "$INSTDIR\plugins\NppConverter\NppConverter.dll"
		SetOutPath "$INSTDIR\plugins\NppConverter"
!ifdef ARCH64
		File "..\bin64\plugins\NppConverter\NppConverter.dll"
!else
		File "..\bin\plugins\NppConverter\NppConverter.dll"
!endif
	${MementoSectionEnd}

	${MementoSection} "Decent Spell-Checking" DSpellCheck
        Call setPathAndOptions
        
		Delete "$INSTDIR\plugins\DSpellCheck.dll"
		Delete "$INSTDIR\plugins\DSpellCheck\DSpellCheck.dll"
		SetOutPath "$INSTDIR\plugins\DSpellCheck"
!ifdef ARCH64
		File "..\bin64\plugins\DSpellCheck\DSpellCheck.dll"
		SetOutPath "$INSTDIR\plugins\Config\Hunspell"
		File "..\bin64\plugins\Config\Hunspell\en_US.aff"
		File "..\bin64\plugins\Config\Hunspell\en_US.dic"
!else
		File "..\bin\plugins\DSpellCheck\DSpellCheck.dll"
		SetOutPath "$INSTDIR\plugins\Config\Hunspell"
		File "..\bin\plugins\Config\Hunspell\en_US.aff"
		File "..\bin\plugins\Config\Hunspell\en_US.dic"
!endif
        SetOverwrite off
        SetOutPath "$UPDATE_PATH\plugins\Config"
        File "..\bin\plugins\Config\DSpellCheckDefaultDisabled\DSpellCheck.ini"
	${MementoSectionEnd}

SectionGroupEnd

${MementoSection} "Auto-Updater" AutoUpdater
	SetOverwrite on
	SetOutPath "$INSTDIR\updater"
!ifdef ARCH64
	File "..\bin64\updater\GUP.exe"
	File "..\bin64\updater\libcurl.dll"
	File "..\bin64\updater\gup.xml"
	File "..\bin64\updater\LICENSE"
	File "..\bin64\updater\README.md"
!else
	File "..\bin\updater\GUP.exe"
	File "..\bin\updater\libcurl.dll"
	File "..\bin\updater\gup.xml"
	File "..\bin\updater\LICENSE"
	File "..\bin\updater\README.md"
!endif
${MementoSectionEnd}

;Uninstall section
SectionGroup un.Plugins
	Section un.NppExport
		Delete "$INSTDIR\plugins\NppExport.dll"
		Delete "$INSTDIR\plugins\NppExport\NppExport.dll"
	SectionEnd
	
	Section un.Converter
		Delete "$INSTDIR\plugins\NppConverter.dll"
		Delete "$INSTDIR\plugins\NppConverter\NppConverter.dll"
	SectionEnd
	
	Section un.MimeTools
		Delete "$INSTDIR\plugins\mimeTools.dll"
		Delete "$INSTDIR\plugins\mimeTools\mimeTools.dll"
	SectionEnd

	Section un.PluginManager
		Delete "$INSTDIR\plugins\PluginManager.dll"
		Delete "$UPDATE_PATH\plugins\Config\PluginManager.ini"
		Delete "$INSTDIR\updater\gpup.exe"
		RMDir "$INSTDIR\updater\"
	SectionEnd
	
 	Section un.DSpellCheck
		Delete "$INSTDIR\plugins\DSpellCheck.dll"
		Delete "$INSTDIR\plugins\DSpellCheck\DSpellCheck.dll"
		Delete "$UPDATE_PATH\plugins\Config\DSpellCheck.ini"
		Delete "$INSTDIR\plugins\Config\Hunspell\en_US.aff"
		Delete "$INSTDIR\plugins\Config\Hunspell\en_US.dic"
		RMDir /r "$INSTDIR\plugins\Config"			; Remove Config folder recursively only if empty
	SectionEnd

SectionGroupEnd

Section un.AutoUpdater
	Delete "$INSTDIR\updater\GUP.exe"
	Delete "$INSTDIR\updater\libcurl.dll"
	Delete "$INSTDIR\updater\gup.xml"
	Delete "$INSTDIR\updater\License.txt"
	Delete "$INSTDIR\updater\LICENSE"
	Delete "$INSTDIR\updater\gpl.txt"
	Delete "$INSTDIR\updater\readme.txt"
	Delete "$INSTDIR\updater\README.md"
	Delete "$INSTDIR\updater\getDownLoadUrl.php"
	RMDir "$INSTDIR\updater\"
SectionEnd 
