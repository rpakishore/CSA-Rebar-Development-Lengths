#NoEnv
Menu, Tray, Icon, imageres.dll, 119
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force


Gui, Destroy
Gui,Add,Tab3,x0 y0 w400 h525,Hooked|Compression|Tension|About

;Hooked Anchorages GUI
Gui,Tab,1
Gui,Add,Text,x20 y43 w21 h21,f'c
Gui,Add,Edit,x50 y40 w27 h21 vh_fc,25
Gui,Add,Text,x80 y43 w21 h13,MPa

Gui,Add,Text,x20 y73 w21 h21,Fy
Gui,Add,Edit,x50 y70 w27 h21 vh_fy,400
Gui,Add,Text,x80 y73 w21 h13,MPa

Gui,Add,Checkbox,x220 y43 w200 h13 vh_side Checked0,Side cover < 60mm
Gui,Add,Checkbox,x220 y63 w200 h13 vh_tail Checked1,Tail cover > 50mm
Gui,Add,Checkbox,x220 y83 w200 h13 vh_stirrup Checked1,Atleast 3 stirrups or ties
Gui,Add,Checkbox,x220 y103 w200 h13 vh_epoxy Checked0,Epoxy Coated Bars
Gui,Add,Checkbox,x220 y123 w200 h13 vh_normal Checked1,Normal Density Concrete

Gui,Add,Text,x20 y104 w21 h13,Bar
Gui, Add, DropDownList, x50 y100 vh_bar, 10M|15M||20M|25M|30M|35M

Gui, Add, Radio,x50 y130 Group vh_degree1, 180 degree
Gui, Add, Radio,x130 y130 vh_degree2 Checked, 90 degree

Gui,Add,Button,x130 y150 w100 h25 gh,Apply

Gui,Add,Text,x10 y180 w280 h150 vh_result,Result


;Compression Development Length GUI
 Gui, Tab, 2
Gui,Add,Text,x20 y43 w21 h21,f'c
Gui,Add,Edit,x50 y40 w27 h21 vc_fc,25
Gui,Add,Text,x80 y43 w21 h13,MPa

Gui,Add,Text,x20 y73 w21 h21,Fy
Gui,Add,Edit,x50 y70 w27 h21 vc_fy,400
Gui,Add,Text,x80 y73 w21 h13,MPa

Gui,Add,Text,x20 y104 w21 h13,Bar
Gui, Add, DropDownList, x50 y100 vc_bar, 10M|15M||20M|25M|30M|35M

Gui,Add,Button,x130 y150 w100 h25 gc,Apply

Gui,Add,Text,x10 y180 w350 h150 vc_result,Result

;Tension Development Length GUI
 Gui, Tab, 3
Gui,Add,Text,x20 y43 w21 h21,f'c
Gui,Add,Edit,x50 y40 w27 h21 vt_fc,25
Gui,Add,Text,x80 y43 w21 h13,MPa

Gui,Add,Text,x20 y73 w21 h21,Fy
Gui,Add,Edit,x50 y70 w27 h21 vt_fy,400
Gui,Add,Text,x80 y73 w21 h13,MPa

Gui,Add,Text,x20 y104 w21 h13,Bar
Gui, Add, DropDownList, x50 y100 vt_bar, 10M|15M||20M|25M|30M|35M

Gui,Add,GroupBox,x220 y43 w172 h70,Bar Location
Gui,Add,Checkbox,x240 y63 w150 h30 vt_top Checked0,Top rebars w/ 300mm fresh`nconcrete below it

Gui,Add,GroupBox,x20 y130 w250 h90,Coating
Gui,Add,Radio,x40 y145 w225 h30 Group vt_coating1,Epoxy coated bars or wires (cover < 3db,`nclear spacing< 6db)
Gui,Add,Radio,x40 y177 w200 h13 vt_coating2 ,All other epoxy coated bars or wires
Gui,Add,Radio,x40 y197 w50 h13 vt_coating3 Checked,Others

Gui,Add,GroupBox,x280 y130 w100 h90,Concrete Density
Gui,Add,Radio,x300 y150 w75 h13 Group vt_concrete1 Checked,Normal
Gui,Add,Radio,x300 y170 w75 h13 vt_concrete2 ,Semi-low
Gui,Add,Radio,x300 y190 w75 h13 vt_concrete3,Low

Gui,Add,GroupBox,x20 y230 w285 h90,Case
Gui,Add,Radio,x40 y250 w250 h13 Group vt_case1,Member containing min. stirrups or ties within Ld
Gui,Add,Radio,x40 y270 w260 h13 vt_case2 ,Slabs, walls, shells, folded plate (bar spacing > 2db)
Gui,Add,Radio,x40 y290 w50 h13 vt_case3 Checked,Others

Gui,Add,Button,x130 y340 w100 h25 gt,Apply

Gui,Add,Text,x10 y370 w350 h150 vt_result,Result

;About Section
Gui, Tab, 4

Gui,Add,Text,x20 y40 w200 h13,Arun Kishore
Gui,Add,Text,x20 y60 w200 h13,Structural EIT
Gui,Add,Text,x20 y80 w200 h13,https://github.com/rpakishore/CSA-Rebar-Development-Lengths
Gui,Add,Text,x20 y100 w200 h13,rpakishore@gmail.com
Gui,Add,Text,x20 y120 w200 h13,Based on: CSA A23.3-14; Cl.12
Gui,Add,Text,x20 y140 w200 h13,version:1.0

Gui,Show,w400 ,Development Length
return
h:
    Gui, Submit, NoHide
    
    Outputtext := ""

    if (h_normal = 1) {
        k1 := 1
        Outputtext := Outputtext . "`n  k1 = 1.0 `t(Normal Density Concrete)"
    } else
    {
        k1 := 1.3
        Outputtext := Outputtext . "`n  k1 = 1.3 `t(Low Density Concrete)"
    }

    if (h_epoxy = 1) {
        k2 := 1.2
        Outputtext := Outputtext . "`n  k2 = 1.0 `t(Epoxy coated reinforcing)"
    } else
    {
        k2 := 1
        Outputtext := Outputtext . "`n  k2 = 1.3 `t(Non-epoxy coated reinforcing)"
    }

    k3 := Round(h_fy/400, 1)
    Outputtext := Outputtext . "`n  k3 = " . k3 . " `t(Fy/400MPa)"
    
    if (h_side = 0){
        k4 := 0.7
        k4_result := "`n  k4 = 0.7 `t(Side cover >= 60mm)"

        if (h_degree2 = 1){
            if (h_tail <> 1){
                k4 := 1
                k4_result := "`n  k4 = 1.0 `t(tail cover < 50mm for 90 deg hook)"
            }
        }

        Outputtext := Outputtext . k4_result

    } else {
        k4 := 0.7
        Outputtext := Outputtext . "`n  k4 = 1.0 `t(Side cover < 60mm)"
    }

    if (h_stirrup = 1){
        k5 := 0.8
        Outputtext := Outputtext . "`n  k5 = 0.8 `t(Enclosed by stirrup)"
    } else
    {
        k5 := 1
        Outputtext := Outputtext . "`n  k5 = 1.0 `t(Not Enclosed by stirrup)"
    }


    if (h_bar = "10M"){
        db := 11.3
        bar_output := "db = " . db . " mm `t(10M bar | 11.3mm dia)"
    } else if (h_bar = "15M"){
        db := 16
        bar_output := "db = " . db . " mm `t(15M bar | 16mm dia)"
    } else if (h_bar = "20M"){
        db := 19.5
        bar_output := "db = " . db . " mm `t(20M bar | 19.5mm dia)"
    } else if (h_bar = "25M"){
        db := 25.2
        bar_output := "db = " . db . " mm `t(25M bar | 25.2mm dia)"
    } else if (h_bar = "30M"){
        db := 29.9
        bar_output := "db = " . db . " mm `t(30M bar | 29.9mm dia)"
    } else if (h_bar = "35M"){
        db := 35.7
        bar_output := "db = " . db . " mm `t(35M bar | 35.7mm dia)"
    }
    Outputtext := Outputtext . "`n  " . bar_output

    Lhb1 := 100 * db * k1 * k2 * k3 * k4 * k5 / Sqrt(h_fc)
    Outputtext := Outputtext . "`n  Lhb1 = " . Round(Lhb1) . " `tk1 *k2 *k3 *k4 *k5 *100db/sqrt(fc)"

    Lhb := Round(Max(Lhb1, 150, 8*db))
    Outputtext := Outputtext . "`n  Lhb = " . Round(Lhb) . " `tMax(Lhb1, 150mm, 8*db)"
    
    Outputtext := "Result:`n`t`tLhb = " . Lhb . " mm`n" . Outputtext
    ;MsgBox, , Test, %Outputtext%, 
    GuiControl,, h_result, %Outputtext%

return

c:
    Gui, Submit, NoHide
    
    Outputtext := ""
    if (c_bar = "10M"){
        db := 11.3
        bar_output := "db = " . db . " mm `t`t(10M bar | 11.3mm dia)"
    } else if (c_bar = "15M"){
        db := 16
        bar_output := "db = " . db . " mm `t`t(15M bar | 16mm dia)"
    } else if (c_bar = "20M"){
        db := 19.5
        bar_output := "db = " . db . " mm `t`t(20M bar | 19.5mm dia)"
    } else if (c_bar = "25M"){
        db := 25.2
        bar_output := "db = " . db . " mm `t`t(25M bar | 25.2mm dia)"
    } else if (c_bar = "30M"){
        db := 29.9
        bar_output := "db = " . db . " mm `t`t(30M bar | 29.9mm dia)"
    } else if (c_bar = "35M"){
        db := 35.7
        bar_output := "db = " . db . " mm `t`t(35M bar | 35.7mm dia)"
    }
    Outputtext := Outputtext . "`n  " . bar_output

    Ldb1 := Round(0.24 * db * c_fy / Sqrt(c_fc),1)
    Outputtext := Outputtext . "`n  Ldb1 = " . Ldb1 . " mm `t(Cl. 12.3.2 | 0.24 *db *fy /sqrt(f'c))"

    Ldb := Round(Min(Ldb1, 0.044*db*c_fy))
    Outputtext := Outputtext . "`n  Ldb = " . Ldb . " mm `t`t(Min(Ldb1, 0.044 *db *fy))"

    Ld := Max(200, Ldb)
    Outputtext := Outputtext . "`n  Ld = " . Ld . " mm `t`t(Max(Ldb, 200mm))"

    Outputtext := "Result:`n`t`tLd = " . Ld . " mm`n" . Outputtext
    ;MsgBox, , Test, %Outputtext%, 
    GuiControl,, c_result, %Outputtext%
return

t:
    Gui, Submit, NoHide
    
    Outputtext := ""
    if (t_bar = "10M"){
        db := 11.3
        bar_output := "db = " . db . " mm `t(10M bar | 11.3mm dia)"
    } else if (t_bar = "15M"){
        db := 16
        bar_output := "db = " . db . " mm `t(15M bar | 16mm dia)"
    } else if (t_bar = "20M"){
        db := 19.5
        bar_output := "db = " . db . " mm `t(20M bar | 19.5mm dia)"
    } else if (t_bar = "25M"){
        db := 25.2
        bar_output := "db = " . db . " mm `t(25M bar | 25.2mm dia)"
    } else if (t_bar = "30M"){
        db := 29.9
        bar_output := "db = " . db . " mm `t(30M bar | 29.9mm dia)"
    } else if (t_bar = "35M"){
        db := 35.7
        bar_output := "db = " . db . " mm `t(35M bar | 35.7mm dia)"
    }
    Outputtext := Outputtext . "`n  " . bar_output

    if (t_top = 1) {
        k1 := 1.3
        Outputtext := Outputtext . "`n  k1 = 1.3 `t(Horiz. rebar w/ more than 300mm fresh concrete below)"
    } else {
        k1 := 1.0
        Outputtext := Outputtext . "`n  k1 = 1.0 `t(Rebar w/ NO more than 300mm fresh concrete below)"
    }

    if (t_coating1 = 1) {
        k2 := 1.5
        Outputtext := Outputtext . "`n  k2 = 1.5 `t(Epoxy rebar with cover <3db or clear spacing <6d)"
    } else if (t_coating2 = 1) {
        k2 := 1.2
        Outputtext := Outputtext . "`n  k2 = 1.2 `t(Epoxy rebar W/O cover <3db or clear spacing <6d)"
    } else {
        k2 := 1.0
        Outputtext := Outputtext . "`n  k2 = 1.0 `t(Uncoated reinforcing)"
    }

    if (k1 * k2 > 1.7){
        k1 := 1.0
        k2 := 1.7
        Outputtext := Outputtext . "`n  `tSince k1 *k2 > 1.7; Use k1*k2 = 1.7 | Cl. 12.2.4"
    }

    if (t_concrete3 = 1) {
        k3 := 1.3
        Outputtext := Outputtext . "`n  k3 = 1.3 `t(Low density concrete)"
    } else if (t_concrete2 = 1) {
        k3 := 1.2
        Outputtext := Outputtext . "`n  k3 = 1.2 `t(Semi-low density concrete)"
    } else {
        k3 := 1.0
        Outputtext := Outputtext . "`n  k3 = 1.0 `t(Normal density concrete)"
    }
    

    if (db < 20){
        k4 := 0.8
        Outputtext := Outputtext . "`n  k4 = 0.8 `t(db < 20mm)"
    } else {
        k4 := 1.0
        Outputtext := Outputtext . "`n  k4 = 1.0 `t(db > 20mm)"
    }

    if (t_case1 = 1) {
        k5 := 0.45
        Outputtext := Outputtext . "`n  k5 = 0.45 `t(member containing min. stirrups or ties within Ld)"
    } else if (t_case2 = 1) {
        k5 := 0.45
        Outputtext := Outputtext . "`n  k5 = 0.45 `t(slabs,walls,shells, folded plate(bar spacing >2db))"
    } else {
        k5 := 0.6
        Outputtext := Outputtext . "`n  k5 = 0.6 `t(slabs,walls,shells, folded plate(bar spacing <2db))"
    }

    Ld := Round(k1 * k2 * k3 * k4 * k5 * db * t_fy / Sqrt(t_fc),1)
    Outputtext := Outputtext . "`n  Ld = " . Ld . " mm `t(Cl. 12.2.2 | k1 *k2 *k3 *k4 *k5 *db *fy /sqrt(f'c))"


    Outputtext := "Result:`n`t`tLd = " . Ld . " mm`n" . Outputtext

    ;MsgBox, , Test, %Outputtext%, 
    GuiControl,, t_result, %Outputtext%
return

GuiClose:
   GuiEscape:
   Gui, Destroy
   ExitApp 
return
