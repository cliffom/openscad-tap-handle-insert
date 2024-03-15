// Width of the rectangle
width = 109;  

// Height of the rectangle
height = 46;  

// Rounding Radius
rounding = 5;

// Thickness of the 3D object along the Z-axis
thickness = 10; 

// Main shape function for 2D shape
module rounded_rectangle(width, height, rounding) {
    offset(r = rounding)
        square([width - 2*rounding, height - 2*rounding], center = true);
}

// Render the shape and apply extrusion
linear_extrude(height = thickness, center = true) {
    rounded_rectangle(width, height, rounding);
}
