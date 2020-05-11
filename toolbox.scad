include <../lasercut-box-openscad/box.scad>

materialThickness = 9;

baseUnitMMs = 210;
heightUnitMMs = 60;

heightUnits = 4;
widthUnits = 3;
depthUnits = 2;

holeWidth = 135;
holeheight = 42;
holeMargin = materialThickness * 3;

lidHeight = materialThickness * 6;
lidSlop = .5;

widthActual = baseUnitMMs * depthUnits; // We swap width and depth so the handles are on the short side
depthActual = baseUnitMMs * widthUnits;
heightActual = heightUnitMMs * heightUnits;

assemble = false; // Set to false for dimensioned flats

fingerWidth = heightUnitMMs / 2;

lidWidth = widthActual + (materialThickness*2) + lidSlop;
lidDepth = depthActual + (materialThickness*2) + lidSlop;

if (heightUnits>2) {
    // Main Box
    box(depth = depthActual, 
    height = heightActual, 
    width = widthActual, 
    thickness = 9,
    hole_width = holeWidth,
    hole_height = holeheight,
    hole_margin = holeMargin,
    inset = materialThickness*2,
    open = true,
    finger_width = fingerWidth,
    assemble = assemble);

    // Lid
    lidCutoutMargin = holeMargin-lidHeight-materialThickness/2;

    translate([0, 0, 0]){
        rotate([0,180,0]){
            box(depth = lidDepth, 
            height = lidHeight, 
            width = lidWidth, 
            thickness = 9,
            inset = materialThickness,
            open = true,
            finger_width = fingerWidth,
            assemble = assemble,
            hole_width = holeWidth,
    hole_height = holeheight,
    hole_margin = lidCutoutMargin
            );
        }
    }
} else {
        // Main Box
    box(depth = depthActual, 
    height = heightActual, 
    width = widthActual, 
    thickness = 9,
    inset = materialThickness*2,
    open = true,
    finger_width = fingerWidth,
    assemble = assemble);

    // Lid
    translate([lidWidth-materialThickness, -materialThickness, heightActual+ (materialThickness*2) + lidSlop]){
        rotate([0,180,0]){
            box(depth = lidDepth, 
            height = lidHeight, 
            width = lidWidth, 
            thickness = 9,
            inset = materialThickness,
            open = true,
            finger_width = fingerWidth,
            assemble = assemble
            );
        }
    }
}