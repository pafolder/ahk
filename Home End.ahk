; 220824
; Made a great changes to control all the keys by SetModifiers and ResetModifiers
; Now CapsLock fixes the modifier keys pressed. These keys are added to the next
; modifier keys pressed with the target (end) key.
; CapsLock turns on Fn keys instead of 1...0-=
; Ctrl CapsLock turns on Num keys instead of 1...0-+*/Enter
; Fn and Num modes will reset automatically in 10 seconds if haven't used
; Right Ctrl and left/right arrow keys let move over the words
; Left Ctrl and left/right arrow keys move to the begining/end of the line
; Right+Left Ctrl keys and left/right arrow keys move to the begining/end of the text
; Alt+CapsLocks - toggles CapsLock as usual

shift := 0
ctrl := 0
alt := 0

ResetModifiers()
SetCapsLockState AlwaysOff

^WheelUp::SoundSet +5
^WheelDown::SoundSet -5

LAlt & CapsLock::
SetCapsLockState % !GetKeyState("CapsLock", "T")
return

~LCtrl & Left::		
	if (GetKeyState("RCtrl", "P") && GetKeyState("Shift", "P"))
	{
	SendInput ^+{home}
	return
	}
	if (GetKeyState("RCtrl", "P"))
	{
	SendInput ^{home}
	return
	}
	if (GetKeyState("Shift", "P"))
		SendInput +{home}
	else
		SendInput {home}
	return

~LCtrl & Right::		
	if (GetKeyState("RCtrl", "P") && GetKeyState("Shift", "P"))
	{
	SendInput ^+{end}
	return
	}
	if (GetKeyState("RCtrl", "P"))
	{
	SendInput ^{end}
	return
	}
	if (GetKeyState("Shift", "P"))
	SendInput +{end}
	else
	SendInput {end}
	return

;****************************************************************
CapsLock::
	FunctionMode := 1 
    SetTimer TimerResetModifiers, -10000
	SetCapsLockState, AlwaysOff
	return
;****************************************************************

TimerResetModifiers:
	ResetModifiers()
	return

*1::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F1}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num1}
			else {
                SetModifiers()
                SendInput {Blind}{1}
            }
                ResetModifiers()
                return
*2::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F2}
	}
	if (NumericMode)
			SendInput {Blind}{Num2}
			else {
                SetModifiers()
                SendInput {Blind}{2}
            }
                ResetModifiers()
                return

*3::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F3}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num3}
			else {
                SetModifiers()
                SendInput {Blind}{3}
            }
                ResetModifiers()
                return

*4::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F4}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num4}
			else {
                SetModifiers()
                SendInput {Blind}{4}
            }
                ResetModifiers()
                return

*5::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F5}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num5}
			else {
                SetModifiers()
                SendInput {Blind}{5}
            }
                ResetModifiers()
                return

*6::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F6}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num6}
			else {
                SetModifiers()
                SendInput {Blind}{6}
            }
                ResetModifiers()
                return

*7::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F7}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num7}
			else {
                SetModifiers()
                SendInput {Blind}{7}
            }
                ResetModifiers()
                return

*8::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F8}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num*}
			else {
                SetModifiers()
                SendInput {Blind}{8}
            }
                ResetModifiers()
                return

*9::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F9}
	}
	else
	if (NumericMode)
		 	SendInput {Blind}{Num9}
			else {
                SetModifiers()
                SendInput {Blind}{9}
            }
                ResetModifiers()
                return

*0::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F10}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num0}
			else {
                SetModifiers()
                SendInput {Blind}{0}
            }
                ResetModifiers()
                return
*-::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F11}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num-}
			else {
                SetModifiers()
                SendInput {Blind}{-}
            }
                ResetModifiers()
                return
*=::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{F12}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num=}
			else {
                SetModifiers()
                SendInput {Blind}{=}
            }
                ResetModifiers()
                return

*/::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{/}
	}
	else
	if (NumericMode)
			SendInput {Blind}{Num/}
			else {
                SetModifiers()
                SendInput {Blind}{/}
            }
                ResetModifiers()
                return

*Delete::
	if (FunctionMode) {
		SetModifiers()
			SendInput {Blind}{Insert}
	}		
			else {
                SetModifiers()
                SendInput {Blind}{Delete}
            }
                ResetModifiers()
                return

~*+CapsLock::
	shift := 1
	SetTimer TimerResetModifiers, -10000
	return

~*!CapsLock::
	alt := 1
	SetTimer TimerResetModifiers, -10000
	return

~*^CapsLock::
	ctrl := 1
	SetTimer TimerResetModifiers, -10000
	return

~*+!CapsLock::
	alt := 1
	shift := 1
	SetTimer TimerResetModifiers, -10000
	return

~*^!CapsLock::
	alt := 1
	ctrl := 1
	SetTimer TimerResetModifiers, -10000
	return

~*+^!CapsLock::
	alt := 1
	ctrl := 1
	shift := 1
	SetTimer TimerResetModifiers, -10000
	return

~*+^CapsLock::
	ctrl := 1
	shift := 1
	SetTimer TimerResetModifiers, -10000
	return


;as:=Getkeystate("Alt")
;ss:=Getkeystate("Shift")
;cs:=Getkeystate("Ctrl")
;MsgBox, Tab  as=%as%, ss=%ss%, cs=%cs%, FunctionMode=%FunctionMode%
;return


*Escape::
	 SetModifiers()
	 SendInput {Blind}{Escape}
	 ResetModifiers()
	 return
*Insert::
    SetModifiers()
    SendInput {Blind}{Insert}
    ResetModifiers()
    return
*Tab::
    SetModifiers()
    SendInput {Blind}{Tab}
    ResetModifiers()
    return
*q::
    SetModifiers()
    SendInput {Blind}{q}
    ResetModifiers()
    return
*e::
    SetModifiers()
    SendInput {Blind}{e}
    ResetModifiers()
    return
*r::
    SetModifiers()
    SendInput {Blind}{r}
    ResetModifiers()
    return
*t::
    SetModifiers()
    SendInput {Blind}{t}
    ResetModifiers()
    return
*y::
    SetModifiers()
    SendInput {Blind}{y}
    ResetModifiers()
    return
*u::
    SetModifiers()
    SendInput {Blind}{u}
    ResetModifiers()
    return
*i::
    SetModifiers()
    SendInput {Blind}{i}
    ResetModifiers()
    return
*o::
    SetModifiers()
    SendInput {Blind}{o}
    ResetModifiers()
    return
*p::
    SetModifiers()
    SendInput {Blind}{p}
    ResetModifiers()
    return
*SC01A:: ; [
    SetModifiers()
    SendInput {Blind}{SC01A}
    ResetModifiers()
    return
*SC01B:: ; ]
    SetModifiers()
    SendInput {Blind}{SC01B}
    ResetModifiers()
    return
*\::
    SetModifiers()
    SendInput {Blind}{\}
    ResetModifiers()
    return
*a::
    SetModifiers()
    SendInput {Blind}{a}
    ResetModifiers()
    return
*s::
    SetModifiers()
    SendInput {Blind}{s}
    ResetModifiers()
    return
*d::
    SetModifiers()
    SendInput {Blind}{d}
    ResetModifiers()
    return
*f::
    SetModifiers()
    SendInput {Blind}{f}
    ResetModifiers()
    return
*g::
    SetModifiers()
    SendInput {Blind}{g}
    ResetModifiers()
    return
*h::
    SetModifiers()
    SendInput {Blind}{h}
    ResetModifiers()
    return
*j::
    SetModifiers()
    SendInput {Blind}{j}
    ResetModifiers()
    return
*k::
    SetModifiers()
    SendInput {Blind}{k}
    ResetModifiers()
    return
*l::
    SetModifiers()
    SendInput {Blind}{l}
    ResetModifiers()
    return
*SC028:: ; '
    SetModifiers()
    SendInput {Blind}{SC028}
    ResetModifiers()
    return
*z::
    SetModifiers()
    SendInput {Blind}{z}
    ResetModifiers()
    return
*x::
    SetModifiers()
    SendInput {Blind}{x}
    ResetModifiers()
    return
*c::
    SetModifiers()
    SendInput {Blind}{c}
    ResetModifiers()
    return
*v::
    SetModifiers()
    SendInput {Blind}{v}
    ResetModifiers()
    return
*b::
    SetModifiers()
    SendInput {Blind}{b}
    ResetModifiers()
    return
*n::
    SetModifiers()
    SendInput {Blind}{n}
    ResetModifiers()
    return
*m::
    SetModifiers()
    SendInput {Blind}{m}
    ResetModifiers()
    return
*SC033::
    SetModifiers()
    SendInput {Blind}{SC033}
    ResetModifiers()
    return
*SC034::
    SetModifiers()
    SendInput {Blind}{SC034}
    ResetModifiers()
    return
*SC027::
    SetModifiers()
    SendInput {Blind}{SC027}
    ResetModifiers()
    return
*SC029:: ; `
    SetModifiers()
    SendInput {Blind}{SC029}
    ResetModifiers()
    return
*Space::
    SetModifiers()
    SendInput {Blind}{Space}
    ResetModifiers()
    return
~*Left::
    ResetModifiers()
    return
~*Right::
    ResetModifiers()
    return
~*Up::
    ResetModifiers()
    return
~*Down::
    ResetModifiers()
    return
~*PgUp::
    ResetModifiers()
    return
~*PgDn::
    ResetModifiers()
    return


SetModifiers() {
	global ctrl
	global alt
	global shift

if (shift) 
		SendInput {Blind}{Shift Down}
if (ctrl)
		SendInput {Blind}{Ctrl Down}
if (alt)
		SendInput {Blind}{Alt Down}

return
}

ResetModifiers() {
	global FunctionMode := 0
	global ctrl := 0
	global alt := 0
	global shift := 0
if(NOT GetKeyState("Shift","P"))	
	SendInput {Blind}{Shift Up}
if(NOT GetKeyState("Ctrl","P"))	
	SendInput {Blind}{Ctrl Up}
if(GetKeyState("Alt") AND (NOT GetKeyState("Alt","P")))
;if(NOT GetKeyState("Alt","P"))
	SendInput {Blind}{Alt Up}
	return
}
