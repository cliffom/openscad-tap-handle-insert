/* [Rectangle Parameters:] */

// Length of the rectangle
rectLength = 108;

// Width of the rectangle
rectWidth = 45;

// Height of the rectangle
rectHeight = 1;

// corner radius
cornerRadius=5; // [10]

/* [Magnet Parameters:] */

// Magnet hight
magnetHeight = 1;

// Magnet Diameter
magnetDiameter = 10;

// Magnet location along the z-axis
magnetZLocation = (magnetHeight - rectHeight) / 2;

// Tolerance of hole for magnet
magnetTolerance = 0.5;

// Defines a 2D rounded rectangle.
// 'width': Total horizontal dimension of the rectangle.
// 'length': Total vertical dimension of the rectangle.
// 'rounding': Radius of the rounded corners.
// This module creates a centered rectangle with specified 'width' and 'length',
// where each corner is rounded with a radius determined by 'rounding'.
module rounded_rectangle(width, length, rounding) {
    offset(r = rounding)
        square([width - 2 * rounding, length - 2 * rounding], center = true);
}

// Combine the shapes and extrude
difference() {
    // Render the shape and apply extrusion
    linear_extrude(height = rectHeight, center = false) {
        rounded_rectangle(rectWidth, rectLength, cornerRadius);
    }

    // Hole through the object
    translate([0, 0, magnetZLocation]) {
        cylinder(d = magnetDiameter + magnetTolerance, h = magnetHeight, center = false);
    }
}
