#ifndef DIAGRAM_H
#define DIAGRAM_H

#include <QObject>
#include <QString>
#include <QColor>
#include <QtQml/qqml.h>

enum class DiagTypes
  {
    Sin,
    Line,
    Abs,
    Square,
    Log2
  };

class Diagram : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Diagram(QObject *parent = nullptr);

public slots:
    int getVectorSize();
    double getX(int pos);
    double getY(int pos);
    void diagTypeChange();
    QString diagTypeName();
    QColor diagColor();

    double volMaxMin(QString axis, QString type);
signals:

private slots:
    double vectorYcalc(double x);
    void vectorYfill();
private:
    QVector<double> vectorX;
    QVector<double> vectorY;
    DiagTypes diagramType = DiagTypes::Log2;
    QColor color = Qt::red;
};

#endif // DIAGRAM_H
