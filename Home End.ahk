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


shift := 0
ctrl := 0
alt := 0

ResetModifiers()
SetCapsLockState AlwaysOff

^WheelUp::SoundSet +5
^WheelDown::SoundSet -5


~LCtrl & Left::		
	if (GetKeyState("RCtrl") && GetKeyState("Shift"))
	{
	Send ^+{home}
	return
	}
	if (GetKeyState("RCtrl"))
	{
	Send ^{home}
	return
	}

	if (GetKeyState("Shift")) 
		Send +{home}
	else
		Send {home}
	return

~LCtrl & Right::		
	if (GetKeyState("RCtrl") && GetKeyState("Shift"))
	{
	Send ^+{end}
	return
	}
	if (GetKeyState("RCtrl"))
	{
	Send ^{end}
	return
	}
	if (GetKeyState("Shift"))
	Send +{end}
	else
	Send {end}
	return

;****************************************************************
CapsLock::
	FunctionMode := 1 
   SetTimer TimerToTurnFunctionModeOff, -10000
	SetCapsLockState, AlwaysOff
	return
;****************************************************************


TimerToTurnFunctionModeOff:
	ResetModifiers()
	return

~Escape::
	Send {Blind}{Escape}
	ResetModifiers()
	return

*1::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F1}
	}
	else
	if (NumericMode)
			Send {Blind}{Num1}
			else {
                SetModifiers()
                Send {Blind}{1}
                ResetModifiers()
                return
            }
*2::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F2}
	}
	if (NumericMode)
			Send {Blind}{Num2}
			else {
                SetModifiers()
                Send {Blind}{2}
                ResetModifiers()
                return
            }

*3::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F3}
	}
	else
	if (NumericMode)
			Send {Blind}{Num3}
			else {
                SetModifiers()
                Send {Blind}{3}
                ResetModifiers()
                return
            }

*4::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F4}
	}
	else
	if (NumericMode)
			Send {Blind}{Num4}
			else {
                SetModifiers()
                Send {Blind}{4}
                ResetModifiers()
                return
            }

*5::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F5}
	}
	else
	if (NumericMode)
			Send {Blind}{Num5}
			else {
                SetModifiers()
                Send {Blind}{5}
                ResetModifiers()
                return
            }

*6::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F6}
	}
	else
	if (NumericMode)
			Send {Blind}{Num6}
			else {
                SetModifiers()
                Send {Blind}{6}
                ResetModifiers()
                return
            }

*7::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F7}
	}
	else
	if (NumericMode)
			Send {Blind}{Num7}
			else {
                SetModifiers()
                Send {Blind}{7}
                ResetModifiers()
                return
            }

*8::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F8}
	}
	else
	if (NumericMode)
			Send {Blind}{Num*}
			else {
                SetModifiers()
                Send {Blind}{8}
                ResetModifiers()
                return
            }

*9::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F9}
	}
	else
	if (NumericMode)
		 	Send {Blind}{Num9}
			else {
                SetModifiers()
                Send {Blind}{9}
                ResetModifiers()
                return
            }

*0::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{F10}
	}
	else
	if (NumericMode)
			Send {Blind}{Num0}
			else {
                SetModifiers()
                Send {Blind}{0}
                ResetModifiers()
                return
            }

*/::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{/}
	}
	else
	if (NumericMode)
			Send {Blind}{Num/}
			else {
                SetModifiers()
                Send {Blind}{/}
                ResetModifiers()
                return
            }

*Delete::
	if (FunctionMode) {
		SetModifiers()
			Send {Blind}{Insert}
	}		
			else {
                SetModifiers()
                Send {Blind}{Delete}
                ResetModifiers()
                return
            }

~*+CapsLock::
	shift := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*!CapsLock::
	alt := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*^CapsLock::
	ctrl := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*+!CapsLock::
	alt := 1
	shift := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*^!CapsLock::
	alt := 1
	ctrl := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*+^!CapsLock::
	alt := 1
	ctrl := 1
	shift := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return

~*+^CapsLock::
	ctrl := 1
	shift := 1
	SetTimer TimerToTurnFunctionModeOff, -10000
	return


;as:=Getkeystate("Alt")
;ss:=Getkeystate("Shift")
;cs:=Getkeystate("Ctrl")
;MsgBox, Tab  as=%as%, ss=%ss%, cs=%cs%, FunctionMode=%FunctionMode%
;return



*Insert::
    SetModifiers()
    Send {Blind}{Insert}
    ResetModifiers()
    return
*Tab::
    SetModifiers()
    Send {Blind}{Tab}
    ResetModifiers()
    return
*q::
    SetModifiers()
    Send {Blind}q
    ResetModifiers()
    return
*w::
    SetModifiers()
    Send {Blind}w
    ResetModifiers()
    return
*e::
    SetModifiers()
    Send {Blind}e
    ResetModifiers()
    return
*r::
    SetModifiers()
    Send {Blind}r
    ResetModifiers()
    return
*t::
    SetModifiers()
    Send {Blind}t
    ResetModifiers()
    return
*y::
    SetModifiers()
    Send {Blind}y
    ResetModifiers()
    return
*u::
    SetModifiers()
    Send {Blind}u
    ResetModifiers()
    return
*i::
    SetModifiers()
    Send {Blind}i
    ResetModifiers()
    return
*o::
    SetModifiers()
    Send {Blind}o
    ResetModifiers()
    return
*p::
    SetModifiers()
    Send {Blind}p
    ResetModifiers()
    return
*[::
    SetModifiers()
    Send {Blind}[
    ResetModifiers()
    return
*]::
    SetModifiers()
    Send {Blind}]
    ResetModifiers()
    return
*\::
    SetModifiers()
    Send {Blind}\
    ResetModifiers()
    return
*a::
    SetModifiers()
    Send {Blind}a
    ResetModifiers()
    return
*s::
    SetModifiers()
    Send {Blind}s
    ResetModifiers()
    return
*d::
    SetModifiers()
    Send {Blind}d
    ResetModifiers()
    return
*f::
    SetModifiers()
    Send {Blind}f
    ResetModifiers()
    return
*g::
    SetModifiers()
    Send {Blind}g
    ResetModifiers()
    return
*h::
    SetModifiers()
    Send {Blind}h
    ResetModifiers()
    return
*j::
    SetModifiers()
    Send {Blind}j
    ResetModifiers()
    return
*k::
    SetModifiers()
    Send {Blind}k
    ResetModifiers()
    return
*l::
    SetModifiers()
    Send {Blind}l
    ResetModifiers()
    return
*'::
    SetModifiers()
    Send {Blind}'
    ResetModifiers()
    return
*z::
    SetModifiers()
    Send {Blind}z
    ResetModifiers()
    return
*x::
    SetModifiers()
    Send {Blind}x
    ResetModifiers()
    return
*c::
    SetModifiers()
    Send {Blind}c
    ResetModifiers()
    return
*v::
    SetModifiers()
    Send {Blind}v
    ResetModifiers()
    return
*b::
    SetModifiers()
    Send {Blind}b
    ResetModifiers()
    return
*n::
    SetModifiers()
    Send {Blind}n
    ResetModifiers()
    return
*m::
    SetModifiers()
    Send {Blind}m
    ResetModifiers()
    return
*,::
    SetModifiers()
    Send {Blind},
    ResetModifiers()
    return
*.::
    SetModifiers()
    Send {Blind}.
    ResetModifiers()
    return
*;::
    SetModifiers()
    Send {Blind};
    ResetModifiers()
    return
*`::
    SetModifiers()
    Send {Blind}`
    ResetModifiers()
    return
*Space::
    SetModifiers()
    Send {Blind}{Space}
    ResetModifiers()
    return
*Left::
    SetModifiers()
    Send {Blind}{Left}
    ResetModifiers()
    return
*Right::
    SetModifiers()
    Send {Blind}{Right}
    ResetModifiers()
    return
*Up::
    SetModifiers()
    Send {Blind}{Up}
    ResetModifiers()
    return
*Down::
    SetModifiers()
    Send {Blind}{Down}
    ResetModifiers()
    return
*PgUp::
    SetModifiers()
    Send {Blind}{PgUp}
    ResetModifiers()
    return
*PgDn::
    SetModifiers()
    Send {Blind}{PgDn}
    ResetModifiers()
    return


SetModifiers() {
	global ctrl
	global alt
	global shift

if (shift) 
		Send {Blind}{Shift Down}
if (ctrl) 
		Send {Blind}{Ctrl Down}
if (alt) {
;SoundBeep 500, 60
		Send {Blind}{Alt Up}
		Send {Blind}{Alt Down}
}
return
}

ResetModifiers() {
;SoundBeep 500, 60
	global FunctionMode := 0
	global ctrl := 0
	global alt := 0
	global shift := 0
if(NOT GetKeyState("Shift","P"))	
	Send {Blind}{Shift Up}
if(NOT GetKeyState("Ctrl","P"))	
	Send {Blind}{Ctrl Up}
if(GetKeyState("Alt") AND (NOT GetKeyState("Alt","P")))
	Send {Blind}{Alt Up}
	return
}

;

