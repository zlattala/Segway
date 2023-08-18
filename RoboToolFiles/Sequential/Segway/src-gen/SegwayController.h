#ifndef ROBOCALC_CONTROLLERS_SEGWAYCONTROLLER_H_
#define ROBOCALC_CONTROLLERS_SEGWAYCONTROLLER_H_

#include "SegwayRP.h"
#include "RoboCalcAPI/Controller.h"
#include "DataTypes.h"

#include "BalanceSTM.h"

class SegwayController: public robocalc::Controller 
{
public:
	SegwayController(SegwayRP& _platform) : platform(&_platform){};
	SegwayController() : platform(nullptr){};
	
	~SegwayController() = default;
	
	void Execute()
	{
		balanceSTM.execute();
	}
	
	struct Channels
	{
		SegwayController& instance;
		Channels(SegwayController& _instance) : instance(_instance) {}
		
		EventBuffer* tryEmitLeftMotorVelocity(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveLeftMotorVelocity(args))
				instance.balanceSTM.leftMotorVelocity_in.trigger(sender, args);
				
			return &instance.balanceSTM.leftMotorVelocity_in;
		}
		
		EventBuffer* tryEmitRightMotorVelocity(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveRightMotorVelocity(args))
				instance.balanceSTM.rightMotorVelocity_in.trigger(sender, args);
				
			return &instance.balanceSTM.rightMotorVelocity_in;
		}
		
		EventBuffer* tryEmitAngle(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveAngle(args))
				instance.balanceSTM.angle_in.trigger(sender, args);
				
			return &instance.balanceSTM.angle_in;
		}
		
		EventBuffer* tryEmitGyroX(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveGyroX(args))
				instance.balanceSTM.gyroX_in.trigger(sender, args);
				
			return &instance.balanceSTM.gyroX_in;
		}
		
		EventBuffer* tryEmitGyroY(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveGyroY(args))
				instance.balanceSTM.gyroY_in.trigger(sender, args);
				
			return &instance.balanceSTM.gyroY_in;
		}
		
		EventBuffer* tryEmitGyroZ(void* sender, std::tuple<double> args)
		{
			if(instance.balanceSTM.canReceiveGyroZ(args))
				instance.balanceSTM.gyroZ_in.trigger(sender, args);
				
			return &instance.balanceSTM.gyroZ_in;
		}
		
	};
	
	Channels channels{*this};
	
	SegwayRP* platform;
	BalanceSTM_StateMachine<SegwayController> balanceSTM{*platform, *this, &balanceSTM};
};

#endif
