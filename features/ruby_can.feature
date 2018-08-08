Feature: Raw CAN Access for reading and writing CAN Packets
  I want to be able to read raw CAN packets as well as write
  to CAN devices.  I want to be able to setup listeners and
  handle ISO-TP style packets.

  Scenario: See CAN traffic
   Given A steady stream of CAN traffic is on "vcan0" with ID of "312" and data of "010203" is on the network
    When I create a listening socket on "vcan0"
    Then I should see a packet with ID of "312" with a size of 3 and data of "010203"
     And the stream stops
