//
//  Pie.swift
//  Memorize
//
//  Created by Hernán Beiza on 26-02-21.
//

import SwiftUI

// Todas las Shapes implementan Animatable
struct Pie: Shape {
    
    var startAngle:Angle;
    var endAngle:Angle;
    var clockwise:Bool = false;
    
    // Para animar dos propiedades a la vez
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians);
        }
        set {
            startAngle = Angle.radians(newValue.first);
            endAngle = Angle.radians(newValue.second);
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path();
        let center = CGPoint(x: rect.midX, y: rect.midY);
        let radius = min(rect.width, rect.height) / 2;
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)), y:center.y + radius * sin(CGFloat(startAngle.radians)));
        p.move(to: center);
        p.addLine(to: start);
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise);
        p.addLine(to: center);
        return p;
    }
    
}
