Alias: FinnishLocation = https://hl7.fi/fhir/finnish-base-profiles/StructureDefinition/fi-base-location

Profile: AssiLocation
Parent: FinnishLocation
Id: assi-location
Title: "Assi Location profile"
Description: "Tilatietojen profiili Assi sairaalan tarpeisiin."
* status 1..1 MS
* extension contains ResponsibleUnit named responsibleUnit 0..*
* managingOrganization ^short = "Kuvaa ylätason organisaatiota kuten Kanta-Hämeen hyvinvointialue"
* type 0..1
* type.coding.code from LocationTypeVS (preferred)
