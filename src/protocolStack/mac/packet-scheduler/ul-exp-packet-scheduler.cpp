/* -*- Mode:C++; c-file-style:"gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2020 TELEMATICS LAB, Politecnico di Bari
 *
 * This file is part of 5G-air-simulator
 *
 * 5G-air-simulator is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation;
 *
 * 5G-air-simulator is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with 5G-air-simulator; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Telematics Lab <telematics-dev@poliba.it>
 */

#include "ul-exp-packet-scheduler.h"
#include "../mac-entity.h"
#include "../../packet/Packet.h"
#include "../../packet/packet-burst.h"
#include "../../../device/NetworkNode.h"
#include "../../../flows/radio-bearer.h"
#include "../../../protocolStack/rrc/rrc-entity.h"
#include "../../../flows/application/Application.h"
#include "../../../device/GNodeB.h"
#include "../../../protocolStack/mac/AMCModule.h"
#include "../../../phy/phy.h"
#include "../../../core/spectrum/bandwidth-manager.h"
#include "../../../flows/QoS/QoSForEXP.h"
#include "../../../flows/MacQueue.h"



#include "../../../core/idealMessages/ideal-control-messages.h"
#include "../../../flows/QoS/QoSParameters.h"

UL_EXP_PacketScheduler::UL_EXP_PacketScheduler()
{
  std::cout << " starting the UL EXP " << std::endl;  
  SetMacEntity(nullptr);
  CreateUsersToSchedule();
}

UL_EXP_PacketScheduler::~UL_EXP_PacketScheduler()
{
  Destroy();
}

double
UL_EXP_PacketScheduler::ComputeSchedulingMetric(UserToSchedule *user, int subchannel)
{
  /*
   * For the EXP scheduler the metric is computed
   * as follows:
   *                -log(dropProbability)/targetDelay * HOL - aW
   * metric = exp ( --------------------------------------------) * availableRate/averageRate
   *                            1 - sqrt (aW)
   */

  double metric;

  metric = 1000; //just testing 

  // QoSForEXP *qos = (QoSForEXP*) bearer->GetQoSParameters ();

  // double HOL = bearer->GetHeadOfLinePacketDelay ();
  // double alfa = -log10(qos->GetDropProbability()) / qos->GetMaxDelay ();
  // double avgAW = GetAW ();
  // double AW = alfa * HOL;

  // 2020-04-22: GetAverageTransmissionRate();

  //RadioBearer urser; // declaring the object 

  

  // std::cout << " Data To Transmit : " << user->m_dataToTransmit 
  //           << " / Data Transmitted:" << user->m_transmittedData << std::endl; 



  // double HOL = 0.04;
  // double alfa = -log10(0.01) / 0.04;
  // double avgAW = GetAW();
  // double AW = alfa * HOL;

  // //Getting spectral efficiency

  // int channelCondition = user->m_channelContition.at(subchannel);
  // AMCModule *amc = user->m_userToSchedule->GetProtocolStack()->GetMacEntity()->GetAmcModule();
  // double spectralEfficiency = GetMacEntity()->GetAmcModule()->GetSinrFromCQI(channelCondition);

  // if (AW < 0.000001)
  //   AW = 0;

  // double AW_avgAW = AW - avgAW;

  // if (AW_avgAW < 0.000001)
  //   AW_avgAW = 0;

  // // metric = exp(AW_avgAW /
  // //              (1 + sqrt(GetAW()))) *
  // //          ((spectralEfficiency * 180000.) /
  // //           bearer->GetAverageTransmissionRate());

  // //Just to debug lets assume a TX rate of 1000

  // metric = exp(AW_avgAW /
  //              (1 + sqrt(GetAW()))) *
  //          ((spectralEfficiency * 180000.)) /
  //           11111;
  
  // std::cout << "---- Metric Exp: " << metric << "---------" << std::endl;
  
  return metric;
}


// double
// UL_EXP_PacketScheduler::GetAW(void) const
// {
//   return m_aW;
// }


