[top]
components : Vegetable

[Vegetable]
type : cell
dim : (10, 10,6)
delay : transport
defaultDelayTime  : 1000
border : wrapped 

neighbors : Vegetable(-1,1,0) Vegetable(0,1,0) Vegetable(1,1,0) Vegetable(-1,0,0) Vegetable(0,0,0)  Vegetable(1,0,0) Vegetable(-1,-1,0) Vegetable(0,-1,0) Vegetable(1,-1,0) Vegetable(0,0,-1) Vegetable(0,0,-2) Vegetable(0,0,-3) Vegetable(0,0,-4) Vegetable(0,0,-5) Vegetable(-1,1,5) Vegetable(0,1,5) Vegetable(1,1,5) Vegetable(-1,0,5) Vegetable(1,0,5) Vegetable(-1,-1,5) Vegetable(0,-1,5) Vegetable(1,-1,5) Vegetable(0,0,1) Vegetable(0,0,2) Vegetable(0,0,3) Vegetable(0,0,4) Vegetable(0,0,5)


initialvalue : 0
initialCellsValue : vegetable.val

localtransition : update_rule


zone : adjustNitr { (9,0,2)..(9,9,2) }
zone : adjustPota { (9,0,3)..(9,9,3) }
zone : adjustWate { (9,0,1)..(9,9,1) }
zone : adjustSun { (9,0,4)..(9,9,4) }

zone : update_Nitr { (0,0,2)..(8,9,2) }
zone : update_Pota { (0,0,3)..(8,9,3) }
zone : update_Wate { (0,0,1)..(8,9,1) }
zone : update_Sun { (0,0,4)..(8,9,4) }


zone : update_height { (0,0,5)..(9,9,5) }
zone : reproduction { (0,0,0)..(9,9,0) }


[update_Wate]
% consume Wate rule with locast tree growth and Wate distribution to adjecent cells
rule : { ((0,0,0)- 3)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1) = 1 }


% consume Wate rule with pine tree growth  and Wate distribution to adjecent cells
rule : { (0,0,0)- 4 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1)=  2 }

% consume Wate rule with oak tree growth  and Wate distribution to adjecent cells
rule : { (0,0,0)- 5 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1)= 3 }

% if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : {((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 100  } 

rule : { (0,0,0) } 1000 { t }

[adjustWate]
% add extra resource to this row using uniform distribution and consume Wate rule with locast tree growth and Wate distribution to adjecent cells
rule : { ((0,0,0)- 3) + uniform(5,15) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1) = 1 }
 
% add extra resource to this row using uniform distribution and consume Wate rule with pine tree growth  and Wate distribution to adjecent cells
rule : { (0,0,0)- 4 + uniform(5,15)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1)= 2 }

% add extra resource to this row using uniform distribution and consume Wate rule with oak tree growth  and Wate distribution to adjecent cells
rule : { (0,0,0)- 5 + uniform(5,15) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,3) >= 5 and  (0,0,1) >= 70 and (0,0,2) >= 80 and (0,0,0) >= 5 and (0,0,-1) = 3 }

% add extra resource to this row using uniform distribution and  if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : { uniform(5,15)+((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 100  } 

rule : { (0,0,0) } 1000 { t }



















[update_Nitr]
% consume Nitro rule with locast tree growth and nitro distribution to adjecent cells
 
rule : { ((0,0,0)- 18)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 5 and  (0,0,0) >= 70 and (0,0,1) >= 80 and (0,0,-1) >= 5 and (0,0,-2) = 1 }


% consume Nitro rule with pine tree growth  and nitro distribution to adjecent cells
rule : { (0,0,0)- 15 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 3 and  (0,0,0) >= 80 and (0,0,1) >= 75 and (0,0,-1) >= 2 and (0,0,-2) = 2 }

% consume Nitro rule with oak tree growth  and nitro distribution to adjecent cells
rule : { (0,0,0)- 20 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 3 and  (0,0,0) >= 80 and (0,0,1) >= 75 and (0,0,-1) >= 2 and (0,0,-2) = 3 }

% if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : {((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 1000  } 

rule : { (0,0,0) } 1000 { t }

[adjustNitr]

% add extra resource to this row using uniform distribution and consume Nitro rule with locast tree growth and nitro distribution to adjecent cells
 
rule : { ((0,0,0)- 18)+ uniform(10,50) +((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 5 and  (0,0,0) >= 70 and (0,0,1) >= 80 and (0,0,-1) >= 5 and (0,0,-2) = 1 }


% add extra resource to this row using uniform distribution and consume Nitro rule with pine tree growth  and nitro distribution to adjecent cells
rule : { (0,0,0)- 15 + uniform(10,50) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 3 and  (0,0,0) >= 80 and (0,0,1) >= 75 and (0,0,-1) >= 2 and (0,0,-2) = 2 }

% add extra resource to this row using uniform distribution and consume Nitro rule with oak tree growth  and nitro distribution to adjecent cells
rule : { (0,0,0)- 20 + uniform(10,50) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,2) >= 3 and  (0,0,0) >= 80 and (0,0,1) >= 75 and (0,0,-1) >= 2 and (0,0,-2) = 3 }

% add extra resource to this row using uniform distribution and  if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : { uniform(10,50) +((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 1000  } 

rule : { (0,0,0) } 1000 { t }







[update_Pota]

% consume Pota rule with locast tree growth and Pota distribution to adjecent cells
rule : { ((0,0,0)- 10)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 5 and  (0,0,-1) >= 70 and (0,0,0) >= 80 and (0,0,-2) >= 5 and (0,0,-3) = 1 }


% consume Pota rule with pine tree growth  and Pota distribution to adjecent cells
rule : { (0,0,0)- 15 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 3 and  (0,0,-1) >= 80 and (0,0,0) >= 75 and (0,0,-2) >= 2 and (0,0,-3) = 2 }

% consume Pota rule with oak tree growth  and Pota distribution to adjecent cells
rule : { (0,0,0)- 25 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 4 and  (0,0,-1) >= 95 and (0,0,0) >= 90 and (0,0,-2) >= 5 and (0,0,-2) = 3 }

% if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : {((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 1000  } 

rule : { (0,0,0) } 1000 { t }

[adjustPota]

% add extra resource to this row using uniform distribution and consume Pota rule with locast tree growth and Pota distribution to adjecent cells
rule : { ((0,0,0)- 10)+ uniform(10,50) +((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 5 and  (0,0,-1) >= 70 and (0,0,0) >= 80 and (0,0,-2) >= 5 and (0,0,-3) = 1 }


% add extra resource to this row using uniform distribution and consume Pota rule with pine tree growth  and Pota distribution to adjecent cells
rule : { (0,0,0)- 15 + uniform(10,50) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 3 and  (0,0,-1) >= 80 and (0,0,0) >= 75 and (0,0,-2) >= 2 and (0,0,-3) = 2 }

% add extra resource to this row using uniform distribution and consume Pota rule with oak tree growth  and Pota distribution to adjecent cells

rule : { (0,0,0)- 25 + uniform(10,50) +((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,1) >= 4 and  (0,0,-1) >= 95 and (0,0,0) >= 90 and (0,0,-2) >= 5 and (0,0,-2) = 3 }

% add extra resource to this row using uniform distribution and  if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : { uniform(10,50) +((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 1000  } 

rule : { (0,0,0) } 1000 { t }




[update_Sun]
% consume Sun rule with locast tree growth and Sun distribution to adjecent cells
rule : { ((0,0,0)- 2)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4) = 1 }


% consume Sun rule with pine tree growth  and Sun distribution to adjecent cells
rule : { (0,0,0)- 3 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4)=  2 }

% consume Sun rule with oak tree growth  and Sun distribution to adjecent cells
rule : { (0,0,0)- 4 + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4)= 3 }

% if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : {((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 50  } 

rule : { (0,0,0) } 1000 { t }

[adjustSun]
% add extra resource to this row using uniform distribution and consume Sun rule with locast tree growth and Sun distribution to adjecent cells
rule : { ((0,0,0)- 2) + uniform(7,12) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4) = 1 }
 
% add extra resource to this row using uniform distribution and consume Sun rule with pine tree growth  and Sun distribution to adjecent cells
rule : { (0,0,0)- 3 + uniform(7,12)+ ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4)= 2 }

% add extra resource to this row using uniform distribution and consume Sun rule with oak tree growth  and Sun distribution to adjecent cells
rule : { (0,0,0)- 4 + uniform(7,12) + ((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9 } 1000 { (0,0,0) >= 5 and  (0,0,-2) >= 70 and (0,0,-1) >= 80 and (0,0,-3) >= 5 and (0,0,-4) = 3 }

% add extra resource to this row using uniform distribution and  if no tree exists or not enough resource available then just distribute the resource to adjecent cells.
 
rule : { uniform(7,12)+((-1,1,0)+(0,1,0)+(1,1,0)+(-1,0,0)+(0,0,0)+(1,0,0)+(-1,-1,0)+(0,-1,0)+(1,-1,0))/9} 1000 { (0,0,0) < 50  } 

rule : { (0,0,0) } 1000 { t }















































[reproduction]
rule : { 1 } 1000 { (0,0,0) = 0 and (-1,1,0)= 1 and (-1,1,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (-1,0,0)= 1 and (-1,0,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (-1,-1,0)= 1 and (-1,-1,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (0,1,0)= 1 and (0,1,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (0,-1,0)= 1 and (0,-1,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (1,1,0)= 1 and (1,1,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (1,0,0)= 1 and (1,0,5) > 50 }
rule : { 1 } 1000 { (0,0,0) =0 and (1,-1,0)= 1 and (1,-1,5) > 50 }

rule : { 2 } 1000 { (0,0,0) =0 and (-1,1,0)= 2 and (-1,1,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (-1,0,0)= 2 and (-1,0,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (-1,-1,0)= 2 and (-1,-1,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (0,1,0)= 2 and (0,1,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (0,-1,0)= 2 and (0,-1,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (1,1,0)= 2 and (1,1,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (1,0,0)= 2 and (1,0,5) > 55 }
rule : { 2 } 1000 { (0,0,0) =0 and (1,-1,0)= 2 and (1,-1,5) > 55 }

rule : { 3 } 1000 { (0,0,0) =0 and (-1,1,0)= 3 and (-1,1,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (-1,0,0)= 3 and (-1,0,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (-1,-1,0)= 3 and (-1,-1,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (0,1,0)= 3 and (0,1,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (0,-1,0)= 3 and (0,-1,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (1,1,0)= 3 and (1,1,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (1,0,0)= 3 and (1,0,5) > 40 }
rule : { 3 } 1000 { (0,0,0) =0 and (1,-1,0)= 3 and (1,-1,5) > 40 }

rule : { (0,0,0) } 1000 { t }

[update_height]
% growing rule for locast 
rule : { (0,0,0) + 5 } 1000 { (0,0,-1) >= 5 and  (0,0,-2) >= 70 and (0,0,-3) >= 80 and (0,0,-4) >= 5 and (0,0,-5) = 1 and (0,0,0) < 75  }
% dying rule for locast 
rule : { 0 } 1000 { (0,0,-1) < 5 or  (0,0,-2) < 70 or (0,0,-3) < 80 or (0,0,-4) < 5 and (0,0,-5) = 1 and (0,0,0) >0  }

% growing rule for pine 
rule : { (0,0,0) + 4 } 1000 { (0,0,-1) >= 3 and  (0,0,-2) >= 80 and (0,0,-3) >= 75 and (0,0,-4) >= 2 and (0,0,-5) = 2 and (0,0,0) < 85  }

% dying rule for pine 
rule : { 0 } 1000 { (0,0,-1) < 3 or  (0,0,-2) < 80 or (0,0,-3) < 75 or (0,0,-4) < 2 and (0,0,-5) = 2 and (0,0,0) > 0  }


% growing rule for oak 
rule : { (0,0,0) + 6 } 1000 { (0,0,-1) >= 4 and  (0,0,-2) >= 95 and (0,0,-3) >= 90 and (0,0,-4) >= 5 and (0,0,-5) = 3 and (0,0,0) < 60  }

% dying rule for oak 
rule : { 0 } 1000 { (0,0,-1) < 4 or  (0,0,-2) < 95 or (0,0,-3) < 90 or (0,0,-4) < 5 and (0,0,-5) = 3 and (0,0,0) > 0  }


rule : { (0,0,0) } 1000 { t } 
 
[update_rule]
rule : { (0,0,0) } 1000 { t }

