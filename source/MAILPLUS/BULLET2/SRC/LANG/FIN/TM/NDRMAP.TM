Name "NonDelRcpt"

Entry
Att attMessageClass
Send IsHeader

Entry
Att attFrom
Label "Lähettäjä"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator

Entry
Att attTo
Label "Vastaanottaja"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator

Entry
Att attCc
Label "Kopio"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator

Entry
Att attSubject
Label "Aihe"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator

Entry
Att attDateSent
Label "Lähetyspäiväys"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator

Entry
Att attPriority
Label "Prioriteetti"
Print Save Send IsHeader LabelBefore NLAfter IncludeSeperator
	IVM
			1 "Suuri"
	Default 2 ""
			3 "Pieni"

Entry
Att attNDRBody
Label "Toimittamatta jäämisen syy"
Print Save Send LabelBefore NLAfter IncludeSeperator

Entry
Att attNDRFrom
Label "Alkuperäinen lähettäjä"
Send

Entry
Att attNDRTo
Label "Alkuperäinen vastaanottaja"
Send

Entry
Att attNDRSubject
Label "Alkuperäinen aihe"
Send

Entry
Att attNDRDateSent
Label "Alkuperäinen lähetysaika"
Send

Entry
Att attOriginalMessageClass
Label "Alkuperäinen viestityyppi"
Send

Entry
Att attBody
Label "Runko"
Send
