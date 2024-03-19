# Customizable 3D Printed Object with Embedded Magnets

This project contains an OpenSCAD script for creating a customizable 3D printed object, specifically designed with recesses for embedding magnets. The design is perfect for creating enclosures, boxes, or other objects that benefit from magnetic closures or attachments.

## Features

- **Customizable Dimensions**: Easily adjust the length, width, and height of the object.
- **Rounded Corners**: Add a modern touch with rounded corners, customizable radius.
- **Magnet Embedding**: Precisely positioned holes for embedding cylindrical magnets at the corners or the center, depending on your needs.
- **Tolerance Settings**: Adjust the tolerance for magnet fitting according to your manufacturing process.

## Prerequisites

Before you start, ensure you have the following:
- [OpenSCAD](http://www.openscad.org/) installed on your computer.
- Basic knowledge of OpenSCAD syntax and 3D modeling concepts.

## Configuration

The script is highly customizable through a set of parameters at the beginning of the file:

- `rectLength`, `rectWidth`: Define the dimensions of the object.
- `cornerRadius`: Adjust the radius of the corners.
- `magnetHeight`, `magnetDiameter`: Specify the size of the magnets.
- `magnetOffset`: Position of the magnet along the z-axis.
- `magnetTolerance`: Set the fitting tolerance for the magnets.
- `magnetCorners`: Boolean to place magnets at the corners or at the center.

## Usage

1. Open the `.scad` file with OpenSCAD.
2. Adjust the parameters at the beginning of the file to fit your needs.
3. Render the model by pressing F5 or clicking on the 'Preview' button.
4. When you're satisfied with the design, generate the STL by pressing F6 or clicking on the 'Render' button, then export it.

## Modules

The script includes the following main modules:

- `roundedRectangle(width, length, rounding)`: Creates a 2D rectangle with rounded corners.
- `magnetHole(x, y, diameter, height, tolerance, zOffset)`: Generates a cylindrical hole for magnet embedding.

## Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

## License

Distributed under the MIT License. See `LICENSE` for more information.
