DefinitionBlock ("", "SSDT", 1, "DOTLEG", "FAKEBATT", 1) {
    External (\_SB.PCI0, DeviceObj)

    // Fake battery device at LPC bridge (1f.0)
    External (\_SB.PCI0.SF8, DeviceObj)
    Scope (\_SB.PCI0.SF8) {
        Device (BAT0) {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, 1)

            Method (_STA) {
                Return (0x0F)
            }
        }
    }
}
