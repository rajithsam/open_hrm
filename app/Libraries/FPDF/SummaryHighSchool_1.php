<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TabulationSheet
 *
 * @author Himel
 * 
 */
require_once APPPATH.'libraries/FPDF/FPDF.php';
class SummaryHighSchool extends FPDF{
    
    protected $angle;
    private $data;
    private $date;

    public function Rotate($angle, $x=-1, $y=-1) {

        if ($x == -1)
            $x = $this->x;
        if ($y == -1)
            $y = $this->y;
        if ($this->angle != 0)
            $this->_out('Q');
        $this->angle = $angle;
        if ($angle != 0) {
            $angle*=M_PI / 180;
            $c = cos($angle);
            $s = sin($angle);
            $cx = $x * $this->k;
            $cy = ($this->h - $y) * $this->k;

            $this->_out(sprintf('q %.5f %.5f %.5f %.5f %.2f %.2f cm 1 0 0 1 %.2f %.2f cm', $c, $s, -$s, $c, $cx, $cy, -$cx, -$cy));
        }
    }
    
    public function setHeaderContent($data) {
        $this->data = $data;
    }
    public function Header() {
       
        $this->SetFont('Arial',"b",15);
        $this->Cell(320,15,$this->data['school_info'][0]['school_name'],0,1,"C");
        $this->SetFontSize(10);
        $this->SetX((320-50)/1.9);
        $this->Cell(50,10,"Tabulation Sheet",1,1,"C");
        $this->Cell(10,2," ",0,1,"C");
        $this->Cell(25,10,"Session :",0,0,"R");
        $this->Cell(25,10,$this->data['classInfo']['session'],0,0,"L");
        $this->Cell(25,10,"Class :",0,0,"R");
        $this->Cell(25,10,ucfirst($this->data['classInfo']['class_name']),0,0,"L");
        $this->Cell(25,10,"Group :",0,0,"R");
        $this->Cell(25,10,ucfirst($this->data['classInfo']['group_name']),0,0,"L");
        
        $this->Cell(25,10,"Section :",0,0,"R");
        $this->Cell(25,10,ucfirst($this->data['classInfo']['section_name']),0,0,"L");
        $this->Cell(25,10,"Shift :",0,0,"R");
        $this->Cell(25,10,ucfirst($this->data['classInfo']['shift_name']),0,0,"L");
        $this->Cell(25,10,"Term :",0,0,"R");
        
        $this->Cell(25,10,ucfirst($this->data['classInfo']['term_name']),0,1,"L");
        $this->Cell(10,2," ",0,1,"C");
        $this->SetY(80);
        $this->Rotate(90);
        
        $this->Cell(30,7,"Roll No",1,0,"C");
        $this->Rotate(0);
        $this->SetXY(17,50);
        $this->Cell(30,30,"Name",1,0,"C");
        
        $subjectWidth = 24;
        $substract = 2;
        $totalX = 70;
        $termW=10;
        
        $cw = 6;$ch = 20; 
        $x = 57;$y = 60;
        $X = 57;$Y = 60;
        $nX = 0;$nx = 0;
        switch(strtolower($this->data['classInfo']['class_name']))
        {
            case 'three':
            case 'four':
                $subjectWidth = 28;$substract = -2;$totalX = 98;
                break;
            case 'five':
                $totalX = 38;
                break;
            case 'six':
                $termW=8;$cw = 4.45;$substract = -2;$X = 55; 
                break;
            case 'seven':
                $termW=8;$cw = 4.75;$substract = -2;$X = 55; 
                break;
            case 'eight':
            
                $termW=8;$cw = 5.15;$substract = -2;$X = 55; 
                break;
            case 'nine':
                $termW=8;$cw = 4.75;$substract = -2;$X = 55; 
                break;
            
            case 'ten':
                $substract = -6;
                $totalX = 153;
                break;
                
        }
        $this->Cell($termW,30,"Term",1,0,"C");
        $this->SetFontSize(8.5);
        $subjectWidthN = 0;
        foreach($this->data['subjects'] as $k=> $subject)
        {
            $subjectWidthN = (count($subject['mark_type']) * $cw) + (2*$cw);
            $this->Cell($subjectWidthN,10,str_replace(" ","\n",$subject['subject_name']),1,0,"C");  
        }
        $this->SetXY(57,60);
        
        
        if($this->data['classInfo']['class_name'] == "ten"){
            if($this->data['classInfo']['group_name'] != "science"){
                $totalX = 141;
                $startY = 80;
                $cw = 4.45;
                $this->SetXY($totalX+($subjectWidth*7),$startY);
                $this->Rotate(90);
                $this->Cell($subjectWidth-$substract,6+1,"Total",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw+1);
                $this->Cell($subjectWidth-$substract,6,"Pass/Fail",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell($subjectWidth-$substract,6,"In Sec",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell($subjectWidth-$substract,6,"In Class",1,1,"C");
            }else{
                $startY = 80;
                $this->SetXY($totalX+($subjectWidth*7),$startY);
                $this->Rotate(90);
                $this->Cell($subjectWidth-$substract,6+1,"Total",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw+1);
                $this->Cell($subjectWidth-$substract,6,"Pass/Fail",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell($subjectWidth-$substract,6,"In Sec",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell($subjectWidth-$substract,6,"In Class",1,1,"C");
            }
        }elseif(in_array($this->data['classInfo']['class_name'],array("six","seven"))){
                $totalX = 167.25;
                $startY = 80;
                $this->SetXY($totalX+($subjectWidth*7),$startY);
                $this->Rotate(90);
                $this->Cell(30,$cw,"Total",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"Pass/Fail",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Sec",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Class",1,1,"C");
        }
        elseif(in_array($this->data['classInfo']['class_name'],array("eight"))){
                $totalX = 160;
                $startY = 80;
                $this->SetXY($totalX+($subjectWidth*7),$startY);
                $this->Rotate(90);
                $this->Cell(30,$cw,"Total",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"Pass/Fail",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Sec",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Class",1,1,"C");
        }
        elseif(in_array($this->data['classInfo']['class_name'],array("nine"))){
                $totalX = 162.5;
                $startY = 80;
                $this->SetXY($totalX+($subjectWidth*7),$startY);
                $this->Rotate(90);
                $this->Cell(30,$cw+1,"Total",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw+1);
                $this->Cell(30,$cw,"Pass/Fail",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Sec",1,1,"C");
                $this->SetXY($totalX+($subjectWidth*7),$startY +=$cw);
                $this->Cell(30,$cw,"In Class",1,1,"C");
        }
            
//        $this->Rotate(0);
        
        $i=0;
        $this->SetXY(57,80);
        
            $incr = 6;
//            
//            echo $subjectWidthN;die();
            $startY=80;
            $initialX = 57;
        
            $this->Rotate(90);
            $chY=80;
foreach($this->data['subjects'] as $subject)
        {
    $subjectWidthN = (count($subject['mark_type']) * $incr) + (3*$incr);
//            foreach($subject['mark_type'] as $mark_type)
//            {
//                
//                $this->Cell(20,$incr,$mark_type,"L,T",1,"C");
//                $startY = $startY + $incr;
//                $this->SetXY($initialX,$startY);
//            }
              
              $this->Cell(20,$incr,'Subjective',"L,T",1,"C");
              $this->SetXY(57,$chY);
              $chY+=$subjectWidthN;
              
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->SetX(57);
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//              $this->Cell(20,$incr,'Objective',"L,T",1,"C");
//            die();
//            $startY = $startY + $incr;
//            $this->Cell(20,$incr,"T","L,T",1,"C");
//            $this->SetXY($initialX,$startY);
//            $startY = $startY + $incr;
//            $this->Cell(20,$incr,"G","L,T",1,"C");
            $startY=80;
            }
            $this->Rotate(0);
//            $this->SetXY($initialX+$subjectWidthN,$startY);
//            if($i == 0)
//                $this->mark_types($subject['mark_type'],0);
//            else
//                $this->mark_types($subject['mark_type'],$subjectWidth*$i);
            $i++;
        
        $this->SetY(80);
       
//        foreach($this->data['subjects'] as $k=> $subject)
//        { 
//            $subjectWidthN = (count($subject['mark_type']) * $cw) + (2*$cw);
//
//            $this->SetXY($X,$Y);
//            foreach($subject['mark_type'] as $j => $mt){
//                $mt = substr($mt,0,3);
//                $this->Cell($cw,$ch,$mt,"L,T,B",0,"C");
//            }
//            $this->Cell($cw,$ch,"T","L,T,B",0,"C");
//            $this->Cell($cw,$ch,"G","L,T,B",0,"C");
//            $X = $X+$subjectWidthN;
//        }
        
        $this->SetY(80);
        
    }
    
    public function mark_types($mark_types,$size)
    {
        $incr = 8;
        $startY=80;
        $this->SetXY(70+$size,$startY);
        $this->Rotate(90);
        $totalY = 96;
        $GradeY = 104;
        switch(strtolower($this->data['classInfo']['class_name']))
        {
            case 'three':
            case 'four':
                $incr = 7;
                $totalY = 94;
                $GradeY = 101;
                break;
        }
        
        
        foreach($mark_types as $mark_type)
        {
            $startY = $startY + $incr;
            $this->Cell(20,$incr,$mark_type,"L,T",1,"C");
            $this->SetXY(70+$size,$startY);
        }
        if(count($mark_type)==1)
         $this->Cell(20,$incr,"","L,T",1,"C");
       
        $this->SetXY(70+$size,$totalY);
        $this->Cell(20,$incr,"Total","L,T",1,"C");
        $this->SetXY(70+$size,$GradeY);
        $this->Cell(20,$incr,"Grade","L,T",1,"C");
        $this->Rotate(0);
    }
    public function Cell($w, $h=0, $txt='', $border=0, $ln=0, $align='', $fill=0, $link='') {
        //Output a cell
        $k = $this->k;
        if ($this->y + $h > $this->PageBreakTrigger and !$this->InFooter and $this->AcceptPageBreak()) {
            $x = $this->x;
            $ws = $this->ws;
            if ($ws > 0) {
                $this->ws = 0;
                $this->_out('0 Tw');
            }
            $this->AddPage($this->CurOrientation);
            $this->x = $x;
            if ($ws > 0) {
                $this->ws = $ws;
                $this->_out(sprintf('%.3f Tw', $ws * $k));
            }
        }
        if ($w == 0)
            $w = $this->w - $this->rMargin - $this->x;
        $s = '';
// begin change Cell function 12.08.2003
        if ($fill == 1 or $border > 0) {
            if ($fill == 1)
                $op = ($border > 0) ? 'B' : 'f';
            else
                $op='S';
            if ($border > 1) {
                $s = sprintf(' q %.2f w %.2f %.2f %.2f %.2f re %s Q ', $border, $this->x * $k, ($this->h - $this->y) * $k, $w * $k, -$h * $k, $op);
            }
            else
                $s=sprintf('%.2f %.2f %.2f %.2f re %s ', $this->x * $k, ($this->h - $this->y) * $k, $w * $k, -$h * $k, $op);
        }
        if (is_string($border)) {
            $x = $this->x;
            $y = $this->y;
            if (is_int(strpos($border, 'L')))
                $s.=sprintf('%.2f %.2f m %.2f %.2f l S ', $x * $k, ($this->h - $y) * $k, $x * $k, ($this->h - ($y + $h)) * $k);
            else if (is_int(strpos($border, 'l')))
                $s.=sprintf('q 2 w %.2f %.2f m %.2f %.2f l S Q ', $x * $k, ($this->h - $y) * $k, $x * $k, ($this->h - ($y + $h)) * $k);

            if (is_int(strpos($border, 'T')))
                $s.=sprintf('%.2f %.2f m %.2f %.2f l S ', $x * $k, ($this->h - $y) * $k, ($x + $w) * $k, ($this->h - $y) * $k);
            else if (is_int(strpos($border, 't')))
                $s.=sprintf('q 2 w %.2f %.2f m %.2f %.2f l S Q ', $x * $k, ($this->h - $y) * $k, ($x + $w) * $k, ($this->h - $y) * $k);

            if (is_int(strpos($border, 'R')))
                $s.=sprintf('%.2f %.2f m %.2f %.2f l S ', ($x + $w) * $k, ($this->h - $y) * $k, ($x + $w) * $k, ($this->h - ($y + $h)) * $k);
            else if (is_int(strpos($border, 'r')))
                $s.=sprintf('q 2 w %.2f %.2f m %.2f %.2f l S Q ', ($x + $w) * $k, ($this->h - $y) * $k, ($x + $w) * $k, ($this->h - ($y + $h)) * $k);

            if (is_int(strpos($border, 'B')))
                $s.=sprintf('%.2f %.2f m %.2f %.2f l S ', $x * $k, ($this->h - ($y + $h)) * $k, ($x + $w) * $k, ($this->h - ($y + $h)) * $k);
            else if (is_int(strpos($border, 'b')))
                $s.=sprintf('q 2 w %.2f %.2f m %.2f %.2f l S Q ', $x * $k, ($this->h - ($y + $h)) * $k, ($x + $w) * $k, ($this->h - ($y + $h)) * $k);
        }
        if (trim($txt) != '') {
            $cr = substr_count($txt, "\n");
            if ($cr > 0) { // Multi line
                $txts = explode("\n", $txt);
                $lines = count($txts);
                //$dy=($h-2*$this->cMargin)/$lines;
                for ($l = 0; $l < $lines; $l++) {
                    $txt = $txts[$l];
                    $w_txt = $this->GetStringWidth($txt);
                    if ($align == 'R')
                        $dx = $w - $w_txt - $this->cMargin;
                    elseif ($align == 'C')
                        $dx = ($w - $w_txt) / 2;
                    else
                        $dx=$this->cMargin;

                    $txt = str_replace(')', '\\)', str_replace('(', '\\(', str_replace('\\', '\\\\', $txt)));
                    if ($this->ColorFlag)
                        $s.='q ' . $this->TextColor . ' ';
                    $s.=sprintf('BT %.2f %.2f Td (%s) Tj ET ', ($this->x + $dx) * $k, ($this->h - ($this->y + .5 * $h + (.7 + $l - $lines / 2) * $this->FontSize)) * $k, $txt);
                    if ($this->underline)
                        $s.=' ' . $this->_dounderline($this->x + $dx, $this->y + .5 * $h + .3 * $this->FontSize, $txt);
                    if ($this->ColorFlag)
                        $s.='Q ';
                    if ($link)
                        $this->Link($this->x + $dx, $this->y + .5 * $h - .5 * $this->FontSize, $w_txt, $this->FontSize, $link);
                }
            }
            else { // Single line
                $w_txt = $this->GetStringWidth($txt);
                $Tz = 100;
                if ($w_txt > $w - 2 * $this->cMargin) { // Need compression
                    $Tz = ($w - 2 * $this->cMargin) / $w_txt * 100;
                    $w_txt = $w - 2 * $this->cMargin;
                }
                if ($align == 'R')
                    $dx = $w - $w_txt - $this->cMargin;
                elseif ($align == 'C')
                    $dx = ($w - $w_txt) / 2;
                else
                    $dx=$this->cMargin;
                $txt = str_replace(')', '\\)', str_replace('(', '\\(', str_replace('\\', '\\\\', $txt)));
                if ($this->ColorFlag)
                    $s.='q ' . $this->TextColor . ' ';
                $s.=sprintf('q BT %.2f %.2f Td %.2f Tz (%s) Tj ET Q ', ($this->x + $dx) * $k, ($this->h - ($this->y + .5 * $h + .3 * $this->FontSize)) * $k, $Tz, $txt);
                if ($this->underline)
                    $s.=' ' . $this->_dounderline($this->x + $dx, $this->y + .5 * $h + .3 * $this->FontSize, $txt);
                if ($this->ColorFlag)
                    $s.='Q ';
                if ($link)
                    $this->Link($this->x + $dx, $this->y + .5 * $h - .5 * $this->FontSize, $w_txt, $this->FontSize, $link);
            }
        }
// end change Cell function 12.08.2003
        if ($s)
            $this->_out($s);
        $this->lasth = $h;
        if ($ln > 0) {
            //Go to next line
            $this->y+=$h;
            if ($ln == 1)
                $this->x = $this->lMargin;
        }
        else
            $this->x+=$w;
    }
    

    
    
    public function sample() {

        $cw = 6;
        $ch = 20;
        $X = 57;
        $Y = 60;
        $nX = 0;
        $nx = 0;
        $i = 0;
        foreach ($this->data['subjects'] as $k => $subject) {
            $subjectWidthN = (count($subject['mark_type']) * $cw) + (2 * $cw);

            $this->SetXY($X, $Y);
            foreach ($subject['mark_type'] as $j => $mt) {
                $mt = substr($mt, 0, 3);
                $this->Cell($cw, $ch, $mt, "L,T,B", 0, "C");
            }
            $this->Cell($cw, $ch, "T", "L,T,B", 0, "C");
            $this->Cell($cw, $ch, "G", "L,T,B", 0, "C");
            $X = $X + $subjectWidthN;
        }
    }

    public function Footer() {
        // Position at 1.5 cm from bottom
        //$this->SetY(-50);
        // Arial italic 8
        $this->SetMargins(10,0);
         // Page number
        $this->Cell(0, 10, 'Page ' . $this->PageNo() . ' / {nb}', 0, 0, 'C');
    }
}

?>
