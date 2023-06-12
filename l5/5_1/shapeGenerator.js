function generateCoordinates(shapeType) {
    var coordinates = [];

    if (shapeType === "Звездочка") {
        coordinates = [
            {x: 50, y: 50},
            {x: 75, y: 10},
            {x: 100, y: 50},
            {x: 140, y: 60},
            {x: 110, y: 90},
            {x: 120, y: 130},
            {x: 75, y: 110},
            {x: 30, y: 130},
            {x: 40, y: 90},
            {x: 10, y: 60}
        ];
    } else if (shapeType === "Кольцо") {
        var radius = 50;
        var centerX = 100;
        var centerY = 100;
        var numPoints = 100;
        var angleIncrement = (2 * Math.PI) / numPoints;

        for (var i = 0; i < numPoints; i++) {
            var angle = i * angleIncrement;
            var x = centerX + radius * Math.cos(angle);
            var y = centerY + radius * Math.sin(angle);
            coordinates.push({ x: x, y: y });
        }
    } else if (shapeType === "Домик") {
        coordinates = [
            {x: 50, y: 150},
            {x: 150, y: 150},
            {x: 150, y: 50},
            {x: 100, y: 10},
            {x: 50, y: 50},
            {x: 50, y: 150}
        ];
    } else if (shapeType === "Песочные часы") {
        coordinates = [
            {x: 50, y: 50},
            {x: 150, y: 50},
            {x: 100, y: 100},
            {x: 150, y: 150},
            {x: 50, y: 150},
            {x: 100, y: 100},
            {x: 50, y: 50}
        ];
    }
    return coordinates;
}
