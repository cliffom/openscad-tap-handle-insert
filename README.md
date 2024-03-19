# Customizable 3D Printed Object with Embedded Magnets

This project contains an OpenSCAD script for creating a customizable 3D printed object, specifically designed with recesses for embedding magnets. The design is perfect for creating enclosures, boxes, or other objects that benefit from magnetic closures or attachments.

## Features

- **Customizable Dimensions**: Easily adjust the length, width, and height of the object to fit your needs.
- **Rounded Corners**: Add a modern touch with customizable rounded corners to enhance the aesthetics and safety of the object.
- **Magnet Embedding**: Incorporate precisely positioned holes for embedding cylindrical magnets either at the corners of the object or centrally, according to your design requirements.
- **Tolerance Settings**: Fine-tune the tolerance settings for magnet embedding to accommodate variations in manufacturing processes and ensure a snug fit for the magnets.
- **Height Padding for Magnets**: Customize the padding above the magnets within the object to conceal them completely or adjust their protrusion.

## Prerequisites

Before you start, ensure you have the following:
- [OpenSCAD](http://www.openscad.org/) installed on your computer.
- Basic knowledge of OpenSCAD syntax and 3D modeling concepts.

## Configuration

The script allows for extensive customization through a set of parameters at the beginning of the file:

- `rectLength`, `rectWidth`: Set the dimensions of the object's length and width.
- `cornerRadius`: Define the radius of the corners for a smoother appearance.
- `magnetHeight`, `magnetDiameter`: Specify the dimensions of the magnets to be embedded.
- `magnetTolerance`: Adjust the tolerance for the magnet holes to ensure a proper fit.
- `magnetCorners`: A boolean parameter to determine whether the magnets are placed at the corners or centrally within the object.
- `rectHeightPadding`: Set additional height above the magnets to fully encase them within the material.

## Usage

1. Open the `.scad` file with OpenSCAD.
2. Modify the parameters at the start of the file according to your design preferences.
3. Preview the model by pressing F5 or clicking on the 'Preview' button.
4. Once satisfied, render the final model by pressing F6 or selecting the 'Render' button, then export it as an STL file for 3D printing.

## Modules

The script includes key modules such as:

- `roundedRectangle(width, length, rounding)`: This module creates a 2D rounded rectangle based on the specified dimensions and corner radius.
- `magnetHole(x, y, diameter, height, tolerance, zOffset)`: This module generates a cylindrical hole designed for magnet embedding, customizable based on specified parameters.

## Contributing

We welcome contributions from the community. Your input helps make the open-source community an inspiring and creative space. Feel free to contribute in any way you can.

## License

This project is distributed under the MIT License. See the `LICENSE` file for more details.
