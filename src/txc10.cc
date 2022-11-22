#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class Txc10 : public cSimpleModule
{
protected:
    virtual void forwardMessage(cMessage *msg);
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Txc10);

void Txc10::initialize()
{
    if (getIndex() == 0) {
        char msgname[20];
        sprintf(msgname, "tic-%d", getIndex());
        cMessage *msg = new cMessage(msgname);
        scheduleAt(0.0, msg);
    }
}

void Txc10::handleMessage(cMessage *msg)
{
    if (getIndex() == 0 && msg->getArrivalGate() != NULL) {
        EV << "Message " << msg << " arrived. \n";
        delete msg;
    }
    else {
        forwardMessage(msg);
    }
}

void Txc10::forwardMessage(cMessage *msg) {
    int n = gateSize("out");
    int k = intuniform(0, n-1);

    EV << "Forwarding message " << msg << " on port [" << k << "]\n.";
    send(msg, "out", k);
}
