/* [Magnet Parameters:] */

// Magnet height
magnetHeight = 3;

// Magnet diameter
magnetDiameter = 8;

// Tolerance of hole for magnet
magnetTolerance = 0.5;

// Put magnets in corners
magnetCorners = true;

/* [Rectangle Parameters:] */

// Length of the rectangle
rectLength = 100;

// Width of the rectangle
rectWidth = 50;

// Corner radius
cornerRadius = 5;

// Height of the rectangle
rectHeight = magnetHeight + 2;

// Magnet location along the z-axis
magnetOffset = (rectHeight - magnetHeight) / 2;

// Defines a 2D rounded rectangle centered at the origin.
//
// Parameters:
//   width (number): Total horizontal dimension of the rectangle.
//   length (number): Total vertical dimension of the rectangle.
//   rounding (number): Radius of the rounded corners, must be non-negative.
//
// The module creates a rectangle with specified 'width' and 'length',
// where each corner is rounded with a radius determined by 'rounding'.
module roundedRectangle(width, length, rounding)
{
	offset(r = rounding) square([ width - 2 * rounding, length - 2 * rounding ], center = true);
}

// Creates a cylindrical hole intended for embedding a magnet into a part. The hole is positioned
// and sized based on the parameters provided. This module is particularly useful for designs
// requiring magnetic connections or fixings, such as closures or alignment features in 3D printed parts.
//
// Parameters:
//   x (number): The X-coordinate for the center of the base of the cylinder in the XY-plane. Determines
//               the horizontal position of the magnet hole.
//   y (number): The Y-coordinate for the center of the base of the cylinder in the XY-plane. Determines
//               the vertical position of the magnet hole.
//   diameter (number): The nominal diameter of the magnet. The actual hole diameter will be larger to
//                       accommodate the magnet with a tolerance fit. Must be non-negative.
//   height (number): The depth of the magnet hole. Corresponds to the thickness of the magnet to be embedded.
//                    Must be non-negative and ideally less than the part thickness to avoid breaking through.
//   tolerance (number): Additional diameter added to the nominal magnet diameter to ensure a fit that accounts
//                        for manufacturing variances. A positive value results in a looser fit, while a value
//                        of zero would aim for a tight, press-fit (may require force or adhesives). Must be
//                        non-negative.
//   zOffset (number): The offset along the Z-axis from the base plane where the cylinder starts. This allows
//                     the hole to begin partway through a component, useful for inset magnets. A value of 0
//                     starts the hole at the base surface of the part.
//
// The module constructs a cylinder at the specified location with the calculated dimensions. The cylinder's
// base is aligned with the Z-offset rather than centered, facilitating its use as a hole when combined with
// difference() operations in parent modules.
module magnetHole(x, y, diameter, height, tolerance, zOffset)
{
	// Validate parameters to avoid negative dimensions which can cause rendering issues
	diameter = max(diameter, 0);
	height = max(height, 0);
	tolerance = max(tolerance, 0);

	// Position the cylindrical hole based on the specified coordinates and Z-offset
	translate([ x, y, zOffset ])
	{
		// Create the cylinder with the adjusted diameter for tolerance and the specified height
		cylinder(d = diameter + tolerance, h = height, center = false);
	}
}

// Combine the shapes and extrude
difference()
{
	// Render the shape and apply extrusion
	linear_extrude(height = rectHeight, center = false)
	{
		roundedRectangle(rectWidth, rectLength, cornerRadius);
	}

	if (magnetCorners)
	{
		// Create a hole in each of the four corners
		for (x = [ -1, 1 ], y = [ -1, 1 ])
		{
			xPos = (rectWidth - cornerRadius * 2) / 2 * x;
			yPos = (rectLength - cornerRadius * 2) / 2 * y;
			magnetHole(xPos, yPos, magnetDiameter, magnetHeight, magnetTolerance, magnetOffset);
		}
	}
	else
	{
		// Create a single hole through the center
		magnetHole(0, 0, magnetDiameter, magnetHeight, magnetTolerance, magnetOffset);
	}
}
