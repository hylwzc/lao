//
//  Decision .h
//  project3
//
//  Created by student1 on 15/9/6.
//  Copyright (c) 2015年 student1. All rights reserved.
//

#ifndef project3_Decision__h
#define project3_Decision__h
#include <list>
#include <iterator>
#include "Vehicle.h"
#include "emergencyVehicle.h"
using namespace std;
class Decision{
private:
    list<Vehicle*> &vehicleList;//各类车辆的指针
public:
    Decision(list<Vehicle*>&v);//构造函数，接收存储各类车辆信息的容器
    void printVehiclesSpecifications();//打印所有车辆的具体信息
   void printEmergencyVehicles();//单独打印紧急车辆的紧急数据信息
    int numberLongDistanceEmergencyVehicles();//打印不用中途加油能够行驶800km以上的紧急车辆的数量
    int numBeds();//确定以防紧急事件这个城市能够调遣的移动床位的数量
    int numPassengers();//确定以防紧急事件这个城市可转移的乘客人数
};
/*接收存储各类车辆信息的容器*/
Decision::Decision(list<Vehicle*>&v):vehicleList(v){}
/*打印所有车辆的具体信息*/
void Decision::printVehiclesSpecifications(){
        list<Vehicle*>::iterator l;
    l = vehicleList.begin();
    while (l!=vehicleList.end()) {
        
        cout<<"------------------------"<<endl;
        (*l++)->printSpecifications();
    }
}
void Decision::printEmergencyVehicles(){
    emergencyVehicle *p;
    list<Vehicle*>::iterator l;
    l = vehicleList.begin();
    while (l!=vehicleList.end()) {
        p = dynamic_cast<emergencyVehicle*>(*l++);
        if (p!=NULL)
            p->printSpecifications();
    }
}
int Decision::numberLongDistanceEmergencyVehicles(){
    int num = 0;
    list<Vehicle*>::iterator l;
    l = vehicleList.begin();
    while (l!=vehicleList.end()) {
        if ((*l++)->computeTravelDistance()>=800)
            num++;
    }
    return num;
}
int Decision::numBeds(){
    
}
int Decision::numPassengers(){
    int peo =0;
    passengerVehicle *p;
    list<Vehicle*>::iterator l;
    l = vehicleList.begin();
    while (l!=vehicleList.end()){
        p = dynamic_cast<emergencyVehicle*>(*l++);
        if (p!=NULL)
            peo++;
    }
    return peo;
}
#endif
