; Map Meta + Control + H to Meta + Left Arrow with a delay and Escape
^#h::
Send, {LWin Down}{Left}
Sleep, 30
Send, {Esc}
return

; Map Meta + Control + J to Meta + Down Arrow with a delay and Escape
^#j::
Send, {LWin Down}{Down}
Sleep, 30
Send, {Esc}
return

; Map Meta + Control + K to Meta + Up Arrow with a delay and Escape
^#k::
Send, {LWin Down}{Up}
Sleep, 30
Send, {Esc}
return

; Map Meta + Control + L to Meta + Right Arrow with a delay and Escape
^#l::
Send, {LWin Down}{Right}
Sleep, 30
Send, {Esc}
return

; Map Meta + Control + Enter to Meta + Up Arrow with a delay and Escape
^#Enter::
Send, {LWin Down}{Up}
Sleep, 31
Send, {Esc}
return

; Map Meta + W to Alt + F4 (close window)
#W::Send, !{F4}

;F10
^F10::
	SendInput, {F10}
	Return

$F10::Send {Volume_Mute}

;F11 Fullscreen
^F11::
	SendInput, {F11}
	Return

$F11::Send {Volume_Down 5}

;F12
^F12::
	SendInput, {F12}
	Return

$F12::Send {Volume_Up 5}

; need to use ahkv1 since in v2 for some reason cannot map both alt+ctrl/backspace without 
; both of them doing the same thing, also did not know how to exclude wezterm.
; Additional mappings if path is not "C:\Program Files\WezTerm"
; Assuming this is a condition you handle manually before running the script
#IfWinNotActive ahk_class org.wezfurlong.wezterm

; Alt + Backspace becomes Control + Backspace
!Backspace::Send, ^{Backspace}
;!BS::Send, ^+{Left}{Backspace} does not work with hebrew/arabic lan


; Alt + Left Arrow becomes Control + Left Arrow
!Left::Send, ^{Left}

; Alt + Right Arrow becomes Control + Right Arrow
!Right::Send, ^{Right}

; Control + Backspace becomes Shift + Home + Backspace (delete until beginning of line)
^Backspace::
Send, +{Home}{Backspace}
return

#IfWinActive ahk_class org.wezfurlong.wezterm
#N::  ; Windows+N
Run, %ComSpec% /c start "" "C:\Program Files\WezTerm\wezterm-gui.exe",
return



return

; ^q::
; Send, This is RamyT
; return