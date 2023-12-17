; =========================================================

; Remap capslock button as a middle mouse button. Very useful in Maya if you
; prefer to work with a stylus over a mouse, but don't enjoy the ergonomics of
; using one of your pen's buttons as a middle mouse button (the middle mouse
; button is used in Maya constantly). Comes with a 'disable' command in case
; this interferes with some programs (capslock sometimes used as a binding in
; games).

; =========================================================

CapsLockToMMB()
CapsLockToMMB() {

    Hotkey, *CapsLock,      OTHER_CapslockToMMBDown
    Hotkey, *CapsLock up,   OTHER_CapslockToMMBUp
    Return

    OTHER_CapslockToMMBDown:
        SetMouseDelay -1                ; If the destination key is a mouse button, SetMouseDelay is used instead
        if not GetKeyState("MButton")   ; The first hotkey above is replaced by the following, which prevents the keyboard's auto-repeat feature from generating repeated mouse clicks
            Send {Blind}{MButton DownR} ; DownR is like Down except that other Send commands in the script won't assume "b" should stay down during their Send
    Return

    OTHER_CapslockToMMBUp:
        SetMouseDelay -1                ; See note below for why press-duration is not specified with either of these SetKeyDelays
        Send {Blind}{MButton up}
    Return

}
