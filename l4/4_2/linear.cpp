#include "linear.h"
#include <QDebug>

Linear::Linear(QObject *parent)
    : QObject{parent}
{
    size = xNums.size();
}

double Linear::linearCalc(int x)
{
    int sumXY = 0;
    int sumX2 = 0;
    for (int i = 0; i < size;++i){
        sumXY += xNums[i]*yNums[i];
        sumX2 += xNums[i]*xNums[i];
    }
    int sumX = std::accumulate(xNums.begin(), xNums.end(), 0);
    int sumY = std::accumulate(yNums.begin(), yNums.end(), 0);
    double a = (size*sumXY - sumX * sumY) / static_cast<double>(size*sumX2 - sumX*sumX);
    double b = (sumY - a*sumX) / size;
    return a * x + b;
}

int Linear::getX(int pos)
{
    return xNums[pos];
}

int Linear::getY(int pos)
{
    return yNums[pos];
}

int Linear::getSize()
{
    return size;
}
