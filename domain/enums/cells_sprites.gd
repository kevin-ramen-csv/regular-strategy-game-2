class_name CellSprite

const HIGHLIGHTS_LIST = [LEVEL1_ATTACK_HIGHLIGHT,LEVEL1_MOVE_HIGHLIGHT]
# Cell tile-set in the order of {Source:int,Atlas:Vector2i,Alternative:int}

#cells level 1
const LEVEL1_5HP = {"SOURCE":8,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": false}
const LEVEL1_4HP = {"SOURCE":9,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": false}
const LEVEL1_3HP = {"SOURCE":10,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": false}
const LEVEL1_2HP = {"SOURCE":11,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": false}
const LEVEL1_1HP = {"SOURCE":12,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": false}
# Higlighted cells
const LEVEL1_ATTACK_HIGHLIGHT = {"SOURCE":13,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": true}
const LEVEL1_MOVE_HIGHLIGHT = {"SOURCE":14,"ATLAS":Vector2i.ZERO,"ALTERNATIVE":0, "HIGHLIGHT": true}
