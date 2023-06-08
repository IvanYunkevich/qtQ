#ifndef LINEAR_H
#define LINEAR_H

#include <QObject>
#include <QtQml/qqml.h>

class Linear : public QObject//+
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Linear(QObject *parent = nullptr);

public slots:
    double linearCalc(int x);
    int getX(int pos);
    int getY(int pos);
    int getSize();

signals:

private:
    std::vector<int> xNums{7,31,61,99,129,178,209};
    std::vector<int> yNums{13,10,9,10,12,20,26};
    int size;
};

#endif // LINEAR_H
