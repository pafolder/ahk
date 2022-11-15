; 221115
; Refactored. Working now on press CapsLock. Also CapsLock Tab added to switch layout.
; Timeot sent to -7000.
; Made a great changes to control all the keys by SetModifiers and ResetModifiers
; Now CapsLock fixes the modifier keys pressed. These keys are added to the next
; modifier keys pressed with the target (end) key.
; CapsLock turns on Fn keys instead of 1...0-=
; Ctrl CapsLock turns on Num keys instead of 1...0-+*/Enter
; Fn and Num modes will reset automatically in 10 seconds if haven't used
; Right Ctrl and left/right arrow keys let move over the words
; Left Ctrl and left/right arrow keys move to the begining/end of the line
; Right+Left Ctrl keys and left/right arrow keys move to the begining/end of the text
; Pressing CapsLocks for 3 times toggles CapsLock as it was by default

shift := 0
ctrl := 0
alt := 0
capslock := 0
capsLockPressCount := 0

ResetModifiers()

^WheelUp::SoundSet +5
 return

^WheelDown::SoundSet -5
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
*CapsLock::
    modifiersPressed := 0
    if (GetKeyState("Shift", "P")) {
    shift := 1
    modifiersPressed := 1
    }
    if (GetKeyState("Alt", "P")) {
    alt := 1
    modifiersPressed := 1
    }
    if (GetKeyState("Ctrl", "P")) {
    ctrl := 1
    modifiersPressed := 1
    }
    SetTimer TimerResetModifiers, -7000
    if (modifiersPressed == 1)
    return

	FunctionMode := 1
    SetCapsLockState, Off
    capsLockPressCount := capsLockPressCount + 1
    if (capsLockPressCount == 3) {
        capsLockPressCount := 0
		FunctionMode := 0
        if (capslock == 1)
            capslock := 0
        else
            capslock := 1
    }
	return
;****************************************************************

TimerResetModifiers:
	ResetModifiers()
	return

*1::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F1}
    else
            SendInput {Blind}{1}
    
    ResetModifiers()
    return

*2::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F2}
    else
            SendInput {Blind}{2}
    
    ResetModifiers()
    return

*3::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F3}
    else
            SendInput {Blind}{3}
    
    ResetModifiers()
    return

*4::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F4}
    else
            SendInput {Blind}{4}
    
    ResetModifiers()
    return

*5::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F5}
    else
            SendInput {Blind}{5}
    
    ResetModifiers()
    return

*6::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F6}
    else
            SendInput {Blind}{6}
    
    ResetModifiers()
    return

*7::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F7}
    else
            SendInput {Blind}{7}
    
    ResetModifiers()
    return

*8::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F8}
    else
            SendInput {Blind}{8}
    
    ResetModifiers()
    return

*9::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F9}
    else
            SendInput {Blind}{9}
    
    ResetModifiers()
    return

*0::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F10}
    else
            SendInput {Blind}{0}
    
    ResetModifiers()
    return

*-::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F11}
    else
            SendInput {Blind}{-}
    
    ResetModifiers()
    return

*=::
	SetModifiers()
    if (FunctionMode)
			SendInput {Blind}{F12}
    else
            SendInput {Blind}{=}

    ResetModifiers()
    return

*Delete::
	SetModifiers()
	if (FunctionMode)
			SendInput {Blind}{Insert}
	else
            SendInput {Blind}{Delete}
    ResetModifiers()
    return

*Tab::
	SetModifiers()
	if (FunctionMode)
			SendInput {Blind}{LWin Down}{Space}{LWin Up}
	else
            SendInput {Blind}{Tab}
    ResetModifiers()
    return

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
*q::
    SetModifiers()
    SendInput {Blind}{q}
    ResetModifiers()
    return
*w::
    SetModifiers()
    SendInput {Blind}{w}
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
	global alt
	global ctrl
	global shift
    global capslock
    global FunctionMode
    global capsLockPressCount
if (shift)
		SendInput {Blind}{Shift Down}
if (ctrl)
		SendInput {Blind}{Ctrl Down}
if (alt)
		SendInput {Blind}{Alt Down}

    if (capslock==0)
    SetCapsLockState, Off
    else
    SetCapsLockState, On
return
}

ResetModifiers() {
	global FunctionMode
    global capsLockPressCount
    global ctrl
	global alt
	global shift

if ((shift == 1) AND (NOT GetKeyState("Shift", "P")))
	SendInput {Blind}{Shift Up}
if ((ctrl == 1) AND (NOT GetKeyState("Ctrl", "P")))
	SendInput {Blind}{Ctrl Up}
if ((alt == 1) AND (NOT GetKeyState("Alt", "P")) )
	SendInput {Blind}{Alt Up}

	FunctionMode := 0
    capsLockPressCount := 0
    ctrl := 0
	alt := 0
	shift := 0
	
    SetCapsLockState, Off
	return
}