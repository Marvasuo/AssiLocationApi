Extension: ResponsibleUnit
Id: responsible-unit
Title: "Responsible Unit"
Description: "A unit or department responsible for the location"
* extension contains
    unit 1..1 and
    costCenter 0..1
* extension[unit].value[x] only Reference(Organization)
* extension[unit] ^short = "Yksikkö tai osasto"
* extension[costCenter].value[x] only string
* extension[costCenter] ^short = "Kustannuspaikkakoodi"
