#include "Diagram.h"
#include <QDebug>

Diagram::Diagram(QObject *parent)
    : QObject{parent}
{
    double j = 0;
    while (j <= 5) {
       vectorX.append(j);
       j += 0.1;
    }
    vectorY.resize(vectorX.size());
    vectorYfill();
}

int Diagram::getVectorSize()
{
    return vectorX.size();
}

double Diagram::getX(int pos)
{
    return vectorX.at(pos);
}

double Diagram::getY(int pos)
{
    return vectorY.at(pos);
}

void Diagram::diagTypeChange()
{
    switch (diagramType) {
    case DiagTypes::Sin:
        diagramType = DiagTypes::Line;
        break;
    case DiagTypes::Line:
        diagramType = DiagTypes::Abs;
        break;
    case DiagTypes::Abs:
        diagramType = DiagTypes::Square;
        break;
    case DiagTypes::Square:
        diagramType = DiagTypes::Log2;
        break;
    case DiagTypes::Log2:
        diagramType = DiagTypes::Sin;
        break;
    default:
        diagramType = DiagTypes::Line;
        break;
    }
    vectorYfill();
}

QString Diagram::diagTypeName()
{
    switch (diagramType) {
    case DiagTypes::Sin:
        return "y = sin(x)";
        break;
    case DiagTypes::Line:
        return "y = x";
        break;
    case DiagTypes::Abs:
        return "y = |x - 2.5|";
        break;
    case DiagTypes::Square:
        return "y = x^2";
        break;
    case DiagTypes::Log2:
        return "y = log2(x)";
        break;
    default:
        return 0;
        break;
    }
}

QColor Diagram::diagColor()
{
    return color;
}

double Diagram::volMaxMin(QString axis, QString type)
{
    QVector<double> vector;
    if (axis == "x")
        vector = vectorX;
    else if (axis == "y")
        vector = vectorY;
    else
        qDebug() << "Error";

    double vol = 1;
    if (type == "max")
        vol=*std::max_element(vector.begin(),vector.end());
    else if (type == "min")
        vol=*std::min_element(vector.begin(),vector.end());
    else
        qDebug() << "Error";
    return vol;
}

double Diagram::vectorYcalc(double x)
{
    switch (diagramType) {
    case DiagTypes::Sin:
        return sin(x);
        break;
    case DiagTypes::Line:
        return x;
        break;
    case DiagTypes::Abs:
        return fabs(x - 2.5);
        break;
    case DiagTypes::Square:
        return x*x;
        break;
    case DiagTypes::Log2:
        if (x)
            return log2(x);
        else
            return log2(x+0.01);
        break;
    default:
        return 0;
        break;
    }
}

void Diagram::vectorYfill()
{
    for (int i = 0; i < vectorX.size(); ++i) {
        vectorY[i] = vectorYcalc(vectorX.at(i));
    }
}
