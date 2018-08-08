require 'bindata'

module RubyCan
  class CanPacket < BinData::Record
    endian :little

    uint32 :can_id
    uint8  :can_dlc

    # The data section is byte aligned so we have 3 bytes here that are not
    # used.
    uint8  :unused, :length => 3

    array  :data, :type => :uint8, :initial_length => :can_dlc
  end
end
