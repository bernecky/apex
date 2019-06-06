 dossa;phasepause;PFAT;tracessa;TargetLanguage
 Initialize
 phasepause←LC GetOption'phasepause'
 debugphase←LC GetOption'debugssa'
 tracessa←LC GetOption'tracessa'
 TargetLanguage←GetOption'output'
 PFAT←BuildPFAT TargetLanguage
 dossaOne¨⎕FNUMS
